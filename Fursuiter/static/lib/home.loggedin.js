app.controller('feedsCtrl', function($scope, $http){
  $http.get('/static/config/feeds.json').success(function(data){
    $scope.feeds = data;
    $scope.fetch($scope.feeds[0])
  })


  $scope.show = function(feed) {
    $scope.visibleFeed = feed
  }

  $scope.fetch = function(feed){
    feed.posts.push({
      id: "12345",
      username: "copperbadger",
      realname: "Copper Badger",
      edate: "17 May 2015",
      content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates nisi harum dolore, ea aperiam eligendi dolorem officiis. Sapiente corporis reiciendis, debitis magni possimus molestiae! Esse vel illum, quasi a deleniti."
    });
    
    // Enable when backend starts giving us JSON
    /*$scope.loading = true
    $http.post('/feeds/'+feed.id, {cursor: feed.cursor}).success(function(data){
      $scope.loading = false
      feed.posts = data.posts
    }).error(function(){
      $scope.loading = false
    })*/
  }
})