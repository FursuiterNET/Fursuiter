from pyramid.view import view_config


@view_config(route_name='home', renderer='prettyjson')
def home(request):
    return {"Hello": "World"}