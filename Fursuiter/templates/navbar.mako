<!-- This should look at req.user, but it is getting unset for some reason. -->
%if True:
<ul class="nav navbar-nav">
  <li>
    <a href="profile">@CopperBadger</a>
  </li>
  <li>
    <a href="upload" title="Upload">
      <span class="glyphicon glyphicon-upload"></span>
    </a>
  </li>
  <li>
    <a href="notifications" title="Notifications">
      <span class="glyphicon glyphicon-globe"></span>
    </a>
  </li>

  <li class="separator"></li>

  <li>
    <a href="security" title="Security">
      <span class="glyphicon glyphicon-lock"></span>
    </a>
  </li>
  <li>
    <a href="logout" title="Log out">
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
