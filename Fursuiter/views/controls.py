import mimetypes
import uuid
from Fursuiter.storageengine import StorageEngine
from Fursuiter.authentication import LoginRequired
from distill.renderers import renderer
from distill.exceptions import HTTPMoved


class UploadController(object):
    @LoginRequired()
    @renderer("controls/upload.mako")
    def GET_upload_image(self, request, response):
        return {}

    @LoginRequired()
    def POST_upload_image(self, request, response):
        if 'image' in request.POST and request.POST['csrf_token'] == request.session.get_csrf_token():
            #TODO: Store mimetype in DB at upload
            img_id = uuid.uuid4()
            img_name = "%s.%s_%s" % (img_id.hex, request.user.username, request.POST['image'].filename)
            StorageEngine().save(request.POST['image'].file, img_name)
            return HTTPMoved(request.url("media", image=img_name))
        else:
            return self.GET_upload_image(request, response)