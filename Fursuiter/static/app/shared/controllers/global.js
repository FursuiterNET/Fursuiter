/* Global controller, please only use when necessary */
app.controller('GlobalCtrl', ['$scope', '$http', '$cookies', function($scope, $http, $cookies){

  $scope.fetchState = function(){
  	$scope.userState = {
  		"messageCount": 1,
  		"notificationCount": 0
  	}

  	/*$http.get('/user/state').success(function(data){
  		$scope.userState = data
  	})*/
  }

  $scope.userState = {}
  $scope.fetchState()

  $scope.leftbarVisible = $cookies['leftbar-visible']=='true';
  $scope.leftbarToggle = function(){
    $scope.leftbarVisible = !$scope.leftbarVisible
    $cookies['leftbar-visible'] = $scope.leftbarVisible
  }
}])