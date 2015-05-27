app.controller('messagesCtrl',function($scope, $http){
	$http.get('/static/config/messages.json').success(function(data){
		$scope.boxes = data
		$scope.fetch($scope.boxes[0])
	})

	$scope.show = function(box){
		$scope.visibleBox = box
	}

	$scope.fetch = function(box){
		box.messages.push({
			"id": 12345,
			"from_username": "insomnicon",
			"from_realname": "Insomnicon Fuzzy",
			"senddate": "07 June 2015",
			"subject": "Test Message",
			"body": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo minus eius illum voluptatem, unde temporibus quidem nostrum omnis tempore ex, maxime aliquid dolor voluptatum nemo sed labore ad alias molestiae.",
			"selected": false,
			"isUnread": true
		})
		// For when server gives us data in JSON
		/*$scope.loading = true
		$http.get('/messages/'+box.id).success(function(data){
			$scope.loading = false
			box.messages = data
		})*/
	}
})