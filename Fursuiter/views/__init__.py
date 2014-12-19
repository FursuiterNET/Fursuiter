from distill.exceptions import HTTPNotFound, HTTPForbidden
from .front import *
from .errors import *


def add_controllers(app_):
    from .front import HomeController
    from .users import UsersController
    from .controls import UploadController
    from .media import MediaController
    from .characters import CharactersController

    loc = locals().copy()
    del loc['app_']
    [app_.add_controller(name.lower(), obj) for name, obj in loc.items()]


def map_routes(app):
    app.map_connect('home', '/', controller='homecontroller', action='GET_home')
    app.map_connect('login', '/login', controller='homecontroller', action='GET_login', conditions={"method": "GET"})
    app.map_connect('login', '/login', controller='homecontroller', action='POST_login', conditions={"method": "POST"})
    app.map_connect('logout', '/logout', controller='homecontroller', action='GET_logout')

    app.map_connect('register', '/register', controller='userscontroller', action='GET_register', conditions={"method": "GET"})
    app.map_connect('register', '/register', controller='userscontroller', action='POST_register', conditions={"method": "POST"})

    app.map_connect('upload_image', '/submit/image', controller='uploadcontroller', action='GET_upload_image',
                    conditions={"method": "GET"})
    app.map_connect('upload_image', '/submit/image', controller='uploadcontroller', action='POST_upload_image',
                    conditions={"method": "POST"})

    app.map_connect('static', '/static/{pathspec:.+}', action=static)
    app.map_connect('media', '/media/:image', controller='mediacontroller', action='media')
    app.map_connect('user', '/user/:user', controller='userscontroller', action='user')

    app.map_connect('character', '/user/:user/character/:character',
            controller='characterscontroller', action='character')

    app.map_connect('user', '/users/usernameExists',
            controller='userscontroller', action='POST_namecheck',
            conditions={"method": "POST"})

    app.on_except(HTTPNotFound, notfound)
    app.on_except(HTTPForbidden, forbidden)
