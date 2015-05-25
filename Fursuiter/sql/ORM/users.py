import hashlib
from sqlalchemy.orm import backref, relationship
from sqlalchemy import Column, String, Integer, ForeignKey

from Fursuiter.sql import DecBase
from Fursuiter.storageengine import StorageEngine


class User(DecBase):
    __tablename__ = 'fursuiter_users'

    id = Column(Integer, autoincrement=True, primary_key=True)
    username = Column(String(32), unique=True)
    password = Column(String(255))
    email = Column(String(255))
    realname = Column(String(255))
    level = Column(Integer)


class Character(DecBase):
    __tablename__ = 'fursuiter_characters'

    id = Column(Integer, autoincrement=True, primary_key=True)
    user_id = Column(Integer, ForeignKey('fursuiter_users.id', ondelete='CASCADE'))
    user = relationship('User', backref=backref('characters', cascade='all,delete'))
    name = Column(String(255))
    gender = Column(String(64))
    species = Column(String(64))

    def icon_url(self, request):
        return StorageEngine().get_url(request, "/characters/icons/%s" % hashlib.md5(self.name).hexdigest())

class Profile(DecBase):
    __tablename__ = "fursuiter_profiles"

    user_id = Column(Integer, ForeignKey('fursuiter_users.id', ondelete='CASCADE'), primary_key=True)
    user = relationship('User', backref=backref('profile_settings', cascade='all,delete', uselist=False))
    cover_image_id = Column(Integer, ForeignKey('fursuiter_submissions.id'), nullable=True, default=None)
    cover_image = relationship('Submission')

    def __init__(self, user_id):
        self.user_id = user_id
        self.cover_image_id = None
