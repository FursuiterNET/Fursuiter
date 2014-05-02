from Fursuiter.logging.PrintLogger import PrintLogger

__logger = None


def getlogger():
    global __logger
    if __logger is None:
        __logger = PrintLogger()
    return __logger