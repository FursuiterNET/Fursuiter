import logging
from swiftclient.client import Connection
from swiftclient.exceptions import ClientException

from Fursuiter.storageengine.BaseStorageEngine import BaseStorageEngine

logger = logging.getLogger(__name__)

class SwiftStorageEngine(BaseStorageEngine):
    def __init__(self, authurl, user, key, **kwargs):
        self.client = Connection(authurl, user, key, **kwargs)

    def save(self, fp, location):
        location = location.strip("/")
        i = location.rfind("/")
        container = location[:i]
        object_ = location[i:]
        try:
            return self.client.put_object(container, object_, fp.read())
        except ClientException as ex:
            logger.error("Failed to get media object: {0}" % location)
            raise ex

    def read(self, location):
        location = location.strip("/")
        i = location.rfind("/")
        container = location[:i]
        object_ = location[i:]
        try:
            return self.client.get_object(container, object_)[1]
        except ClientException as ex:
            logger.error("Failed to get media object: {0}" % location)
            raise ex

    def get_url(self, request, location):
        return request.url('media', location=location)
