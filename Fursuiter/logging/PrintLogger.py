import datetime

from Fursuiter.logging import LogLevel


class PrintLogger(object):
    def __init__(self, log_level=LogLevel.INFO):
        self.log_level = log_level

    def error(self, msg):
        if self.log_level >= LogLevel.ERROR:
            print("%s ERROR: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg))

    def warn(self, msg):
        if self.log_level >= LogLevel.WARN:
            print("%s WARNING: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg))

    def info(self, msg):
        if self.log_level >= LogLevel.INFO:
            print("%s INFO: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg))

    def debug(self, msg):
        if self.log_level >= LogLevel.DEBUG:
            print("%s DEBUG: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg))