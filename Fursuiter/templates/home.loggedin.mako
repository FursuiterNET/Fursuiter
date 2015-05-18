<%inherit file="base.mako" />

<%block name="includes">
  <script src="/static/lib/home.loggedin.js"></script>
  <link rel="stylesheet" href="/static/style/css/home.loggedin.css" id="stylesheet" />
</%block>

<div class="row">
  <div class="hidden-xs col-sm-3 col-md-4 col-lg-3" id="identity-column">

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

  <div class="col-lg-2 col-md-12 col-sm-12 col-xs-12" id="ad-column">
    <div class="advertisement"></div>
    <div class="advertisement"></div>
  </div>
</div>