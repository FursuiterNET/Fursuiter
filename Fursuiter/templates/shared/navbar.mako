<div ng-controller='NavbarCtrl' class="navbar navbar-default" id="navbar">
  <div class="container">
    %if not req.user:
      <div class="navbar-header">
        <a href="/#/" class="navbar-brand" title="Fursuiter.net Home">
          Fursuiter.net
        </a>
      </div>
    %else:
      <div class="navbar-header">
        <a href="/#/" class="navbar-brand" title="Fursuiter.net Home">
          Fursuiter.net
        </a>
        <span class="navbar-text">
          <a href="javascript:void(0)" title="Toggle User Panel" ng-click="leftbarToggle()" class="navbar-left navbar-link">
            <span class="glyphicon glyphicon-th-list"></span>
          </a>
        </span>
        <div class="btn-group pull-right visible-xs">
          <a href="/#/user/${req.user.username|h}" class="btn btn-default navbar-btn">
            <strong>~${req.user.username|h}</strong>
          </a>
          <button class="btn btn-default navbar-btn" data-toggle="collapse" data-target="#navbar-collapse">
              <span class="glyphicon glyphicon-align-justify"></span>
          </button>
        </div>
      </div>
      <div class="collapse navbar-collapse" id="navbar-collapse">
        <div class="hidden-xs">
          <div class="pull-right">
            %if req.user:
            <ul class="nav navbar-nav">
              <li>
                <a href="/#/user/${req.user.username|h}">@${req.user.username}</a>
              </li>
              <li>
                <a href="/#/upload" title="Upload">
                  <span class="glyphicon glyphicon-upload"></span>
                </a>
              </li>
              <li>
                <a href="/#/notifications" title="Notifications">
                  <span class="glyphicon glyphicon-globe"></span>
                </a>
              </li>

              <li class="separator"></li>

              <li>
                <a href="/#/settings" class="pane-changer" data-target-pane="settings" title="Settings">
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
                <a href="/#/login" title="Log in">
                  <span class="glyphicon glyphicon-log-in"></span>
                </a>
              </li>
            </ul>      
            %endif
          </div>
          <form action="/#/search" method="GET" class="form-inline navbar-form hidden-sm hidden-xs" role="search">
            <div class="form-group">
              <input type="text" name="q" class="form-control" ng-model="query" placeholder="Search" />
            </div>
            <div class="form-group">
              <button class="btn btn-default btn-block" title="Search">
                  <span class="glyphicon glyphicon-search"></span>
              </button>
            </div>
          </form>
        </div> <!-- </.hidden-xs> -->

        <!-- Mobile hamburger contents -->
        %if req.user:
        <ul class="list-group visible-xs" id="hamburger-nav">
          <a href="/#/upload" class="list-group-item">
            <span class="glyphicon glyphicon-upload"></span> Upload
          </a>
          <a href="/#/notifications" class="list-group-item">
            <span class="glyphicon glyphicon-globe"></span> Notifications
          </a>
          <a href="/#/settings" class="list-group-item">
            <span class="glyphicon glyphicon-cog"></span> Settings
          </a>
          <a href="/#/logout" class="list-group-item">
            <span class="glyphicon glyphicon-log-out"></span> Log Out
          </a>
        </ul>
        %endif
      </div>
    %endif  
  </div>
</div>

