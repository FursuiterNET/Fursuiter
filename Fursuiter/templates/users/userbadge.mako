<div class="panel panel-default">
  <ul class="list-group">
    <a href="/user/${req.user.username}" class="list-group-item">
      <img src="/static/demo/avatar/${req.user.username}.png" alt="" class="user-icon pull-left img-rounded img-responsive" />
      <strong>${req.user.realname}</strong><br>
      @${req.user.username}
    </a>
  </ul>
</div>