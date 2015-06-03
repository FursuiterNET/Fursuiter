app.directive('horizontalformbutton', function(){
	return {restrict: 'E',
	scope: {
		label: '@',
		type: '@',
		btnclass: '@'
	},
	templateUrl: '/static/app/shared/directives/templates/fsr-horizontal-form-button.html'}
})