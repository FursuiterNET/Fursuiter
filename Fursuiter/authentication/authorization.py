from distill.exceptions import HTTPMoved, HTTPForbidden
from distill.request import Request
import logging

logger = logging.getLogger(__name__)

class LoginRequired(object):
    def __init__(self, level_required=0, redirect_route='login'):
        self._level = level_required
        self._route = redirect_route

    def __call__(self, func):
        def check_auth(*args, **kwargs):
            if isinstance(args[0], Request):
                req = args[0]
            else:
                req = args[1]
            if req.user is None:
                logger.debug("No user on req %s" % req)
                return HTTPMoved(location=req.url(self._route))
            elif req.user.level < self._level:
                return HTTPForbidden()
            return func(*args, **kwargs)

        return check_auth