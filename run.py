from socketserver import ThreadingMixIn
from wsgiref.simple_server import make_server, WSGIServer
import os

from pyramid.paster import get_app


class ThreadedWSGIServer(ThreadingMixIn, WSGIServer):
    pass


application = get_app("%s/pyramid.ini" % os.path.dirname(os.path.abspath(__file__)), 'main')
server = make_server('', 5000, application, server_class=ThreadedWSGIServer)
server.serve_forever()