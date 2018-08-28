/**
 * Created by Ankit on 3/19/18.
 */

public class RecordTypeController {

    public static Map<Id,string> recordTypeMap;

    @AuraEnabled
    public static List<string> recordTypeValues(){
        recordTypeMap = new Map<Id,String>();
        List<schema.RecordTypeInfo> rtInfos = Account.SObjectType.getDescribe().getRecordTypeInfos();
        for(RecordTypeInfo rt : rtInfos){
            if(!rt.isMaster()) recordTypeMap.put(rt.getRecordTypeId(),rt.getName());
        }
        return recordTypeMap.values();
    }

    @AuraEnabled
    public static Id getRecTypeId (string rtLabel){
        Id recId =  Schema.sObjectType.Account.getRecordTypeInfosByName().get(rtLabel).getRecordTypeId();
        system.debug('---recId---' + recId);
        return recId;

    }

}