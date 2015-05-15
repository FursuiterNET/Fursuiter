<%inherit file="base.mako" />
<%namespace name="forms" file="forms.mako" />

<%block name="includes">
  <script src="/static/lib/home.loggedin.js"></script>
  <link rel="stylesheet" href="/static/style/css/home.loggedin.css" id="stylesheet" />
</%block>

<div class="row">
  <div class="hidden-sm hidden-xs col-md-3" id="identity-column">
    <div class="panel panel-default">
      <ul class="list-group">
        <a href="/user/${req.user.username}" class="list-group-item">
          <img src="/static/demo/${req.user.username}.png" alt="" class="user-icon pull-left img-rounded img-responsive" />
          <strong>${req.user.realname}</strong><br>
          ${req.user.username}
        </a>
      </ul>
    </div>

    <p class="home-button-group-title">
      Feeds
    </p>
    <div class="panel panel-primary">
      <ul class="list-group">
        <a href="javascript:void(0)" class="list-group-item feed-trigger default active" data-target-feed="popular">
          <span class="glyphicon glyphicon-star"></span> Popular
        </a>
        <a href="javascript:void(0)" class="list-group-item feed-trigger" data-target-feed="recent">
          <span class="glyphicon glyphicon-list-alt"></span> Recent
        </a>
        <a href="javascript:void(0)" class="list-group-item feed-trigger" data-target-feed="social">
          <span class="glyphicon glyphicon-comment"></span> Social
        </a>
        <a href="javascript:void(0)" class="list-group-item feed-trigger" data-target-feed="events">
          <span class="glyphicon glyphicon-calendar"></span> Groups &amp; Events
        </a>
      </ul>
    </div>

    <div class="panel panel-default">
      <ul class="list-group">
        <a href="/messages" class="list-group-item">
          <span class="pull-right badge">2</span> <!-- req.user.newMessageCount will fill here -->
          <span class="glyphicon glyphicon-envelope"></span>
            Inbox
        </a>
      </ul>
    </div>


    %if req.user.groups:
      <p class="home-button-group-title">
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


  <div class="col-md-7 col-sm-12" id="content-column">
      <div class="content" id="home-content">
          <%include file="feeds.mako" />
      </div>
  </div>
</div>