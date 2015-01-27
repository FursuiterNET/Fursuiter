from Fursuiter.authentication import create_valid_session, LoginRequired

from distill.renderers import renderer

class SettingsController(object):
	
	@LoginRequired()
	@renderer('settings.mako')
	def GET_settings(self, request, response):
		return {}