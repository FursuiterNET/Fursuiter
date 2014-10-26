Fursuiter
=========

Fursuiter.net repo

Tech
====

* [Distill](https://github.com/Dreae/Distill) - A web framework for Python.
* [Bootstrap](http://getbootstrap.com) - A frontend library in LESS and JQuery.


Developers: Getting Started
===========================

Prerequisites
-------------

Install MySQL (`mysql-server`) and [Redis](http://redis.io).

Create a database `fursuiter`. Grant a user full access on it. You can use any
username and password, as long as you change it in your local copy of
`config.ini` before running.

Running
-------

    python setup.py build
    cp config.ini.example config.ini
    python run.py

