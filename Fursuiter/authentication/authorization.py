from functools import wraps

from pyramid.httpexceptions import HTTPFound, HTTPForbidden


class LoginRequired(object):
    def __init__(self, level_required=0, redirect_route='login'):
        self._level = level_required
        self._route = redirect_route

    def __call__(self, func):
        @wraps(func)
        def check_auth(req, **kwargs):
            if req.user is None:
                return HTTPFound(location=req.route_url(self._route))
            elif req.user.level < self._level:
                return HTTPForbidden()
            return func(req, **kwargs)

        return check_auth