/* General module setup */
var app = angular.module('fursuiter', [
	// Please keep this list alphabetized for easier upkeep
	'ngCookies',
	'ui.bootstrap',
	'ui.router'
]);

app.config(['$stateProvider',function($stateProvider){
	$stateProvider

	.state('home',{
		url: "/",
		templateUrl: "/home",
		controller: "HomeCtrl"
	})

	// User

	.state('user',{
		url: "/user/:username",
		templateUrl: function($stateParams){
			return "/user/"+$stateParams.username
		},
		controller: "UserCtrl"
	})

	// Messages

	.state('messages',{
		url: "/messages",
		templateUrl: "/messages"
	})

	// Settings

	.state('settings',{
		abstract: true,
		url: "/settings",
		templateUrl: "/settings",
		controller: "SettingsCtrl"
	})

	.state('settings.none', {
		url: "", // Active when url = "/#/settings"
		template: "<placeholder>Please choose an option from the menu</placeholder>"
	})

	.state('settings.account', {
		url: "/account",
		templateUrl: "/settings/account"
	})
}])

/*app.config(['$routeProvider', function($routeProvider){
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
		.when('/settings/:page', {
			templateUrl: function(params){ return '/settings/'+params.page},
			controller: 'SettingsCtrl'
		})
		.when('/messages/:box', {
			templateUrl: function(params){ return '/messages/'+params.page },
			controller: 'MessagesCtrl'
		})
		.otherwise({
			redirectTo: '/'
		})
}])*/