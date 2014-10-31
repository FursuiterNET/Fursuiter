# Fursuiter.NET Asynchronous API v0

## Notes

Asynchronous responses must always be JSON-- the client will ignore any
response that isn't JSON.

The client will always respond to whatever JSON keys are sent back in the
asynchronous response, not just the ones required by the spec below. The
following keys may be helpful-- use them at will:

    ALERT    will open an alert box with the value as the message
    LOG      will log the value to the client's browser console
    MESSAGE  will display the value in the UI's on-screen message system

Check `static/lib/fursuiter.js` to see all of the keys available.

Please use the `MESSAGE` key freely, especially is there is an error--
giving the user specific textual messages is not the client script's
responsibility.

## Spec

### User Accounts
**User account creation, editing and deletion ("deactivation") will be done synchronously**

### Posts
	Create(string content, int parentId, int CDNReference, JSON privacySettings, string context) => {CONTENT: HTML for post to display}
	Update(string content, string context) => {CONTENT: HTML for post to display}
	UpdatePrivacy(JSON privacySettings) => {SUCCESS: success/failure boolean}
		# separate since privacy edits would be priority, should happen as fast and reliably as possible
	Delete(int postId) => {SUCCESS: success/failure boolean}
	Hide(int postId) => {SUCCESS: success/failure boolean}

### Galleries
**Gallery creation and deletion will be done synchronously**

	Update(int galleryId, string name, string description) => {SUCCESS: success/failure boolean}
	AddSubmissions(int galleryId, string submissionIds) => {SUCCESS: success/failure boolean}
	RemoveSubmissions(int galleryId, string submissionIds) => {SUCCESS: success/failure boolean}

### Groups
**Group creation and deletion will be done synchronously**

	Update(int groupId, string name, string description) => {SUCCESS: success/failure boolean}
	Add(int groupId, string userIds) => {SUCCESS: success/failure boolean, GROUPCOUNT: new total number of group members}
		# userIds argument example: "[1,4,15,6]"
	Remove(int groupId, string userIds) => {SUCCESS: success/failure boolean, GROUPCOUNT: new total number of group members}

### Submissions
	Create(string name, string description, string context) => {CONTENT: HTML for new submission}
	Update(int submissionId, string name, string description, string context) => {CONTENT: HTML for updated submission}
	Delete(int submissionId) => {SUCCESS: success/failure boolean}

### Friends
	Request(int userId) => {SUCCESS: success/failure boolean}
	Confirm(int requestId) => {SUCCESS: success/failure boolean}
	Decline(int requestId) => {SUCCESS: success/failure boolean}
	Defriend(int userId) => {SUCCESS: success/failure boolean}
	Poke(int userId) => {SUCCESS: success/failure boolean}

### Followers
	Follow(int userId, string listIds) => {SUCCESS: success/failure boolean}
	Unfollow(int userId) => {SUCCESS: success/failure boolean}

### Contact Lists
	Create(string name, string context) => {CONTENT: HTML for newly created contact list}
	Update(string name) => {SUCCESS: success/failure boolean}
	AddContacts(int listId, string userIds) => {SUCCESS: success/failure boolean, LISTCOUNT: new total number of contacts in list}
	RemoveContacts(int listId, string userIds) => {SUCCESS: success/failure boolean, LISTCOUNT: new total number of contacts in list}
