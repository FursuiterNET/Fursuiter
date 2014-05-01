from pyramid.authentication import AuthTktAuthenticationPolicy
from pyramid.authorization import ACLAuthorizationPolicy
from pyramid.config import Configurator
from pyramid.renderers import JSON

from Fursuiter.authentication import get_auth_level


Session = None


def main(global_config, **settings):
    config = Configurator(settings=settings, root_factory='.FSModels.Root')
    config.include('pyramid_chameleon')
    config.add_renderer('prettyjson', JSON(indent=4))
    authn = AuthTktAuthenticationPolicy(secret=config.registry.settings['auth_key'], callback=get_auth_level,
                                        include_ip=True, hashalg="SHA512")
    config.set_authentication_policy(authn)
    config.set_authorization_policy(ACLAuthorizationPolicy())
    return config.make_wsgi_app()