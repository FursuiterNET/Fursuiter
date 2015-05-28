app.controller('NotificationsCtrl',['$scope','notifications', function($scope){
	$scope.notifications = []

	$scope.fetch = function(){
		$scope.notifications = notifications.fetch()
	}
}])