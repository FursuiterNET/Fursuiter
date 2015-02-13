%if True:
# %if req.preview:

<%inherit file="base.mako" />
<link rel="stylesheet" href="/static/style/css/notifications.css">

<p>
	(This will be the pop-over displayed when you click the notifications button in the navbar)
</p>

<ul class="list-group preview-list">
	<a href="javascript:void(0)" class="list-group-item">
		<div class="media">
			<span class="glyphicon glyphicon-comment pull-right"></span>
			<div class="media-left">
				<img src="/static/demo/JackTail.jpg" alt="JackTail's Avatar" class="img img-thumb media-object">
			</div>
			<div class="media-body">
				<strong>JackTail</strong> commented on your submission: "Very cool!"
			</div>
		</div>
	</a>
	<a href="javascript:void(0)" class="list-group-item">
		<div class="media">
			<span class="glyphicon glyphicon-user pull-right"></span>
			<div class="media-left">
				<img src="/static/demo/full_bg.png" alt="Copper's Avatar" class="img img-thumb media-object">
			</div>
			<div class="media-body">
				<strong>Copper Badger</strong> sent you a friend request.
			</div>
		</div>
	</a>
	<a href="/notifications" class="list-group-item">
		View All
	</a>
</ul>

%else:

<%inherit file="base.mako" />
<div class="row">
	<div class="col-xs-12">
		<div class="page-header">
			<h2>Notifications</h2>
		</div>
	</div>
</div>

<ul class="nav nav-tabs">
	<li>
		<a href="javascript:void(0)" data-target="notifications-comments" class="notifications-tab">
			<span class="badge pull-right">2</span>
			Comments
		</a>
	</li>
	<li>
		<a href="javascript:void(0)" data-target="notifications-requests" class="notifications-tab">
			<span class="badge pull-right">5</span>
			Requests
		</a>
	</li>
</ul>

<ul class="notifications-pane list-group" id="notifications-comments">
	<li class="list-group-item"></li>
	<li class="list-group-item"></li>
</ul>
<ul class="notifications-pane list-group" id="notifications-requests">
	<li class="list-group-item"></li>
	<li class="list-group-item"></li>
</ul>

%endif