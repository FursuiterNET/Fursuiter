import threading
import time

from sqlalchemy import event
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.engine import create_engine, Engine
from sqlalchemy.orm import scoped_session, sessionmaker


DecBase = declarative_base()
Session = None

threadlocal = threading.local()


def sql_init(dsn):
    engine = create_engine(dsn, pool_size=12)
    DecBase.metadata.create_all(engine)
    global Session
    Session = scoped_session(sessionmaker(bind=engine))


@event.listens_for(Engine, 'before_cursor_execute')
def before_cursor_execute(*args):
    args[0].info.setdefault('query_start_time', []).append(time.clock())


@event.listens_for(Engine, 'after_cursor_execute')
def after_cursor_execute(*args):
    if hasattr(threadlocal, 'db_rt'):
        threadlocal.db_rt += 1
    else:
        threadlocal.db_rt = 1

    total = (time.clock() - args[0].info['query_start_time'].pop(-1)) * 1000.0
    if hasattr(threadlocal, 'db_total_time'):
        threadlocal.db_total_time += total
    else:
        threadlocal.db_total_time = total


def add_db_headers(request, response):
    response.headerlist.append(('X-DB-Queries', str(getattr(threadlocal, 'db_rt', 0))))
    response.headerlist.append(('X-DB-TimeSpent', "%.2fms" % getattr(threadlocal, 'db_total_time', 0)))
    threadlocal.db_rt = 0
    threadlocal.db_total_time = 0


def start_db_profiling(event_):
    event_.request.add_response_callback(add_db_headers)