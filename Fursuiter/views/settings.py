from Fursuiter.authentication import create_valid_session, LoginRequired

from distill.renderers import renderer

class SettingsController(object):
    
    @LoginRequired()
    @renderer('settings.mako')
    def GET_settings(self, request, response):
        return {}

    @LoginRequired()
    def POST_settings(self, request, response):
        raise HTTPErrorResponse("501 Not Implemented",
            "501 Not Implemented", "NotImplemented")
