app.filter('reverse', function(){
	return function(input){
		return input.slice().reverse()
	}
})