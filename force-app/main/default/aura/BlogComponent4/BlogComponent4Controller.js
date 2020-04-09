({
    setArrayValues : function(component, event, helper) {
        if (!component.get("v.sampleArrayAsObject")) {
            component.set("v.sampleArrayAsObject", 
                ["Greetings","From","The","Controller", 
                    new Date().toGMTString()]);
        } else {
            component.set("v.sampleArrayAsObject", null);
        }
    }
})