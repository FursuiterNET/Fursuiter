from Fursuiter.storageengine import StorageEngine


class MediaController(object):
    def media(self, request, response):
        response.headers['Cache-Control'] = 'max-age=3600'
        response.file = StorageEngine().read(request.matchdict['image'])