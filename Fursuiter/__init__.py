from pyramid.config import Configurator
from pyramid.events import NewRequest
from pyramid.renderers import JSON
from pyramid_beaker import session_factory_from_settings

from Fursuiter import sql
from Fursuiter.sql import ORM
from Fursuiter.authentication import validate_session


def main(global_config, **settings):
    config = Configurator(settings=settings)
    config.set_session_factory(session_factory_from_settings(settings))
    sql.sql_init(config.registry.settings['sql.dsn'])

    config.add_subscriber(validate_session, NewRequest)
    config.add_subscriber(sql.start_db_profiling, NewRequest)

    config.include('pyramid_mako')
    config.include('pyramid_beaker')

    config.add_renderer('prettyjson', JSON(indent=4))

    config.add_static_view('/static', 'Fursuiter:static', cache_max_age=3600)

    config.add_route('home', '/')
    config.scan('Fursuiter.views')

    return config.make_wsgi_app()