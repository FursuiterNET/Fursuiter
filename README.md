Fursuiter
=========

The source of [Fursuiter.net](http://fursuiter.net), a social network for
fursuit makers, performers, and enthusiasts.

Tech
====

* MySQL
* [Distill](https://github.com/Dreae/Distill) - A web framework for Python.
* [Bootstrap](http://getbootstrap.com) - A frontend library in LESS and JQuery.
* [AngularJS](https://angularjs.org) - A client-side MVC library


Developers: Getting Started
===========================

Prerequisites
-------------

Package dependencies:

* python-dev
* mysql-server
* redis-server

Python package dependencies:

* setuptools
* pymysql
* py-bcrypt

Create a database `fursuiter`. Grant a user full access on it. You can use any
username and password, as long as you change it in your local copy of
`config.ini` before running.

Running
-------

    python setup.py develop
    cp config.ini.example config.ini
    # If you specified a different user/password for MySQL,
    # change it in config.ini here.
    python run.py

