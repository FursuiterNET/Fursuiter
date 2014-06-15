from pyramid.config import Configurator
from pyramid.events import NewRequest
from pyramid.renderers import JSON

from Fursuiter import sql
from Fursuiter.sql import ORM
from Fursuiter.authentication import validate_session
from Fursuiter.config import configure
from Fursuiter.session import session_factory_from_settings


def main(global_config, **settings):
    config_ = Configurator(settings=settings)
    # Session factory will need to change, as Jack
    # wants multiple servers serving the site
    config_.set_session_factory(session_factory_from_settings(settings))
    sql.sql_init(config_.registry.settings['sql.dsn'])

    configure(config_)

    # TODO: Refactor subscribers
    config_.add_subscriber(validate_session, NewRequest)
    config_.add_subscriber(sql.start_db_profiling, NewRequest)

    config_.include('pyramid_mako')

    config_.add_renderer('prettyjson', JSON(indent=4))

    config_.add_static_view('/static', 'Fursuiter:static', cache_max_age=3600)

    # TODO: Refactor route definitions (per module?)
    config_.add_route('home', '/')
    config_.add_route('login', '/login')
    config_.add_route('media', '/media/{location}')

    config_.scan('Fursuiter.views')

    return config_.make_wsgi_app()
