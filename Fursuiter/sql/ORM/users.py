from sqlalchemy.orm import backref, relationship
from sqlalchemy import Column, String, Integer, ForeignKey

from Fursuiter.sql import DecBase


class User(DecBase):
    __tablename__ = 'fursuiter_users'

    id = Column(Integer, autoincrement=True, primary_key=True)
    username = Column(String(32), unique=True)
    password = Column(String(255))
    email = Column(String(255))
    level = Column(Integer)


class Character(DecBase):
    __tablename__ = 'fursuiter_characters'

    id = Column(Integer, autoincrement=True, primary_key=True)
    user_id = Column(Integer, ForeignKey('fursuiter_users.id', ondelete='CASCADE'))
    user = relationship('User', backref=backref('characters', cascade='all,delete'))
    name = Column(String(255))
    gender = Column(String(64))
    species = Column(String(64))