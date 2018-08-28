Public Class RollUpUtility {   
   
   /**  
    * @author       
    * @date         10/27/2015
    * @description  Used with rollUpTrigger() to house the field names and desired operations
    **/
    public class fieldDefinition {
        public String operation {get;set;}
        public String childField {get;set;}
        public String parentField {get;set;}

        public fieldDefinition (String o, String c, String p) {
            operation = o;
            childField = c;
            parentField = p;
        }
    }

  /**
   * @author       
    * @date         10/27/2015
    * @description  General Utility to Rollup Fields based on a Lookup Relationship.
    *               
    * @params       List of fieldDefinitions to rollup - Includes 3 variables: Operation(String-SUM,MAX,MIN,COUNT), childField(String),parentField(String)
    *               List sObject records - The list of records being passed to the utility. When using with a trigger this can either be trigger.new or trigger.old (for delete)
    *               String childObject - The API name for the child object. This object must have either a look-up or master-detail relationship to a parent object
    *               String childParentLookupField - The API name for the child object field that performs a look-up to a parent object where the summary results will be stored
    *               String parentObject - The API name for the parent object related to the child object. The childParentLookupField variable must be related to the object supplied in this variable.
    *               String queryFilter - SOQL statement that will be used to filter the child object records. The string must always begin with AND if it is being used.
    *                                    If no filter is needed simply supply an empty text value, never supply a NULL value.
    * Vinay - 10/27/2016 - Added currency SUM correction - Salesforce aggregates the currency fields in Company Currency (USD), so added conversion to handle non-USD currency rollups.
    **/
    
    public static void rollUpTrigger(list<fieldDefinition> fieldDefinitions,
                                     list<sObject> records, String childObject, String childParentLookupField,
                                     String parentObject, String queryFilter) {

        //Limit the size of list by using Sets which do not contain duplicate
        //elements prevents hitting governor limits
        set<Id> parentIds = new set<Id>();
        set<String> parentFieldSet = new set<String>();

        for(sObject s : records) {
            parentIds.add((Id)s.get(childParentLookupField));
        }

        //populate query text strings to be used in child aggregrator and
        //parent value assignment
        String fieldsToAggregate = '';
        String parentFields = '';

        for(fieldDefinition d : fieldDefinitions) {
            fieldsToAggregate += d.operation + '(' + d.childField + ') ' +
            ', ';
            parentFields += d.parentField + ', ';
            parentFieldSet.add(d.parentField);
        }
        parentFields += 'CurrencyISOCode, '; //Vinay - added currency code field to query

        //Using dynamic SOQL with aggergate results to populate parentValueMap
        String aggregateQuery = 'Select ' + fieldsToAggregate +
        childParentLookupField + ' from ' + childObject + ' where  ' +
        childParentLookupField + ' IN :parentIds ' + queryFilter + ' ' +
        ' group by ' + childParentLookupField;

        //Map will contain one parent record Id per one aggregate object
        map<Id, AggregateResult> parentValueMap =
        new map <Id, AggregateResult>();

        for(AggregateResult q : Database.query(aggregateQuery)){
            parentValueMap.put((Id)q.get(childParentLookupField), q);
        }

        //list of parent object records to update
        list<sObject> parentsToUpdate = new list<sObject>();

        String parentQuery = 'select ' + parentFields + ' Id ' +
         ' from ' + parentObject + ' where Id IN :parentIds';

        List<sObject> soList = Database.query(parentQuery);
        //Vinay - check if ParentFields has currency data type field and build a map of conversion rate
        /*  Boolean hasCurrencyField = false;
            for(String parentField : parentFieldSet){
                if(getFieldDataType(parentObject, parentField) == 'CURRENCY'){
                    hasCurrencyField = true;
                    break;
                }
            }
             
            Map<String, Decimal> currencyConversionMap = new Map<String, Decimal>();
            if(hasCurrencyField){
            for(sObject s : soList){
                 currencyConversionMap.put(String.ValueOf(s.get('CurrencyISOCode')), 1);
            }
            if(currencyConversionMap != null && !currencyConversionMap.isEmpty()){
                List<CurrencyType> currencyTypes = [select ConversionRate, IsoCode, IsActive from CurrencyType
                                                        where IsActive = true and  IsoCode IN :currencyConversionMap.Keyset()];
                if(currencyTypes != null && !currencyTypes.isEmpty()){
                    for(CurrencyType currencyType : currencyTypes){
                        currencyConversionMap.put(currencyType.IsoCode, currencyType.ConversionRate);
                    }
                }
            } 
        } */
        //for each affected parent object, retrieve aggregate results and
        //for each field definition add aggregate value to parent field
        for(sObject s : soList) {

            Integer row = 0; //row counter reset for every parent record
            for(fieldDefinition d : fieldDefinitions) {
                String field = 'expr' + row.format();
                AggregateResult r = parentValueMap.get(s.Id);
                //r will be null if no records exist
                //(e.g. last record deleted)
                String fieldType;
                if(r != null) {
                    try{
                        Decimal value = ((Decimal)r.get(field) == null ) ? 0 :
                        (Decimal)r.get(field);
                        fieldType = 'Decimal';
                    }
                    catch (TypeException e) {
                        try{
                            Date value = ((Date)r.get(field) == null ) ? null :
                            (Date)r.get(field);
                            fieldType = 'Date';
                        }
                        catch (TypeException e2) {
                        }
                    }
                    if(fieldType == 'Decimal'){
                        Decimal value = ((Decimal)r.get(field) == null ) ? 0 :
                        (Decimal)r.get(field);
                        // Vinay - if parent field is currency then convert the aggregate to record currency as SUM aggregates in company default currency
                       /* if(getFieldDataType(parentObject, d.parentField) == 'CURRENCY' && currencyConversionMap.containsKey(String.valueOf(s.get('CurrencyISOCode'))) ){
                            //query for parent object currencies
                            value = (value * currencyConversionMap.get(String.valueOf(s.get('CurrencyISOCode'))));
                        } */
                        s.put(d.parentField, value);
                    }else if(fieldType == 'Date'){
                        Date value = ((Date)r.get(field) == null ) ? null :
                        (Date)r.get(field);
                        s.put(d.parentField, value);
                    }
                } else {
                    if(fieldType == null || fieldType == 'Decimal')
                         s.put(d.parentField, 0);
                    else if(fieldType == 'Date')
                         s.put(d.parentField, null);
                }
                row += 1; //plus 1 for every field definition after first
            }
            parentsToUpdate.add(s);
        }

        //if parent records exist, perform update of all parent records
        //with a single DML statement
        try{
            if(parentsToUpdate.Size() > 0) {
                update parentsToUpdate;
            }
        }
        catch (Exception e){
                  //  ExceptionLogUtil.logException(UserInfo.getUserId(), null, 'GeneralUtil', 'rollUpTrigger',
                                            // new String[]{e.getMessage(), e.getStackTraceString(), e.getTypeName()}, e.getLineNumber(), null, 'Medium');
        }
    }

    /*
    * @author       
    * @date         10/27/2015
    * @description  get the Datatype of field
    */
    public static String getFieldDataType (String objectName, String fieldName){
        String fieldDataType = '';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        Schema.SObjectType sObjectSchema = schemaMap.get(objectName);
        if(sObjectSchema != null){
            Schema.SObjectField fieldSchema = sObjectSchema.getDescribe().fields.getMap().get(fieldName);
            if(fieldSchema != null){
                Schema.DisplayType fieldDataTypeSchema = fieldSchema.getDescribe().getType();
                if(fieldDataType != null) fieldDataType = String.ValueOf(fieldDataTypeSchema);
            }
        }
        return fieldDataType;
    }
}