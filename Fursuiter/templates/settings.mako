%if req.user:

<div class="row">
	<div class="col-xs-12">
		<h2>User Settings</h2>
	</div>
</div>

<form action="settings" method="POST" class="form">
	<input type="hidden" name="user_id" value="${req.user.id}">
	<div class="col-md-8">
		<h4>Personal Information</h4>
		<div class="well">
			<div class="row">
				<div class="col-xs-6">
					<div class="form-group">
						<label for="settings-user-realname" class="control-label">Real Name</label>
						<input type="text" name="realname" id="settings-user-realname" class="form-control" value="${req.user.realname}" />
					</div>
				</div>
				<div class="col-xs-6">
					<div class="form-group">
						<label for="settings-user-email" class="control-label">Email Address</label>
						<input type="text" name="email" id="settings-user-email" class="form-control" value="${req.user.email}" />
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12">
					<div class="form-group">
						<button type="submit" class="btn btn-default">Update</button>
					</div>
				</div>
			</div>
		</div>
	</div>
    <div class="col-md-8">
        <h4>Security</h4>
        <div class="well">
            <div class="form-group">
                <label for="settings-passwd-old" class="control-label">Current password</label>
                <input type="password" name="passwd_old" id="settings-passwd-old" class="form-control" />
            </div>
            <div class="form-group">
                <label for="settings-passwd-new" class="control-label">New password</label>
                <input type="password" name="passwd_new" id="settings-passwd-new" class="form-control" />
            </div>
            <div class="form-group">
                <label for="settings-passwd-new-confirm" class="control-label">Confirm new password</label>
                <input type="password" name="passwd_new_confirm" id="settings-passwd-new-confirm" class="form-control" />
            </div>
            <div class="form-group">
                <button class="btn btn-default">Change password</button>
            </div>
        </div>
    </div>
	<div class="col-md-4">
		<h4>Appearance</h4>
		<div class="well">
			<div class="form-group">
				<label for="settings-theme-select" class="control-label"></label>
				<div class="input-group">
					<select name="theme" id="settings-theme-select" class="form-control">
						<option value="cerulean">Cerulean</option>
				        <option value="cosmo">Cosmo</option>
				        <option value="cyborg">Cyborg</option>
				        <option value="darkly">Darkly</option>
				        <option value="flatly">Flatly</option>
				        <option value="journal">Journal</option>
				        <option value="lumen">Lumen</option>
				        <option value="paper">Paper</option>
				        <option value="readable">Readable</option>
				        <option value="sandstone">Sandstone</option>
				        <option value="simplex">Simplex</option>
				        <option value="slate">Slate</option>
				        <option value="spacelab">Spacelab</option>
				        <option value="superhero">Superhero</option>
				        <option value="united">United</option>
					</select>
					<div class="input-group-btn">
						<button class="btn btn-default" id="theme-apply-button" type="button">Try It!</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>

%else:

Not logged in!

%endif
