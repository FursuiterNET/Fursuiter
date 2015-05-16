# Fursuiter.net Developer Reference Manual
---

## 1. Reference: Directories

    /
    |- docs/	.	.	.	.	.	Documentation files
    |- Fursuiter/
    	|- authentication/	.	.	Authentication mechanism
    	|- config/	.	.	.	.	App and session configuration
    	|- LESS/	.	.	.	.	LESS style templates (currently unused)
    	|- logging/	.	.	.	.	Logger
    	|- session/	.	.	.	.	Session management
    	|- sql/	.	.	.	.	.	Session (Redis) and permanent (MySQL) database code.
    		|- ORM/	.	.	.	.	ORMs (Object Relational Mappings) -- defines DB relation (table) structure
    	|
    	|- static/	.	.	.	.	Static content (for resource files automatically retrieved by web server without explicit config)
    		|- demo/	.	.	.	Images, temporary + development only; should not be present in production releases
    		|- img/	.	.	.	.	Images meant for production
    		|- lib/	.	.	.	.	JavaScript (and other server-side scripts, if appropriate)
    		|- style/	.	.	.	Style resources that aren't images
    			|- css/	.	.	.	CSS files and resources
    			|- fonts/	.	.	Font files and resources
    	|
    	|- storageengine/	.	.	Storage engine code
    	|- templates/	.	.	.	Mako templates
    	|- views/	.	.	.	.	Distill route definitions

## 2. Getting Started

First, please read the readme file and check that you can serve the site successfully. Common hangups include:

* Installing using the wrong Python version. We use Python 2. Some OSes default to Python 3, which will not work.
* Not having the Redis daemon running; run `redis-server` to start it on the fly. Check your config.ini
* Not having the MySQL daemon running; run `mysqld` to start it on the fly.
* Mismatched port numbers:
  * The Fursuiter.net app, by default, runs on port 5000 (this is set in `./run.py`)
  * The app assumes that the MySQL daemon is running on its default port 3306. Change `./config.ini` if your setup is different.
  * The app assumes that the Redis daemon is running on its default port 6379-- be sure that it is.

Once you have the app up and running, you can begin development!

## 2.1 For Front-End Development

The directory reference above briefly describes all of the directories in the project, though front end developers only need to work in a few of them primarily:

* `./Fursuiter/static/` - For images, scripts, and stylesheets
* `./Fursuiter/templates/` - For markup templates written in Mako. Please keep this modular and organized.
* *Possibly* `./Fursuiter/views/` - For adding new pages / endpoints
* (`./Fursuiter/LESS/` is currently unused)

The rest is back-end!

## 2.2 For Back-End Development

> TODO: Write backend section, include any important info