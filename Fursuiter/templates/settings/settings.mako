%if req.user:
<%inherit file="../base.mako" />

<%block name="includes">
	<link rel="stylesheet" href="/static/style/css/settings.css">
</%block>

<div class="row">
	<div class="col-md-3 hidden-xs" style="border-right:dashed 1px rgba(0,0,0,0.1)">
		<%include file="settingsmenu.mako" />
	</div>
	<div class="col-md-7 col-xs-12">
		<div class="jumbotron">
			<p>Please select a category from the menu</p>
			<ul class='list-group visible-xs'>
				<a href="/settings/account" class="list-group-item">Account Settings</a>
				<a href="/settings/profile" class="list-group-item">Profile Settings</a>
				<a href="/settings/privacy" class="list-group-item">Privacy Settings</a>
			</ul>
		</div>
	</div>
</div>

%else:

<%include file="../notlogged.mako" />

%endif
