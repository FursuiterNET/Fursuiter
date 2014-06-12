import datetime

from Fursuiter.logging import PrintLogger, LogLevel


def check_buffer(func):
    def log(cls, msg):
        func(cls, msg)
        if len(cls.line_buffer) >= cls.max_lines_in_buffer:
            cls.fp.writelines(cls.line_buffer)
            cls.fp.flush()

    return log


class FileLogger(PrintLogger):
    def __init__(self, log_level=LogLevel.INFO, log_file="fursuiter.log", buffer_lines=15):
        super(FileLogger, self).__init__(log_level)
        self.fp = open(log_file, 'w+')
        self.max_lines_in_buffer = buffer_lines
        self.line_buffer = []

    @check_buffer
    def error(self, msg):
        if self.log_level >= LogLevel.ERROR:
            self.line_buffer.append(
                "%s ERROR: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg + "\n"))

    @check_buffer
    def warn(self, msg):
        if self.log_level >= LogLevel.WARN:
            self.line_buffer.append(
                "%s WARN: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg + "\n"))

    @check_buffer
    def info(self, msg):
        if self.log_level >= LogLevel.INFO:
            self.line_buffer.append(
                "%s INFO: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg + "\n"))

    @check_buffer
    def debug(self, msg):
        if self.log_level >= LogLevel.DEBUG:
            self.line_buffer.append(
                "%s DEBUG: %s" % (datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"), msg + "\n"))
