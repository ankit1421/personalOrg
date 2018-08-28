({
    doInt: function(component,event,helper){
             helper.getAccountList(component);
      },
     showDetails:function(component,event,helper){
            var id = event.target.getAttribute("data-data") ||event.target.parentnode.getAttribute("data-data");
           alert("id was passed" + id);
     } 


})