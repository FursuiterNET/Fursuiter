from distill.exceptions import HTTPNotFound, HTTPForbidden
from .front import *
from .errors import *


def add_controllers(app_):
    from .front import HomeController
    from .users import UsersController
    from .controls import UploadController
    from .media import MediaController
    from .characters import CharactersController
    from .messages import MessagesController
    from .settings import SettingsController
    from .feeds import FeedsController
    from .gallery import GalleryController

    loc = locals().copy()
    del loc['app_']
    [app_.add_controller(name.lower(), obj) for name, obj in loc.items()]


def map_routes(app):
    app.map_connect('home', '/', controller='homecontroller', action='GET_home')
    app.map_connect('login', '/login', controller='homecontroller', action='GET_login', conditions={"method": "GET"})
    app.map_connect('login', '/login', controller='homecontroller', action='POST_login', conditions={"method": "POST"})
    app.map_connect('logout', '/logout', controller='homecontroller', action='GET_logout')

    app.map_connect('register', '/register', controller='userscontroller', action='GET_register',
                    conditions={"method": "GET"})
    app.map_connect('register', '/register', controller='userscontroller', action='POST_register',
                    conditions={"method": "POST"})

    app.map_connect('upload_image', '/submit/image', controller='uploadcontroller', action='GET_upload_image',
                    conditions={"method": "GET"})
    app.map_connect('upload_image', '/submit/image', controller='uploadcontroller', action='POST_upload_image',
                    conditions={"method": "POST"})

    app.map_connect('static', '/static/{pathspec:.+}', action=static)
    app.map_connect('media', '/media/:image', controller='mediacontroller', action='media')
    app.map_connect('user', '/user/:user', controller='userscontroller', action='user')

    app.map_connect('character', '/user/:user/character/:character',
                    controller='characterscontroller', action='character')
    app.map_connect('character', '/user/:user/characters/create',
                    controller='characterscontroller', action='create_character',
                    conditions={"method": "POST"})

    app.map_connect('user', '/users/usernameExists',
                    controller='userscontroller', action='POST_namecheck',
                    conditions={"method": "POST"})

    app.map_connect('user', '/profile', controller='userscontroller', action='GET_sessionUser')

    app.map_connect('messages', '/messages', controller='messagescontroller', action='messages',
                    conditions={"method": "GET"})
    # app.map_connect('feeds', '/feeds', controller='homecontroller', action='GET_home', conditions={"method":"GET"})
    app.map_connect('notifications', '/notifications', controller='messagescontroller', action='notifications')

    # Feeds
    app.map_connect('feedpopular', '/feeds/popular', controller='feedscontroller', action='GET_popular',
                    condition={"method": "GET"})
    app.map_connect('feedrecent', '/feeds/recent', controller='feedscontroller', action='GET_recent',
                    condition={"method": "GET"})
    app.map_connect('feedsocial', '/feeds/social', controller='feedscontroller', action='GET_social',
                    condition={"method": "GET"})
    app.map_connect('feedevents', '/feeds/events', controller='feedscontroller', action='GET_events',
                    condition={"method": "GET"})

    # Settings Pages
    app.map_connect('settings', '/settings', controller='settingscontroller', action='GET_settings',
                    conditions={"method": "GET"})
    # app.map_connect('settings', '/settings', controller='settingscontroller', action='POST_settings', conditions={"method":"POST"})
    app.map_connect('settingsaccount', '/settings/account', controller='settingscontroller', action='GET_account',
                    conditions={"method": "GET"})
    app.map_connect('settingsprofile', '/settings/profile', controller='settingscontroller', action='GET_profile',
                    conditions={"method": "GET"})
    app.map_connect('settingsprivacy', '/settings/privacy', controller='settingscontroller', action='GET_privacy',
                    conditions={"method": "GET"})

    # Gallery Pages
    app.map_connect('samplegallery', '/gallery', controller='gallerycontroller', action='GET_sampleGallery',
                    conditions={"METHOD": "GET"})

    app.on_except(HTTPNotFound, notfound)
    app.on_except(HTTPForbidden, forbidden)
