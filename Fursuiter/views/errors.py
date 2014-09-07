from distill.renderers import renderer


@renderer('prettyjson')
def forbidden(request, response):
    return {"Hello": "World"}


@renderer('prettyjson')
def notfound(request, response):
    return {"Hello": "World"}