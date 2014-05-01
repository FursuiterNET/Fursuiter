from Fursuiter.sql.ORM import User
from Fursuiter import Session


def get_auth_level(userid, request):
    if hasattr(request, 'auth_level'):
        return [request.auth_level]
    user = Session.query(User).filter(User.username == userid).scalar()
    if user:
        request.auth_level = user.level
        request.user = user
        return [user.level]

    request.user = None
    request.auth_level = None
    return None