from Fursuiter.sql import Session
from Fursuiter.sql.ORM import User, Character

from distill.renderers import renderer
from distill.exceptions import HTTPNotFound


class CharactersController (object):

    def user_characters(self, request, response):
        """ Characters of a specified user.

        This is an API entry. The view of this resource is the user page
        (/user/:user).
        """
        session = Session()

        user = session.query(User).filter(
                User.username == request.matchdict["user"]).scalar()
        if not user:
            raise HTTPNotFound()

        characters = session.query(Character).filter(
                Character.user_id == user.id).all()
        if not any(characters):
            return {}

        return {"characters": characters, }

    @renderer("characters/character.mako")
    def character(self, request, response):
        session = Session()

        user = session.query(User).filter(
                User.username == request.matchdict["user"]).scalar()
        if not user:
            raise HTTPNotFound()

        # FIXME (smiles) this doesn't work if your character name has
        # characters that need to be encoded in URIs.
        # e.g. "Copper Badger", encoded as "Copper+Badger"
        character = session.query(Character).filter(
                (Character.name == request.matchdict["character"]) and
                (Character.user_id == user.id)).scalar()
        if not character:
            raise HTTPNotFound()

        return {"user": user, "character": character, }
