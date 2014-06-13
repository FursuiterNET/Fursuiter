from pyramid.view import view_config
from passlib.hash import bcrypt

from Fursuiter.sql import Session
from Fursuiter.sql.ORM import User
from Fursuiter.authentication import create_valid_session


@view_config(route_name='home', renderer='Fursuiter:templates/home.mako')
def home(request):
    return {}


@view_config(route_name='login', renderer='Fursuiter:templates/login.mako')
def login(request):
    if 'username' in request.POST:
        user = Session.query(User).filter(User.username == request.POST['username']).scalar()
        if not user or not bcrypt.verify(request.POST['password'], user.password):
            request.session.flash('Invalid username or password', 'error')
        else:
            create_valid_session(request)
            request.session['username'] = user.username
            request.user = user

        return {"username": request.POST['username'],
                "password": request.POST['password']}

    return {}
    
