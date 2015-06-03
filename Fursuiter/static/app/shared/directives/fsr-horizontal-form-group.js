app.directive('horizontalformgroup',function(){ // 'fsr-horizontal-form-group' didn't work, I don't know why.
	return {
		restrict: 'E',
		scope: {
			name: '@',
			label: '@',
			type: '@'
		},
		templateUrl: "/static/app/shared/directives/templates/fsr-horizontal-form-group.html"
	}
})