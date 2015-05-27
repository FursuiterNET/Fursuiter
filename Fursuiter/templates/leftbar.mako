<%include file="users/userbadge.mako" />

<div class="panel panel-default">
  <ul class="list-group">
    <a href="/messages" class="list-group-item">
      <span class="pull-right badge">{{ userState.messageCount | noZero }}</span>
      <span class="glyphicon glyphicon-envelope"></span>
        Inbox
    </a>
    <a href="/notifications" class="list-group-item">
      <span class="pull-right badge">{{ userState.notificationCount | noZero }}</span>
      <span class="glyphicon glyphicon-globe"></span>
        Notifications
    </a>
  </ul>
</div>