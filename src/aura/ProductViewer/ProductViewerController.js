({
    doInit : function(component, event, helper) {
        // for demo, just grab this product by name
        debugger;
        helper.getProduct(component, 'Always Be Yourself');
        helper.getProducts(component);
    },
    change : function(component, event, helper) {
        // get the value of the select option
        debugger;
        var selectedName = event.target.value;
        helper.getProduct(component, selectedName);
    },    
    addToCart : function(component, event, helper) {
       debugger;
       var product = component.get("v.product");
       var evt = $A.get("e.c:AddToCart");
       debugger;
       evt.setParams({
        "product": product
       });
       evt.fire();
    },
})