app.controller('HomeCtrl',['$scope',function($scope){
  // Here for possible future
}])

app.controller('FeedsCtrl', ['$scope','$http','userSession',function($scope, $http, userSession){
  $http.get('/static/config/feeds.json').success(function(data){
    $scope.feeds = data;
    $scope.fetch($scope.feeds[0])
  })

  // Called when tab is clicked
  $scope.fetch = function(feed){

    $scope.visibleFeed = feed

    feed.posts.push({
      id: "12345",
      username: "copperbadger",
      realname: "Copper Badger",
      edate: "17 May 2015",
      content: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates nisi harum dolore, ea aperiam eligendi dolorem officiis. Sapiente corporis reiciendis, debitis magni possimus molestiae! Esse vel illum, quasi a deleniti."
    });

    feed.posts.push({
      id: "23456",
      username: "jacktail",
      realname: "Jack Tail",
      edate: "21 May 2015",
      content: "Testing testing testing..."
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

  $scope.sendPost = function(post){

    // Temporary solution; this object will eventually come from the server after a request
    edate = ""
    {
      t = (new Date()).toDateString().split(' ')
      edate += [t[2],t[1],t[3]].join(' ')
    }
    $scope.visibleFeed.posts.push({
      id: "abc123",
      username: userSession.username,
      realname: userSession.realname,
      edate: edate,
      content: post.content
    })

    // Reset post form
    $scope.post = {}
  }
}])