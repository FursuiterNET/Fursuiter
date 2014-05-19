from pyramid.view import view_config

from Fursuiter.sql import Session
from Fursuiter.sql.ORM import User


@view_config(route_name='home', renderer='prettyjson')
def home(request):
    Session.query(User).all()
    return {"Hello": "World"}

