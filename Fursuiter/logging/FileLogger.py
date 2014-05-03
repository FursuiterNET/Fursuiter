import datetime

from Fursuiter.logging import PrintLogger, LogLevel


class FileLogger(PrintLogger):
    def __init__(self, log_level, log_file):
        super(FileLogger, self).__init__(log_level)
        self.fp = open(log_file, 'w+')

    def error(self, msg):
        if self.log_level >= LogLevel.ERROR:
            self.fp.write("%s ERROR: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg + "\n"))

    def warn(self, msg):
        if self.log_level >= LogLevel.WARN:
            self.fp.write("%s WARN: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg + "\n"))

    def info(self, msg):
        if self.log_level >= LogLevel.INFO:
            self.fp.write("%s INFO: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg + "\n"))

    def debug(self, msg):
        if self.log_level >= LogLevel.DEBUG:
            self.fp.write("%s DEBUG: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg + "\n"))