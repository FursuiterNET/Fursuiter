/*
	The <post> directive
*/

app.directive('post', function(){
	return {
		restrict: "E",
		scope: {
			post: '=src'
		},
		templateUrl: '/static/app/shared/directives/templates/post.html'
	}
})