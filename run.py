from wsgiref.simple_server import make_server, WSGIServer
try:
    from socketserver import ThreadingMixIn
except ImportError:
    from SocketServer import ThreadingMixIn
try:
    from ConfigParser import SafeConfigParser
except ImportError:
    from configparser import ConfigParser as SafeConfigParser
import os

from Fursuiter import main


class ThreadedWSGIServer(ThreadingMixIn, WSGIServer):
    pass

parser = SafeConfigParser({'here': os.path.dirname(os.path.abspath(__file__))})
parser.read(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'config.ini'))
application = main(**dict(parser.items('app:main')))
server = make_server('', 5000, application, server_class=ThreadedWSGIServer)
server.serve_forever()