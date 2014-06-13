from Fursuiter.logging import getlogger


def configure(config):
    if 'logger' in config.registry.settings:
        logger = config.registry.settings['logger']
        if logger.lower() == "filelogger":
            if not 'logging.log_file' in config.registry.settings:
                getlogger().error("No log file specified for FileLogger")
                getlogger().warn("Falling back to PrintLogger")
            else:
                from Fursuiter.logging.FileLogger import FileLogger
                from Fursuiter.logging import setlogger, LogLevel

                level = LogLevel.INFO
                if 'logging.log_level' in config.registry.settings:
                    level = int(config.registry.settings['logging.log_level'])
                setlogger(FileLogger(level, config.registry.settings['logging.log_file']))

    # I'm not a fan of this, but not sure of a better way
    if 'storage_engine' in config.registry.settings:
        engine = config.registry.settings['storage_engine'].lower()
        if engine == 'localstorageengine':
            if not 'storage_engine.root_dir' in config.registry.settings:
                getlogger().error("LocalStorageEngine requires a root_dir")
            else:
                from Fursuiter.storageengine import LocalStorageEngine, set_engine

                root_dir = config.registry.settings['storage_engine.root_dir']
                set_engine(LocalStorageEngine(root_dir))
        elif engine == 'swiftstorageengine':
            if not 'storage_engine.url' in config.registry.settings:
                getlogger().error("SwiftStorageEngine requires a URL")
            elif not 'storage_engine.user' in config.registry.settings:
                getlogger().error("No username provided for SwiftStorageEngine")
            elif not 'storage_engine.password' in config.registry.settings:
                getlogger().error("No password provided for SwiftStorageEngine")
            else:
                from Fursuiter.storageengine import SwiftStorageEngine, set_engine

                url = config.registry.settings['storage_engine.url']
                user = config.registry.settings['storage_engine.user']
                password = config.registry.settings['storage_engine.password']
                set_engine(SwiftStorageEngine(url, user, password))

    getlogger().info("Finished configuring app")

