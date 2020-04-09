({
	getMyAccounts: function(component) {
        var action = component.get("c.getAccounts"); // name on the apex class
        action.setCallback(this, function(a) {
            component.set("v.twentyAccounts", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }		
})