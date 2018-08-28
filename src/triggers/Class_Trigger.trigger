trigger Class_Trigger on Account (before update,after update) {
account a ;
for (account obj: Trigger.new) {
    a = Trigger.oldMap.get(obj.id);
}
   system.debug('aaaa'  + a );
}