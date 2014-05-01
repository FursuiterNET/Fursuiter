from sqlalchemy import Column, String, Integer
from sqlalchemy.ext.declarative import declarative_base

DecBase = declarative_base()


class User(DecBase):
    __tablename__ = 'fursuiter_users'

    username = Column(String(32), primary_key=True)
    password = Column(String(255))
    email = Column(String(255))
    level = Column(Integer)
