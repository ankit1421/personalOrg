/**
 * Created by Ankit on 8/31/17.
 */
({
    peekInDom : function (cmp,event,helper){
        console.log("cmp.getElements():" , cmp.getElements());
        console.log(" div1 :" , cmp.find("div1").getElement());
        console.log("button 1 : ",cmp.find("button1") );
        console.log("button Name" , event.getSource().get("v.name"));

        //returns an error
        //console.log("button1 Element : " + cmp.find("button1").getElement());

    }
})