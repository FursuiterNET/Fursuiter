<div class="panel panel-default">
	<ul class="list-group" id="settings-menu">
		<a href="/settings/account" class="list-group-item ${'active' if category=='account' else '' }">
			<span class="option-title">Account Settings</span>
			<small>Name, password</small>
		</a>
		<a href="/settings/profile" class="list-group-item ${'active' if category=='profile' else '' }">
			<span class="option-title">Profile Settings</span>
			<small>Profile content, avatar and ID images</small>
		</a>
		<a href="/settings/privacy" class="list-group-item ${'active' if category=='privacy' else '' }">
			<span class="option-title">Privacy Settings</span>
			<small>Profile visibility, block list</small>
		</a>
		<a href="/admin" class="list-group-item">
			<span class="option-title">Administrative Controls</span>
		</a>
	</ul>
</div>