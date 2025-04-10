({
	fetchAccounts : function(component) {
		var action=component.get("c.getAccounts");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                component.set("v.accounts",response.getReturnValue());
            }else if(state==="ERROR"){
                component.set("v.errorMessage",response.getError());
            }
        })
        $A.enqueueAction(action);
	}
})