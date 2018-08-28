/**
 * Created by Ankit on 2/21/18.
 */
({
    callMethod:function(component,event,helper){
        var pname = component.get("v.pname");
        var psurname = component.get("v.psurname");
        console.log('com find',component.find("childComp"));
        //console.log('com get',component.get("childComp"));
        var compMethod = component.find("childComp");
        compMethod.amethod('Ankit','Khandelwal');
    }
})