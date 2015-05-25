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

app.controller('feedsCtrl', function($scope, $http){
  $scope.feeds = [
    {
      id: "featured",
      label: "Featured",
      icon: "home",
      posts: [],
      cursor: 0
    },
    {
      id: "friends",
      label: "Friends",
      icon: "user",
      posts: [],
      cursor: 0
    },
    {
      id: "following",
      label: "Following",
      icon: "star",
      posts: [],
      cursor: 0
    },
    {
      id: "events",
      label: "Events",
      icon: "calendar",
      posts: [],
      cursor: 0
    },
    {
      id: "groups",
      label: "Groups",
      icon: "th-large",
      posts: [],
      cursor: 0
    },
    {
      id: "network",
      label: "Network",
      icon: "globe",
      posts: [],
      cursor: 0
    }
  ];


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

  $scope.fetch($scope.feeds[0])
})