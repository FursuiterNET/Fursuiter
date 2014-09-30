from distill.exceptions import HTTPNotFound
from Fursuiter.sql import Session
from Fursuiter.sql.ORM import MediaFile
from Fursuiter.storageengine import StorageEngine


class MediaController(object):
    def media(self, request, response):
        media = Session().query(MediaFile).filter(MediaFile.file_id == request.matchdict['image']).scalar()
        if not media:
            return HTTPNotFound()
        response.headers['Cache-Control'] = 'max-age=3600'
        if media.mimetype:
            response.headers['Content-Type'] = media.mimetype
        response.file = StorageEngine().read(request.matchdict['image'])