/* The <ad> directive */

app.directive('ad', function(){
	return {
		restrict: 'E',
		template: '<div class="advertisement"></div>'
	}
})