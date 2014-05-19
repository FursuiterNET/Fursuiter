import base64
import os


def validate_session(event):
    if 'session' not in event.request.cookies:
        return
    if '__token__' not in event.request.session:
        event.request.session.invalidate()
        return
    if '__key__' not in event.request.session:
        event.request.session.invalidate()
        return

    token = "%s:%s" % (event.request.session['__key__'], event.request.remote_addr)

    if token != event.request.session['__token__']:
        event.request.session.invalidate()
        return


def create_valid_session(request):
    key = base64.b64encode(os.urandom(32))
    token = "%s:%s" % (key, request.remote_addr)
    request.session['__token__'] = token
    request.session['__key__'] = key
