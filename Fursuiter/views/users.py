from Fursuiter.sql import Session
from Fursuiter.sql.ORM import User
from distill.renderers import renderer
from distill.exceptions import HTTPNotFound


class UsersController(object):
    @renderer("users/user.mako")
    def user(self, request, response):
        user = Session().query(User).filter(User.username == request.matchdict['user']).scalar()
        if not user:
            raise HTTPNotFound()
        return {"user": user}