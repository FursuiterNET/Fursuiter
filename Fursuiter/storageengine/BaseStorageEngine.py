import logging

logger = logging.getLogger(__name__)

class BaseStorageEngine(object):
    def save(self, fp, location):
        logger.error("Unimplemented save method")
        raise NotImplementedError

    def read(self, location):
        logger.error("Unimplemented read method")
        raise NotImplementedError

    def get_url(self, request, location):
        logger.error("Unimplemented get_url method")
        raise NotImplementedError
