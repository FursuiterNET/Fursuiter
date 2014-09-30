import datetime
from sqlalchemy.orm import backref, relationship
from sqlalchemy import Column, String, Integer, ForeignKey, DateTime, PrimaryKeyConstraint

from Fursuiter.sql import DecBase


class Gallery(DecBase):
    __tablename__ = 'fursuiter_galleries'

    id = Column(Integer, autoincrement=True, primary_key=True)
    user_id = Column(Integer, ForeignKey('fursuiter_users.id', ondelete='CASCADE'))
    user = relationship('User', backref=backref("galleries"))
    name = Column(String(255))
    description = Column(String(2048))


class Submission(DecBase):
    __tablename__ = 'fursuiter_submissions'

    id = Column(Integer, autoincrement=True, primary_key=True)
    user_id = Column(Integer, ForeignKey('fursuiter_users.id', ondelete='CASCADE'))
    user = relationship('User', backref=backref("submissions"))
    name = Column(String(255))
    description = Column(String(2048))
    date_added = Column(DateTime)

    def __init__(self, user_id, name, description, date_added=None):
        self.user_id = user_id
        self.name = name
        self.description = description
        if not date_added:
            self.date_added = datetime.datetime.now()
        else:
            self.date_added = date_added


class GallerySumbission(DecBase):
    __tablename__ = 'fursuiter_galleryimages'

    gallery_id = Column(Integer, ForeignKey('fursuiter_galleries.id'))
    gallery = relationship('Gallery', backref=backref('images'))
    submission_id = Column(Integer, ForeignKey('fursuiter_submissions.id'))
    submission = relationship('Submission', backref=backref('galleries'))
    __table_args__ = (PrimaryKeyConstraint('gallery_id', 'submission_id'),)