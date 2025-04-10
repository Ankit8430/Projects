({
	callServerMethod : function(component) {
		var action=component.get("c.getServerMessage");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==="SUCCESS"){
                component.set("v.serverMessage",response.getReturnValue());
            }else{
                console.error('Error =:'+response.getError());
            }
        });
     	$A.enqueueAction(action);   
	}
})