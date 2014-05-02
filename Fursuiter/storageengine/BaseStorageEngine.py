from Fursuiter import logging


class BaseStorageEngine(object):
    def save(self, fp, location):
        logging.getlogger().error("Unimplemented save method")
        raise NotImplementedError

    def read(self, location):
        logging.getlogger().error("Unimplemented read method")
        raise NotImplementedError

    def get_url(self, request, location):
        logging.getlogger().error("Unimplemented get_url method")
        raise NotImplementedError