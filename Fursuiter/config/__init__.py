import logging

logger = logging.getLogger(__name__)

def configure(app):
    if 'logging.log_file' in app.settings:
        logging.basicConfig(filename=app.settings['logging.log_file'])
    if 'logging.log_level' in app.settings:
        level = app.settings['logging.log_level'].upper()
        logging.basicConfig(level=level)

    # I'm not a fan of this, but not sure of a better way
    if 'storage_engine' in app.settings:
        engine = app.settings['storage_engine'].lower()
        if engine == 'localstorageengine':
            if 'storage_engine.root_dir' not in app.settings:
                logger.error("LocalStorageEngine requires a root_dir")
            else:
                from Fursuiter.storageengine import LocalStorageEngine, set_engine

                root_dir = app.settings['storage_engine.root_dir']
                set_engine(LocalStorageEngine(root_dir))
        elif engine == 'swiftstorageengine':
            if 'storage_engine.url' not in app.settings:
                logger.error("SwiftStorageEngine requires a URL")
            elif 'storage_engine.user' not in app.settings:
                logger.error("No username provided for SwiftStorageEngine")
            elif 'storage_engine.password' not in app.settings:
                logger.error("No password provided for SwiftStorageEngine")
            else:
                from Fursuiter.storageengine import SwiftStorageEngine, set_engine

                url = app.settings['storage_engine.url']
                user = app.settings['storage_engine.user']
                password = app.settings['storage_engine.password']
                set_engine(SwiftStorageEngine(url, user, password))

    from Fursuiter.views import add_controllers, map_routes
    add_controllers(app)
    map_routes(app)

    logger.info("Finished configuring app")

