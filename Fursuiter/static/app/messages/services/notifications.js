app.factory('notifications', [function(){
	return {
		fetch: function(){
			// Dummy data for now
			return [{
				id: "133224",
				url: "/#/post/12345",
				username: "dreae",
				content: "Dreae commented on your status update",
				dismissed: 0
			}, {
				id: "133225",
				url: "/#/post/23456",
				username: "jacktail",
				content: "Jack Tail liked your upload",
				dismissed: 0
			}]
		}
	}
}])