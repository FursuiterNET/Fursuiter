<%inherit file="base.mako" />

<%block name="includes">
  <script src="/static/lib/home.loggedin.js"></script>
  <link rel="stylesheet" href="/static/style/css/home.loggedin.css" id="stylesheet" />
</%block>

<div class="row">
  <div class="col-lg-3 visible-lg" id="identity-column">

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