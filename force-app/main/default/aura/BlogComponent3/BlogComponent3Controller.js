({
    doInit: function(component, event, helper) {
    	component.set("v.setMeOnInit", "Initialized on " + (new Date().toGMTString()));
    }
})