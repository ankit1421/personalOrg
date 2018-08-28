({
    doInit : function(component,event,helper){
        var sampleStr = component.get("v.sampleString");
        var sampleNum = component.get("v.sampleNumber");
        var sampleLst = component.get("v.sampleList");
        var sampleVariable = component.get('v.sampleVariable');

        console.log('Here are the values of different attribute','1) ' ,
                    sampleStr, '2) ',
                    sampleNum, '3) ', sampleLst, 
                    '4) ', sampleVariable);

        
        // find the blank div
        var sampleDiv = component.find('sampleDiv');
        console.log('--sampleDiv---', sampleDiv);
		console.log('Sample div values', sampleDiv.get("v.value"));
        
        // find the div with Duplicates Ids
        var sampleDivDuplicate = component.find('sampleDivDup');
        console.log('--sampleDivDuplicate---', sampleDivDuplicate);
        //console.log('Sample div Dup values', sampleDivDuplicate[0].get("v.value"));

        // find the div with a button in it
        var sampleDivBtn = component.find('sampleDivButton');
        console.log('--sampleDivButton---', sampleDivBtn);

        // find the button component
        var sampleBtn = component.find('sampleButton');
        console.log('--sampleButton---', sampleBtn);
		
        // find the div with the input as a child
        var sampleDivInp = component.find('sampleDivInput');
        console.log('--sampleDivInput---', sampleDivInp);
		
        // find the lightning input component.
        var sampleInput = component.find('fname');
        console.log('--Sample Input---', sampleInput);

    }
})