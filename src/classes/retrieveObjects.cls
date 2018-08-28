public class retrieveObjects
{

    
     public String select_obj {get;set;}
     public map <String, schema.sObjectType> all_obj = schema.getGlobalDescribe();
     public Schema.SObjectType selected_object;
     //public List <Schema.DescribeFieldResult> Fields_info;
     //list<list<string>> lstOflst = new list<list<string>> ();
       public list <retrieveObjects> lst_obj;
       public String Field_Name{get;set;}
       public String Field_Label{get;set;}
       public Integer Field_length{get;set;}
       public Schema.DisplayType Field_Type {get;set;}
       public String Render_Type { get; set; }
       public List<SelectOption> getopt ()
         {  
             DescribeSObjectResult objDescribeResult;
             List<SelectOption> opt = new list<SelectOption>();
             opt.add(new SelectOption('-- NONE --','-- NONE --'));
             for ( Schema.SObjectType sobj : all_obj.values())
                     {
                         objDescribeResult = sobj.getDescribe();
                         opt.add(new SelectOption(objDescribeResult.getLabel(),objDescribeResult.getLabel()));
                     }
            return opt;
         } 
   public  void DisplayFields()
     
     {
             DescribeSObjectResult objDescribeResult;
             list <Schema.DescribeFieldResult>   Fields_info = new list <Schema.DescribeFieldResult>();
             lst_obj = new list <retrieveObjects> ();
              System.debug('Check for the values og the MAP' +all_obj.values());
             for ( Schema.SObjectType sobj : all_obj.values())
                 {
                   objDescribeResult = sobj.getDescribe(); 
                    if (objDescribeResult.getLabel()== select_obj )
                    {
                        selected_object = objDescribeResult.getSobjectType();
                      //  system.debug(selected_object);
                     }
                 }
            //  system.debug('check the value' + select_obj);
             if (select_obj != null)
             {
                 objDescribeResult = selected_object.getDescribe();
                 Map<String, Schema.SObjectField> M = objDescribeResult.fields.getMap();
                 for (Schema.SObjectField Field_details : M.values())
                 {
                    Fields_info.add(Field_details.getDescribe());
                    system.debug('check the detail of the fields' + Fields_info);
                 }
                
                 for (integer i=0;i<Fields_info.size();i++)
                 {
                    retrieveObjects temp_obj = new retrieveObjects ();
                    temp_obj.Field_Label = Fields_info[i].getLabel (); 
                    temp_obj.Field_Name =  Fields_info[i].getName();
                    temp_obj.Field_length =  Fields_info[i].getLength();
                    temp_obj.Field_Type =  Fields_info[i].getType();
                    lst_obj.add(temp_obj);
                 }   
            } 
        
         } 
       
        public list <retrieveObjects> getlst_obj()
       {
         return lst_obj;
       }
       
       
       public Void Check_Type() {
         Render_Type = 'application/vnd.ms-excel';
    }
        
}