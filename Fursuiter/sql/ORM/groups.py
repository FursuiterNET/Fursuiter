from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import backref, relationship

from Fursuiter.sql import DecBase


class Group(DecBase):
    __tablename__ = 'fursuiter_groups'

    id = Column(Integer, autoincrement=True, primary_key=True)
    name = Column(String(128))
    description = Column(String(2048))


class GroupMember(DecBase):
    __tablename__ = 'fursuiter_groupmembers'

    id = Column(Integer, autoincrement=True, primary_key=True)
    user_id = Column(Integer, ForeignKey('fursuiter_users.id', ondelete='CASCADE'))
    user = relationship('User', backref=backref('groups', cascade='all,delete'))
    group_id = Column(Integer, ForeignKey('fursuiter_groups.id', ondelete='CASCADE'))
    group = relationship('Group', backref=backref('users', cascade='all,delete'))