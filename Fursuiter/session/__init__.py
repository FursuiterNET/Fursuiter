try:
    import cPickle as pickle
except ImportError:
    import pickle
from functools import wraps
from hashlib import sha256
import base64
import os

import redis

from Fursuiter.authentication import create_valid_session


def modified(func):
    @wraps(func)
    def access(session, *args, **kwargs):
        if not session.dirty:
            session.dirty = True

            def save_session(request, response):
                create_valid_session(request)
                session.save(response)

            session.request.add_response_callback(save_session)
        return func(session, *args, **kwargs)

    return access


# noinspection PyPep8Naming
def RedisSessionFactory(r,
                        timeout=31556940,
                        cookie_name='session',
                        cookie_path="/",
                        cookie_domain=None):
    class RedisSessionObject(dict):
        _cookie_name = cookie_name
        _cookie_domain = cookie_domain
        _cookie_path = cookie_path
        _timeout = int(timeout)

        def __init__(self, request):
            self.request = request
            self.new = True
            self.dirty = False
            self.ssid = request.cookies.get(self._cookie_name)
            data = {}

            if self.ssid:
                saved_data = r.get(self.ssid)
                if saved_data:
                    data = pickle.loads(saved_data)
                    self.new = False

            dict.__init__(self, data)

        def changed(self):
            return self.dirty

        def invalidate(self):
            self.request.response.set_cookie(self.ssid, '', 0)
            r.delete(self.ssid)

        get = dict.get
        __getitem__ = dict.__getitem__
        items = dict.items
        __iter__ = dict.__iter__
        values = dict.values
        keys = dict.keys
        __contains__ = dict.__contains__
        __len__ = dict.__len__

        clear = modified(dict.clear)
        update = modified(dict.update)
        setdefault = modified(dict.setdefault)
        pop = modified(dict.pop)
        popitem = modified(dict.popitem)
        __setitem__ = modified(dict.__setitem__)
        __delitem__ = modified(dict.__delitem__)

        def flash(self, msg, queue='', allow_duplicate=True):
            msgs = self.setdefault('_f_' + queue, [])
            if allow_duplicate or msg not in msgs:
                msgs.append(msg)

        def pop_flash(self, queue=''):
            return self.pop('_f_' + queue, [])

        def peek_flash(self, queue=''):
            return self.get('_f_' + queue, [])

        def new_csrf_token(self):
            token = base64.b64encode(os.urandom(32))
            self['__csrft__'] = token
            return token

        def get_csrf_token(self):
            token = self.get('__csrft__', None)
            if token is None:
                token = self.new_csrf_token()
            return token

        def save(self, response):
            if self.ssid is None:
                # No garuntee that there will be no duplicates
                # but with 256 bits of entropy we can be fairly
                # certain
                self.ssid = sha256(os.urandom(32)).hexdigest()
            r.set(self.ssid, pickle.dumps(dict(self)))
            response.set_cookie(self._cookie_name, self.ssid, max_age=self._timeout,
                                path=self._cookie_path, domain=self._cookie_domain)

    return RedisSessionObject


def session_factory_from_settings(settings):
    options = {}
    roptions = {}

    for k, v in settings.items():
        if k.startswith('session.'):
            option_name = k[len('session.'):]
            options[option_name] = v
        elif k.startswith('session.redis.'):
            option_name = k[len('session.redis.')]
            roptions[option_name] = v

    r = redis.Redis(**roptions)

    return RedisSessionFactory(r, **options)