from Fursuiter.authentication import create_valid_session, LoginRequired

from distill.renderers import renderer

class MessagesController(object):
	
	@LoginRequired()
	@renderer('messages.mako')
	def messages(self, request, response):
		return {}