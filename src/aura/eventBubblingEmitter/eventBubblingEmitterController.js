/**
 * Created by Ankit on 8/28/17.
 */
({
    fireEvent : function(cmp,event){
        var cmpEvent =  cmp.getEvent('bubblingEvent');
        cmpEvent.fire();
    }
})