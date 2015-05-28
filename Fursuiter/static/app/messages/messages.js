app.controller('messagesCtrl',['$scope','$http',function($scope, $http){
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

		box.messages.push({
			"id": 23456,
			"from_username": "rechner",
			"from_realname": "Rechner Fox",
			"senddate": "14 June 2015",
			"subject": "Another test message",
			"body": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, officiis quisquam ullam quae, aliquam maxime adipisci quas, tempora ad repellat alias ipsa est. Deleniti est repudiandae doloremque aspernatur dolorum consequuntur. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates ut quae nihil suscipit, pariatur vero expedita accusantium consequuntur dolore est illum quidem commodi velit iusto alias iure maxime doloremque perferendis?",
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
}])