import mimetypes
import os
from Fursuiter.logging import getlogger
from distill.exceptions import HTTPMoved, HTTPForbidden

from passlib.hash import bcrypt

from Fursuiter.sql import Session
from Fursuiter.sql.ORM import User
from Fursuiter.authentication import create_valid_session, LoginRequired

from distill.renderers import renderer


class HomeController(object):
    @renderer('home.mako')
    def GET_home(self, request, response):
        return {}

    @renderer('login.mako')
    def GET_login(self, request, response):
        if request.user is not None:
            return HTTPMoved(request.url('home'))
        return {}

    @renderer('feeds.mako')
    def GET_feeds(self, request, response):
        return {}

    def POST_login(self, request, response):
        if 'username' in request.POST:
            user = Session().query(User).filter(User.username == request.POST['username']).scalar()
            if not user:
            # if not user or not bcrypt.verify(request.POST['password'], user.password):
                request.session.flash('Invalid username or password', 'error')
                return self.GET_login(request, response)
            else:
                request.session['username'] = user.username
                request.user = user

            return HTTPMoved(request.url("home"))
        else:
            return self.GET_login(request, response)

    @LoginRequired()
    def GET_logout(self, request, response):
        if 'token' in request.GET and request.GET['token'] == request.session.get_csrf_token():
            request.session.invalidate()
            del request.session["username"]
            del request.user
            return HTTPMoved(request.url("home"))
        else:
            return HTTPForbidden()


def static(request, response):
    """
    Just for running locally.
    In production requests for static content
    should never hit python, the should instead
    be handled by the webserver
    """
    path = os.path.join(request.settings['staticdir'], request.matchdict['pathspec'])
    if os.path.isfile(path):
        t = mimetypes.guess_type(request.matchdict['pathspec'])
        if t[0]:
            response.headers['Content-Type'] = t[0]
        response.headers['Cache-Control'] = 'max-age=3600'
        response.file = open(path, 'rb')
        response.file_len = os.path.getsize(path)
