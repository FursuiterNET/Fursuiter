/* General module setup */
var app = angular.module('fursuiter', [
	// Please keep this list alphabetized for easier upkeep
	'ngCookies',
	'ngRoute',
	'ui.bootstrap'
]);

app.config(['$routeProvider', function($routeProvider){
	// Note: template URLs must be directed to a mapped route on the server; no partials.
	$routeProvider
		.when('/', {
			templateUrl: "/home",
			controller: 'HomeCtrl'
		})
		.when('/user/:username', {
			templateUrl: function(params){ return '/user/'+params.username},
			controller: 'UserCtrl'
		})
		.otherwise({
			redirectTo: '/'
		})
}])