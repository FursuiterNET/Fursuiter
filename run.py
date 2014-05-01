# coding=utf-8
from wsgiref.simple_server import make_server
import os

from pyramid.paster import get_app


application = get_app("%s/pyramid.ini" % os.path.dirname(os.path.abspath(__file__)), 'main')
server = make_server('', 5000, application)
server.serve_forever()