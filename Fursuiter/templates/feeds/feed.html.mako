%for p in posts:

	<div class="panel panel-default">
		<div class="panel-body">
			<div class="post-heading">
				<a href="/user/${p['loweruser']}" class="pull-left" style="margin: 0 8px 8px 0">
					<img src="/static/demo/${p['loweruser']}.png" alt="${p['realuser']}'s Avatar" class="feed-icon img-rounded">
				</a>
				<strong>
					<a href="/user/${p['loweruser']}">${p['realuser']}</a>
				</strong>
				<br>
				<a href="/post/${p['id']}" class="text-muted">${p['edate']}</a>
			</div>
			<p style="clear:both">${p['content']}</p>
		</div>
		<div class="panel-footer">
			<a href="javascript:void(0)" class="btn btn-sm btn-default">
				<span class="glyphicon glyphicon-thumbs-up"></span>
				Like
			</a>
		</div>
	</div>
%endfor