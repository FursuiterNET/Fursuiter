from distill.application import Distill
from distill.renderers import JSON
from distill.exceptions import HTTPNotFound, HTTPForbidden

from Fursuiter import sql
from Fursuiter.sql import ORM
from Fursuiter.authentication import validate_session
from Fursuiter.config import configure
from Fursuiter.session import session_factory_from_settings
from Fursuiter.views import notfound, forbidden, static


def main(**settings):
    app = Distill(settings=settings)
    app.set_session_factory(session_factory_from_settings(settings))
    sql.sql_init(settings['sql.dsn'])

    configure(app)

    # TODO: Refactor subscribers
    app.use(validate_session)
    app.use(sql.start_db_profiling)

    app.add_renderer('prettyjson', JSON(indent=4))

    # TODO: Refactor route definitions (per module?)
    app.map_connect('home', '/', controller='homecontroller', action='GET_home')
    app.map_connect('login', '/login', controller='homecontroller', action='GET_login', conditions={"method": "GET"})
    app.map_connect('login', '/login', controller='homecontroller', action='POST_login', conditions={"method": "POST"})
    app.map_connect('static', '/static/{pathspec:.+}', action=static)

    app.on_except(HTTPNotFound, notfound)
    app.on_except(HTTPForbidden, forbidden)

    return app
