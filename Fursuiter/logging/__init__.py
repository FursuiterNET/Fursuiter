class LogLevel(object):
    ERROR = 1
    WARN = 2
    INFO = 3
    DEBUG = 4

from Fursuiter.logging.PrintLogger import PrintLogger

__logger = None


def getlogger():
    global __logger
    if __logger is None:
        __logger = PrintLogger(log_level=LogLevel.DEBUG)
    return __logger


def setlogger(logger):
    global __logger
    __logger = logger