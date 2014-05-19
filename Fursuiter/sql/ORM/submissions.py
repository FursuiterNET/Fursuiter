from sqlalchemy.orm import backref, relationship
from sqlalchemy import Column, String, Integer, ForeignKey, DateTime

from Fursuiter.sql import DecBase


class Gallery(DecBase):
    __tablename__ = 'fursuiter_galleries'

    id = Column(Integer, autoincrement=True, primary_key=True)
    user_id = Column(Integer, ForeignKey('fursuiter_users.id', ondelete='CASCADE'))
    user = relationship('User')
    name = Column(String(255))
    description = Column(String(2048))


class Submission(DecBase):
    __tablename__ = 'fursuiter_submissions'

    id = Column(Integer, autoincrement=True, primary_key=True)
    user_id = Column(Integer, ForeignKey('fursuiter_users.id', ondelete='CASCADE'))
    user = relationship('User')
    gallery_id = Column(Integer, ForeignKey('fursuiter_galleries.id'))
    gallery = relationship('Gallery', backref=backref('images'))
    name = Column(String(255))
    description = Column(String(2048))
    date_added = Column(DateTime)