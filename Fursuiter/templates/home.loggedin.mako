<%inherit file="base.mako" />

<%block name="includes">
  <script src="/static/lib/home.loggedin.js"></script>
  <link rel="stylesheet" href="/static/style/css/home.loggedin.css" id="stylesheet" />
</%block>

<div class="row">
  <div class="col-lg-3 visible-lg" id="identity-column">

    <p class="home-button-group-title">
      Feeds
    </p>
    <div class="panel panel-primary">
      <ul class="list-group">
        <a href="javascript:void(0)" class="list-group-item feed-trigger default active" data-target-feed="featured">
          <span class="glyphicon glyphicon-home"></span> Featured
        </a>

        <a href="javascript:void(0)" class="list-group-item feed-trigger" data-target-feed="friends">
          <span class="glyphicon glyphicon-user"></span> Friends
        </a>

        <a href="javascript:void(0)" class="list-group-item feed-trigger" data-target-feed="following">
          <span class="glyphicon glyphicon-star"></span> Following
        </a>

        <a href="javascript:void(0)" class="list-group-item feed-trigger" data-target-feed="events">
          <span class="glyphicon glyphicon-calendar"></span> Events
        </a>

        <a href="javascript:void(0)" class="list-group-item feed-trigger" data-target-feed="groups">
          <span class="glyphicon glyphicon-th-large"></span> Groups
        </a>

        <a href="javascript:void(0)" class="list-group-item feed-trigger" data-target-feed="network">
          <span class="glyphicon glyphicon-globe"></span> Network
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

    <div class="advertisement"></div>

    <hr>

    <p>
      Copyright &copy; 2015 Fursuiter.net
    </p>
  </div>


  <div class="col-lg-7 col-md-8 col-sm-9 col-xs-12" id="content-column">
      <div class="content" id="home-content">
          <%include file="feeds/feeds.mako" />
      </div>
  </div>

  <div class="col-lg-2 col-md-4 col-sm-3 col-xs-12" id="ad-column">
    <div class="advertisement"></div>
    <div class="advertisement"></div>
    <hr>
    <p class="hidden-lg">
      Copyright &copy; 2015 Fursuiter.net
    </p>
  </div>
</div>