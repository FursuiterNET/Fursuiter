import os
import shutil

from Fursuiter.storageengine.BaseStorageEngine import BaseStorageEngine


class LocalStorageEngine(BaseStorageEngine):
    def __init__(self, root_dir):
        self.base_dir = root_dir

    def save(self, fp, location):
        with open(os.path.join(self.base_dir, location), 'wb+') as f:
            fp.seek(0)
            shutil.copyfileobj(fp, f)

    def read(self, location):
        return open(os.path.join(self.base_dir, location))

    def get_url(self, request, location):
        return request.static_url(os.path.join(self.base_dir, location))