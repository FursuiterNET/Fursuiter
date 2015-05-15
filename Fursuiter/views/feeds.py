from Fursuiter.authentication import create_valid_session, LoginRequired

from distill.renderers import renderer


class FeedsController(object):

	def fetchFeedContent(self, feedName):
		# Please put logic in here for getting feed by feed name

		# Temporary dummy results for model
		return [{
			"id": "12344",
			"edate": "12 May 2015, 4:33 AM",
			"realuser": "Rechner Fox",
			"loweruser": "rechner",
			"content": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Non repellendus neque quas, quis a velit sapiente aspernatur veniam officia tenetur. Dicta corporis soluta consectetur placeat iusto, animi facilis fuga architecto."
		},{
			"id": "12345",
			"edate": "05 May 2015, 7:21 AM",
			"realuser": "Copper Badger",
			"loweruser": "copperbadger",
			"content": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis facere at dignissimos perferendis sed voluptas ab optio, tenetur ea maxime harum quod doloribus nam, perspiciatis cumque, quaerat voluptates quo. Quidem."
		},{
			"id": "12346",
			"edate": "12 April 2015, 4:12 PM",
			"realuser": "Jack Tail",
			"loweruser": "jacktail",
			"content": "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint praesentium repellat quasi exercitationem culpa ex magnam, doloribus ab optio veniam inventore dolorem consectetur, eius perspiciatis. Suscipit voluptatibus iste reprehenderit repudiandae!\n\n Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quas eaque architecto, veritatis dolores corrupti adipisci, quisquam quidem, possimus neque ipsum perspiciatis hic vel ullam dolorem porro sapiente alias a vero."
		}]

	@renderer('feeds/feed.html.mako')
	def GET_popular(self, request, response):
		return {"posts": self.fetchFeedContent("popular")}

	@renderer('feeds/feed.html.mako')
	def GET_recent(self, request, response):
		return {"posts": self.fetchFeedContent("recent")}

	@renderer('feeds/feed.html.mako')
	def GET_social(self, request, response):
		return {"posts": self.fetchFeedContent("social")}

	@renderer('feeds/feed.html.mako')
	def GET_events(self, request, response):
		return {"posts": self.fetchFeedContent("events")}