/**
 * Created by Ankit on 2/23/18.
 */
({
    updateView : function(component,event,helper){
        var variant = component.get("v.variant"),
        hasVariant = variant == 'warning' || variant == 'expired',
        style = "slds-progress-ring",
        iconName,
        altText;

        if(hasVariant){
            style = style + " " + style + "_" + variant;
            iconName = "utility:" + ({warning:"warning",expired:"error"}[variant]);
            altText = {warning:"warning",expired :"Expired"}[variant];
        }

        console.log(style,hasVariant,iconName,altText);
        component.set("v.ringClass",style);
        component.set("v.hasVariant",hasVariant);
        component.set("v.iconName",iconName);
        component.set("v.altText",altText);

    }

})