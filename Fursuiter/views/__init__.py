from distill.exceptions import HTTPNotFound, HTTPForbidden
from .front import *
from .errors import *


def add_controllers(app_):
    from .front import HomeController

    loc = locals().copy()
    del loc['app_']
    [app_.add_controller(name.lower(), obj) for name, obj in loc.items()]


def map_routes(app):
    app.map_connect('home', '/', controller='homecontroller', action='GET_home')
    app.map_connect('login', '/login', controller='homecontroller', action='GET_login', conditions={"method": "GET"})
    app.map_connect('login', '/login', controller='homecontroller', action='POST_login', conditions={"method": "POST"})
    app.map_connect('upload', '/upload', controller='homecontroller', action='upload')
    app.map_connect('static', '/static/{pathspec:.+}', action=static)

    app.on_except(HTTPNotFound, notfound)
    app.on_except(HTTPForbidden, forbidden)
