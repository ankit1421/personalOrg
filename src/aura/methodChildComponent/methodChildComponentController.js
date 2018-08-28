/**
 * Created by Ankit on 2/21/18.
 */
({
    executemethod: function(component,event,helper){
        var params = event.getParam('arguments');
        console.log('Here is the Full Name', params.name + params.surname);
    }
})