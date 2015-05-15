<%inherit file="base.mako" />
<%namespace name="forms" file="forms.mako" />

<%block name="includes">
  <script src="/static/lib/home.loggedin.js"></script>
  <link rel="stylesheet" href="/static/style/css/home.loggedin.css" id="stylesheet" />
</%block>

<div class="row">
  <div class="hidden-sm hidden-xs col-md-3" id="identity-column">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="identity" style="text-align:center">
          <a href="/user/${req.user.username}">
            <img src="/static/demo/full_bg.png" alt="Copper's Icon" class="user-identity-icon img-circle img-responsive center-block" />
          </a>
          <h2>${req.user.realname}</h2>
          <h4>@${req.user.username}</h4>
        </div>
      </div>
      <ul class="list-group">
        <a href="/feeds" class="list-group-item active">
          <span class="glyphicon glyphicon-list"></span>
            Feed
        </a>
        <a href="/messages" class="list-group-item">
          <span class="pull-right badge"></span> <!-- req.user.newMessageCount will fill here -->
          <span class="glyphicon glyphicon-envelope"></span>
            Inbox
        </a>
        <a href="/user/${req.user.username}" class="list-group-item">
          <span class="glyphicon glyphicon-user"></span>
            Profile
        </a>
        <a href="/settings" class="list-group-item">
          <span class="glyphicon glyphicon-cog"></span>
            Settings
        </a>
      </ul>
    </div>


    %if req.user.groups:
      <p>
        Groups
      </p>
      <ul class="list-group">
        %for g in req.user.groups:
          <a href="/groups/" class="list-group-item">
            (Group Name)
          </a>
        %endfor
      </ul>
    %endif

    <hr>

    <p>
      Copyright &copy; 2015 Fursuiter.net
    </p>
  </div>


  <div class="col-md-9 col-sm-12" id="content-column">
      <div class="content" id="home-content">
          <%include file="feeds.mako" />
      </div>
  </div>
</div>