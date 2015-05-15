%for p in posts:

	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="post-heading">
				<a href="/user/${p['loweruser']}" class="pull-left">
					<img src="/static/demo/avatar/${p['loweruser']}.png" alt="${p['realuser']}'s Avatar" class="user-icon img-rounded">
				</a>
				<div class="btn-toolbar pull-right">
					<a href="javascript:void(0)" class="btn btn-sm btn-default">
						<span class="glyphicon glyphicon-thumbs-up"></span>
						Like
					</a>
				</div>
				<strong>
					<a href="/user/${p['loweruser']}">${p['realuser']}</a>
				</strong>
				<br>
				<a href="/post/${p['id']}" class="text-muted">${p['edate']}</a>
			</div>
		</div>
		<div class="panel-body">
			<p style="clear:both">${p['content']}</p>
		</div>
	</div>
%endfor