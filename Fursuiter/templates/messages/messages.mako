%if req.user:

<div ng-controller="messagesCtrl">
	<tabset>
		<tab ng-repeat="box in boxes" heading="{{ box.label }}">
			<ul class="list-group messages-list">
				<li class="list-group-item" ng-repeat="message in box.messages">
					<div class="row">
						<!-- <a href="/#/user/{{ message.from_username }}" class="col-sm-1 hidden-xs">
							<img ng-src="/static/demo/avatar/{{ message.from_username }}.png" alt="{{ message.from_realname }}" class="img-responsive">
						</a> -->
						<a href="/#/user/{{ message.from_username }}" class="col-sm-2 hidden-xs">
							{{ message.from_realname }}
						</a>
						<div class="col-sm-10">
							<div class="pull-right text-muted">
								{{ message.senddate }}
							</div>
							<strong>
								<a href="/#/message/read/{{ message.id }}">{{ message.subject }}</a>
							</strong>
							&middot;
							<span class="text-muted">
								{{ message.body | ellipsis }}
							</span>
						</div>
					</div>
				</li>
			</ul>
		</tab>
	</tabset>
</div>

%else:

Not logged in!

%endif