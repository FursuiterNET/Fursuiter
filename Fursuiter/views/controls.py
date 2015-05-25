import logging
import mimetypes
import string
import uuid
from Fursuiter.sql import Session
from Fursuiter.sql.ORM import Submission
from Fursuiter.sql.ORM.media import MediaFile
from Fursuiter.storageengine import StorageEngine
from Fursuiter.authentication import LoginRequired
from distill.renderers import renderer
from distill.exceptions import HTTPMoved


logger = logging.getLogger(__name__)


class UploadController(object):
    @LoginRequired()
    @renderer("controls/upload.mako")
    def GET_upload_image(self, request, response):
        return {}

    @LoginRequired()
    def POST_upload_image(self, request, response):
        if 'image' in request.POST and request.POST['csrf_token'] == request.session.get_csrf_token():
            img_id = uuid.uuid4()

            filename = "".join([c for c in request.POST['image'].filename if
                                c not in "/?*\\<>:|" and c in string.printable]).rstrip().rstrip(".")
            media_id = "%s.%s_%s" % (img_id.hex, request.user.username, filename)

            name = request.POST['submission.name']
            description = request.POST['submission.desc']
            submission = Submission(request.user.id, name, description)
            Session().add(submission)
            Session().flush()

            type = mimetypes.guess_type(request.POST['image'].filename)
            media = MediaFile(submission.id, media_id, type[0])

            Session().add(media)
            try:
                Session().commit()
            except Exception as e:
                logger.error(e)
                Session().rollback()

            StorageEngine().save(request.POST['image'].file, media_id)
            return HTTPMoved(request.url("media", image=media_id))
        else:
            return self.GET_upload_image(request, response)