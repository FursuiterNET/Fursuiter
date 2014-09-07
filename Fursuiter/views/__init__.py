from .front import *
from .errors import *


def add_controllers(app_):
    from .front import HomeController

    loc = locals().copy()
    del loc['app_']
    [app_.add_controller(name.lower(), obj) for name, obj in loc.items()]
