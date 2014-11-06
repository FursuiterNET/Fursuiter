import time

from Fursuiter.sql.ORM import User
from Fursuiter.sql import Session


def validate_session(request, response):
    request.user = None
    if 'session' not in request.cookies:
        return
    if request.session.new:
        create_valid_session(request)
        return

    if '__created__' not in request.session:
        request.session.invalidate()
        return
    elif int(time.time()) - request.session['__created__'] > request.session._timeout:
        request.session.invalidate()
        return

    if 'username' in request.session:
        user = Session().query(User).filter(User.username == request.session['username']).scalar()
        if not user:
            del request.session['username']
        else:
            request.user = user


def create_valid_session(request):
    request.session['__created__'] = int(time.time())
