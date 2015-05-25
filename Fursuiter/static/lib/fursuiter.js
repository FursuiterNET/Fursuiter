var app = angular.module('fursuiter', ['ngCookies', 'ui.bootstrap']);

/* Global controller, please only use when necessary */
app.controller('globalCtrl', function($scope, $cookies){
  $scope.leftbarVisible = $cookies['leftbar-visible']=='true';
  $scope.leftbarToggle = function(){
    $scope.leftbarVisible = !$scope.leftbarVisible
    $cookies['leftbar-visible'] = $scope.leftbarVisible
  }
})

app.controller('navbarCtrl', function($scope){
  // Live search stuff will go here
})