public class ChartController2 {
public List<Data> getData() {
    return ChartController2.getChartData();
}
@RemoteAction
public static List<Data> getRemoteData() {
    return ChartController2.getChartData();
}
public static List<Data> getChartData() {
    List<Data> data = new List<Data>();
    list<opportunity> oppList = [select closedate, feedback__c, value__c 
        from opportunity where stagename = 'Closed Won' 
        order by closedate desc limit 10];

    for (opportunity opp :oppList) {
        decimal gint = -20;
        decimal sint = -20;
        if (opp.feedback__c == 'Gold') gint = opp.value__c;
        else if (opp.feedback__c == 'Silver') sint = opp.value__c;

        data.add(new Data(opp.closedate.format(), opp.value__c, gint, sint));
    } system.debug (oppList);
    return data;
}
public class Data {
    public String closed { get; set; }
    public decimal stage { get; set; }
    public decimal gold { get; set; }    
    public decimal silver { get; set; }        
    public Data(String closed, decimal stage, decimal gold, decimal silver) {
        this.stage = stage;
        this.closed = closed;
        this.gold = gold;
        this.silver = silver;
}   }   }