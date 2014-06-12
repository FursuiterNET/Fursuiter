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

    getlogger().info("Finished configuring app")

