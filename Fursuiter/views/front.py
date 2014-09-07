import mimetypes
import os

from passlib.hash import bcrypt

from Fursuiter.sql import Session
from Fursuiter.sql.ORM import User
from Fursuiter.authentication import create_valid_session

from distill.renderers import renderer


class HomeController(object):
    @renderer('home.mako')
    def GET_home(self, request, response):
        return {}

    @renderer('login.mako')
    def GET_login(self, request, response):
        return {}
    
    @renderer('login.mako')
    def POST_login(self, request, response):
        if 'username' in request.POST:
            user = Session().query(User).filter(User.username == request.POST['username']).scalar()
            if not user or not bcrypt.verify(request.POST['password'], user.password):
                request.session.flash('Invalid username or password', 'error')
            else:
                create_valid_session(request)
                request.session['username'] = user.username
                request.user = user

            return {"username": request.POST['username'],
                    "password": request.POST['password']}


def static(request, response):
    path = os.path.join(request.settings['staticdir'], request.matchdict['pathspec'])
    if os.path.isfile(path):
        t = mimetypes.guess_type(request.matchdict['pathspec'])
        if t[0]:
            response.headers['Content-Type'] = t[0]
        response.headers['Cache-Control'] = 'max-age=3600'
        response.file = open(path, 'rb')
        response.file_len = os.path.getsize(path)