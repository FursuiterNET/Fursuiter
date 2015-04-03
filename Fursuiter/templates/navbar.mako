%if req.user:
<ul class="nav navbar-nav">
  <li>
    <a href="/user/${req.user.username|h}">@${req.user.username}</a>
  </li>
  <li>
    <a href="upload" title="Upload">
      <span class="glyphicon glyphicon-upload"></span>
    </a>
  </li>
  <li>
    <a href="/#notifications" title="Notifications">
      <span class="glyphicon glyphicon-globe"></span>
    </a>
  </li>

  <li class="separator"></li>

  <li>
    <a href="/#settings" class="pane-changer" data-target-pane="settings" title="Settings">
      <span class="glyphicon glyphicon-cog"></span>
    </a>
  </li>
  <li>
    <a href="${req.url('logout', token=req.session.get_csrf_token())}" title="Log out">
      <span class="glyphicon glyphicon-log-out"></span>
    </a>
  </li>
</ul>
%else:
<ul class="nav navbar-nav">
  <li>
    <a href="login" title="Log in">
      <span class="glyphicon glyphicon-log-in"></span>
    </a>
  </li>
</ul>
%endif
