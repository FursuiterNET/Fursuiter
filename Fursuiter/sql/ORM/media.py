from sqlalchemy import Column, Integer, ForeignKey, String, DateTime, PrimaryKeyConstraint
from sqlalchemy.orm import relationship, backref
from Fursuiter.sql import DecBase


class MediaFile(DecBase):
    __tablename__ = 'fursuiter_media'

    submission_id = Column(Integer, ForeignKey('fursuiter_submissions.id', ondelete='CASCADE'))
    submission = relationship('Submission', backref=backref("mediafile", uselist=False))
    file_id = Column(String(255), unique=True)
    mimetype = Column(String(64))
    __table_args__ = (PrimaryKeyConstraint("submission_id", "file_id"),)

    def __init__(self, submission_id, file_id, mimetype=None):
        self.submission_id = submission_id
        self.file_id = file_id
        self.mimetype = mimetype
