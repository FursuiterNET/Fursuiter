from pyramid.view import forbidden_view_config, notfound_view_config


@forbidden_view_config(renderer='prettyjson')
def forbidden(request):
    return {"Hello": "World"}


@notfound_view_config(renderer='prettyjson')
def notfound(request):
    return {"Hello": "World"}