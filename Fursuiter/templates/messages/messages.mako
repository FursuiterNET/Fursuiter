%if req.user:

<div ng-controller="messagesCtrl">
	<tabset>
		<tab ng-repeat="box in boxes" heading="{{ box.label }}">
			<table class="table table-bordered">
				<tr>
					<th>Subject</th>
					<th>Sender</th>
					<th>Date Sent</th>
					<th></th>
				</tr>
				<tr ng-repeat="message in box.messages">
					<td>
						<a href="/messages/read/{{ message.id }}">
							{{ message.subject }}
						</a>
					</td>
					<td>
						<a href="/user/{{ message.from_username }}">
							{{ message.from_realname }}
						</a>
					</td>
					<td>{{ message.date_sent }}</td>
					<td></td>
				</tr>
			</table>
		</tab>
	</tabset>
</div>

%else:

Not logged in!

%endif