from distill.application import Distill
from distill.renderers import JSON

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

    return app
