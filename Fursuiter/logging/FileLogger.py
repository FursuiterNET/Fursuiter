from Fursuiter.logging import PrintLogger, LogLevel


class FileLogger(PrintLogger):
    def __init__(self, log_level, log_file):
        super(FileLogger, self).__init__(log_level)
        self.fp = open(log_file, 'w+')

    def error(self, msg):
        if self.log_level >= LogLevel.ERROR:
            self.fp.write(msg + "\n")

    def warn(self, msg):
        if self.log_level >= LogLevel.WARN:
            self.fp.write(msg + "\n")

    def info(self, msg):
        if self.log_level >= LogLevel.INFO:
            self.fp.write(msg + "\n")

    def debug(self, msg):
        if self.log_level >= LogLevel.DEBUG:
            self.fp.write(msg + "\n")