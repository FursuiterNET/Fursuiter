#!/usr/bin/env python
#*-* coding: utf-8 *-*
# Local server will attempt to run using Werkzeug first if available, or
# will fail to a generic WSGIServer. Werkzeug offers niceties like a
# a debugging console and autorealoder.

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

    
parser = SafeConfigParser({'here': os.path.dirname(os.path.abspath(__file__))})
parser.read(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'config.ini'))
config = dict(parser.items('app:main'))

application = main(**config)
DEBUG = config.get('debug')
    
if __name__ == '__main__':
    try:
        from werkzeug.serving import run_simple
        if DEBUG is not None and DEBUG.lower() == "true":
            from werkzeug.debug import DebuggedApplication
            application = DebuggedApplication(application, evalex=True)
        run_simple('0.0.0.0', 8000, application, use_reloader=DEBUG)
        
    except ImportError:
        from wsgiref.simple_server import make_server, WSGIServer
        class ThreadedWSGIServer(ThreadingMixIn, WSGIServer):
            pass
        server = make_server('', 8000, application, server_class=ThreadedWSGIServer)
        server.serve_forever()
