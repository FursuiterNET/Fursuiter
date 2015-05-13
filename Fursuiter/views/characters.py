from Fursuiter.sql import Session
from Fursuiter.sql.ORM import User, Character

from distill.renderers import renderer
from distill.exceptions import HTTPMoved, HTTPNotFound, HTTPBadRequest


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

    def create_character(self, request, response):
        """ Create a character for a user.

        Only a character name is required. Species, gender, etc. are
        optional.

        FIXME (smiles) This may break if the character name contains 
        characters that are not alphanumeric or underscores.

        TODO (smiles) enforce that the signed-in user can only create
        characters for itself.
        """
        session = Session()

        user = session.query(User).filter(
                User.username == request.matchdict["user"]).scalar()
        if not user:
            raise HTTPBadRequest()

        if "character-name" not in request.POST:
            raise HTTPBadRequest()

        qs = lambda q: request.POST[q] if q in request.POST else None
        sona = Character(
                user_id=user.id,
                user=user,
                name=request.POST["character-name"],
                gender=qs("character-gender"),
                species=qs("character-species"),
        )
        session.add(sona)
        session.commit()

        return HTTPMoved(request.url(
                'user', user.username, anchor='characters'))
