({
    handleShowMessage : function(component, event, helper) {
         debugger;      
        var product = event.getParam("product");
       component.set('v.message', 'Thanks for adding ' + product.Name);
    },
})