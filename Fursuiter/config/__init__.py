from Fursuiter.logging import getlogger


def configure(app):
    if 'logger' in app.settings:
        logger = app.settings['logger']
        if logger.lower() == "filelogger":
            if not 'logging.log_file' in app.settings:
                getlogger().error("No log file specified for FileLogger")
                getlogger().warn("Falling back to PrintLogger")
            else:
                from Fursuiter.logging.FileLogger import FileLogger
                from Fursuiter.logging import setlogger, LogLevel

                level = LogLevel.INFO
                if 'logging.log_level' in app.settings:
                    level = int(app.settings['logging.log_level'])
                setlogger(FileLogger(level, app.settings['logging.log_file']))

    # I'm not a fan of this, but not sure of a better way
    if 'storage_engine' in app.settings:
        engine = app.settings['storage_engine'].lower()
        if engine == 'localstorageengine':
            if not 'storage_engine.root_dir' in app.settings:
                getlogger().error("LocalStorageEngine requires a root_dir")
            else:
                from Fursuiter.storageengine import LocalStorageEngine, set_engine

                root_dir = app.settings['storage_engine.root_dir']
                set_engine(LocalStorageEngine(root_dir))
        elif engine == 'swiftstorageengine':
            if not 'storage_engine.url' in app.settings:
                getlogger().error("SwiftStorageEngine requires a URL")
            elif not 'storage_engine.user' in app.settings:
                getlogger().error("No username provided for SwiftStorageEngine")
            elif not 'storage_engine.password' in app.settings:
                getlogger().error("No password provided for SwiftStorageEngine")
            else:
                from Fursuiter.storageengine import SwiftStorageEngine, set_engine

                url = app.settings['storage_engine.url']
                user = app.settings['storage_engine.user']
                password = app.settings['storage_engine.password']
                set_engine(SwiftStorageEngine(url, user, password))

    from Fursuiter.views import add_controllers, map_routes
    add_controllers(app)
    map_routes(app)

    getlogger().info("Finished configuring app")

