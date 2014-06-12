from functools import wraps

from pyramid.httpexceptions import HTTPFound, HTTPForbidden


class LoginRequired(object):
    def __init__(self, level_required=0):
        self._lavel = level_required

    def __call__(self, func):
        @wraps(func)
        def check_auth(req, **kwargs):
            if req.user is None:
                return HTTPFound(location=req.route_url('home'))
            elif req.user.level < self._lavel:
                return HTTPForbidden()
            return func(req, **kwargs)

        return check_auth