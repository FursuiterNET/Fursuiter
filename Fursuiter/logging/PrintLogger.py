import datetime


class PrintLogger(object):
    def error(self, msg):
        print("%s ERROR: %s" % datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg)

    def warn(self, msg):
        print("%s WARNING: %s" % datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg)

    def info(self, msg):
        print("%s INFO: %s" % datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg)

    def debug(self, msg):
        print("%s DEBUG: %s" % datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg)