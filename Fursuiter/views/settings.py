from distill.exceptions import HTTPErrorResponse
from Fursuiter.authentication import create_valid_session, LoginRequired
from Fursuiter.sql import Session
from Fursuiter.sql.ORM import User

from distill.renderers import renderer


class SettingsController(object):
    # @LoginRequired()
    @renderer('settings/account.mako')
    def GET_settings(self, request, response):
        return {"category": "account"}

    @renderer('settings/account.mako')
    def GET_account(self, request, response):
        return {"category": "account"}

    @renderer('settings/profile.mako')
    def GET_profile(self, request, response):
        return {"category": "profile"}

    @renderer('settings/privacy.mako')
    def GET_privacy(self, request, response):
        return {"category": "privacy"}

    @LoginRequired()
    def POST_settings(self, request, response):
        """ Update the user settings.

        Handles changes to the following user attributes:
        * real name
        * email
        * password
        * preferred theme (TODO)

        TODO: An authenticity check may be needed to prevent any logged-in user
        from simply spoofing a settings request for another user based on ID.
        A simple way to do this is to require the user's password to make any
        changes at all.
        """
        # Ensure that the user ID is present. It should have been templated
        # into the settings form.
        if "user_id" not in request.POST:
            raise HTTPErrorResponse("400 Bad Request", "400 Bad Request", "ValueError")

        # Get the current user, using the ID that was passed in.
        session = Session()
        user = session.query(User).filter(
            User.id == request.POST["user_id"]).scalar()

        # If the password-change section is not empty, see if the password is
        # being changed.
        if "passwd_old" in request.POST or \
                        "passwd_new" in request.POST or \
                        "passwd_new_confirm" in request.POST:
            if not self._handle_password_change(request, response, user):
                return self.GET_settings(request, response)

        # Update all the other user attributes.
        user.realname = request.POST["realname"]
        user.email = request.POST["email"]

        # TODO update the user's preferred theme.

        # Commit the updated user settings.
        session.add(user)
        session.commit()

        # Redirect back to the settings page to appear as though the update was
        # performed in-place.
        return self.GET_settings(request, response)

    @LoginRequired()
    def _handle_password_change(self, request, response, user):
        """ Handle a password change request.

        All of the following form fields must be defined:
        * passwd_old
        * passwd_new
        * passwd_new_confirm
        Then update the password accordingly.
        """
        # Check that all password fields have been filled out.
        if not all([item in request.POST for item in
                    ("passwd_old", "passwd_new", "passwd_new_confirm")]):
            request.session.flash(
                "All password fields are required for a password change.")
            return False

        # Verify the current password.
        if bcrypt.encrypt(request.POST["passwd_old"]) != user.password:
            request.session.flash(
                "Current password is incorrect. Please try again.")
            return False

        # Verify that the new password is confirmed.
        if request.POST["passwd_new"] != request.POST["passwd_new_confirm"]:
            request.session.flash(
                ("Password and confirmation are not the same. "
                 "Please try again."),
                "error")
            return False

        # Update the password. This doesn't commit the password; the commit
        # will be performed by POST_settings().
        user.password = bcrypt.encrypt(request.POST["passwd_new"])
        return True
