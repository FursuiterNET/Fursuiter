from passlib.hash import bcrypt

from Fursuiter.sql import Session
from Fursuiter.sql.ORM import User
from distill.renderers import renderer
from distill.exceptions import HTTPNotFound, HTTPMoved


class UsersController(object):
    @renderer("users/user.mako")
    def user(self, request, response):
        user = Session().query(User).filter(User.username == request.matchdict['user']).scalar()
        if not user:
            raise HTTPNotFound()
        return {"user": user}

    @renderer("users/register.mako")
    def GET_register(self, request, response):
        if request.user is not None:
            return HTTPMoved(request.url("home"))
        return {}

    def POST_register(self, request, response):
        # Check that all required fields (username, password and confirmation
        # of password) are present.
        if not all([item in request.POST for item in
                ('username', 'password', 'password_confirm')]):
            request.session.flash('Please fill in all required fields.',
                    'error')
            return self.GET_register(request, response)
        # Check that the password is confirmed to be correct.
        if request.POST['password'] != request.POST['password_confirm']:
            request.session.flash(
                    ('Password and confirmation are not the same. '
                    'Please try again.'),
                    'error')
            return self.GET_register(request, response)
        # Check that the username has not already been taken.
        existing_user = Session().query(User).filter(
                User.username == request.POST['username']).scalar()
        if existing_user:
            request.session.flash('Username is already taken, sorry.',
                    'error')
            return self.GET_register(request, response)
        # Create the user.
        user = User(username = request.POST['username'],
                password = bcrypt.encrypt(request.POST['password']),
                email = request.POST['email'] if 'email' in request.POST else None,
                realname = request.POST['realname'] if 'realname' in request.POST else None,
                level = 1)
        session = Session()
        session.add(user)
        session.commit()
        # Redirect to home page via /login (FIXME?)
        return HTTPMoved(request.url('login'))
