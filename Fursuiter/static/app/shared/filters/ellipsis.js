app.filter('ellipsis', function(){
	return function(input){
		return (input.length>80)?(input.slice(0,80)+"..."):input
	}
})