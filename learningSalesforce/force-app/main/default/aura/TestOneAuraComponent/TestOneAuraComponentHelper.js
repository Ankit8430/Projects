({
	fetchDataFromApex : function(component) {
		var action=component.get('c.getMessage');
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                component.set("v.message",response.getReturnValue());
            }else{
                console.error('Error =:'+response.getError());
            }
        })
        $A.enqueueAction(action);
	}
})