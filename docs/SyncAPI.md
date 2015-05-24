# Fursuiter.NET Synchronous API

## Notes

Below is the template model specification for synchronous requests on Fursuiter.NET; the server should provide the outlined data to the template associated with the requested view. **Data** sections should return lists of objects containing the requested data, while items within **variables** sections should be returned simply as they are stated, as inidividual fields.

All specs are open to negotiation.

## Spec

### Profile - Main Page

* **View**: `users.py`
* **Method**: `GET_user`
* **Template**: `users/user.mako`

#### Data

* `watchers` (Usernames, avatar URLs, profile URLs) -- 25 most recent only
* `watching` (same as watchers) -- 25 most recent only
* `journals` (Titles, entry dates, short preview texts, and journal URLs) -- 4 most recent only
* `uploads` (Titles, thumbnail URLs, and page URLs) -- 6 most recent only
* `faves` (Titles, thumbnail URLs, and page URLs) -- 6 most recent only
* `shouts` (Usernames, User URLs, entry dates, shout contents) -- 10 most recent only
* `characters` (Names, thumbnail URLs, short description, and page URLs) -- 3 only
* `groups` (Names, thumbnail URLs, short description, and page URLs) -- 10 most recent only

#### Variables

* `string username`,
* `int userid`,
* `string userProfileImageURL`,
* `string userCoverImageURL`,
* `int watcherCount`,
* `int watchingCount`,
* `int journalCount`,
* `int uploadCount`,
* `int faveCount`,
* `int shoutCount`,
* `int characterCount`,
* `int groupCount`,
* `boolean isSessionUser` (true if the logged in user is the same as the one being requrested),
* `string userContent` (user's formatted page content, will be HTML produced by CKEditor),
* `int isSessionFriend` (value according to following conditions)
    0 - Not friends
    1 - Friend request is pending, initiated by session user (ie, "You have sent a friend request to this person, waiting for them to respond")
    2 - Friend request is pending, initiated by requested user (ie, "This person wants to be friends with you")
    3 - Friends
* `boolean isSessionFollow` (true if the session use follows the requested user)
