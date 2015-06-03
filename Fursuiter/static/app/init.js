/* General module setup */
var app = angular.module('fursuiter', [
	// Please keep this list alphabetized for easier upkeep
	'ngCookies',
	'ui.bootstrap',
	'ui.router'
]);

app.config(['$stateProvider', '$urlRouterProvider', function($stateProvider,$urlRouterProvider){

	// --- States (aka, Routes)

	$stateProvider

	.state('home',{
		url: "/",
		templateUrl: "/home",
		controller: "HomeCtrl"
	})

	// Login & Registration

	.state('home.login',{
		url: "^/login",
		templateUrl: "/login"
	})

	.state('home.register',{
		url: "^/register",
		templateUrl: "/register"
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

	.state('notifications',{
		url: "/notifications",
		templateUrl: "/notifications"
	})

	// Settings (uses nesting views)

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

	.state('settings.profile', {
		url: "/profile",
		templateUrl: "/settings/profile"
	})

	.state('settings.privacy', {
		url: "/privacy",
		templateUrl: "/settings/privacy"
	})

	$urlRouterProvider.otherwise('/')

}])