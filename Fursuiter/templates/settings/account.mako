%if req.user:

<h3>Account Settings</h3>
<form action="/settings/account" method="POST">
	<input type="hidden" name="action" value="updateInformation">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>Personal Information</h4>
		</div>
		<table class="table table-bordered">
			<tr>
				<td><label for="settings-realname" class="settings-field-label">Real Name</span></td>
				<td>
					<input type="text" id="settings-realname" class="settings-field-input input-sm form-control" value="${req.user.realname}">
				</td>
			</tr>
			<tr>
				<td><label for="settings-email" class="settings-field-label">Email Address</span></td>
				<td>
					<input type="text" id="settings-email" class="settings-field-input input-sm form-control" value="${req.user.email}">
				</td>
			</tr>
		</table>
		<div class="panel-footer clearfix">
			<button class="btn btn-primary btn-sm pull-right" type="submit">Update</button>
		</div>
	</div>
</form>

<form action="/settings/account" method="POST">
	<input type="hidden" name="action" value="changePassword">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h4>Change Password</h4>
		</div>
		<table class="table table-bordered">
			<tr>
				<td><label for="settings-password-old" class="settings-field-label">Current Password</span></td>
				<td>
					<input type="password" id="settings-password-old" name="passwd_old" class="settings-field-input form-control input-sm">
				</td>
			</tr>
			<tr>
				<td><label for="settings-password-new" class="settings-field-label">New Password</span></td>
				<td>
					<input type="password" id="settings-password-new" name="passwd_new" class="settings-field-input form-control input-sm">
				</td>
			</tr>
			<tr>
				<td><label for="settings-password-newconfirm" class="settings-field-label">Confirm New Password</span></td>
				<td>
					<input type="password" id="settings-password-newconfirm" name="passwd_new_confirm" class="settings-field-input form-control input-sm">
				</td>
			</tr>
		</table>
		<div class="panel-footer clearfix">
			<button class="btn btn-primary btn-sm pull-right" type="submit">Change Password</button>
		</div>
	</div>
</form>

%else:

<%include file="../notlogged.mako" />

%endif
