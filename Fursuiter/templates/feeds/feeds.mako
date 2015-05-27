%if req.user:
  <div ng-controller="FeedsCtrl" id="feeds-container">
    <div class="visible-xs">
      
    </div>
    <%include file="feedForm.mako" />


    <div role="tabpanel">
      <tabset>
        <tab ng-repeat="feed in feeds" ng-click="fetch(feed)">
          <tab-heading>
            <span class="glyphicon glyphicon-{{feed.icon}}"></span> {{feed.label}}
          </tab-heading>

          <post ng-repeat="post in feed.posts | reverse" src="post"></post>

        </tab>
      </tabset>

      <div class="tab-content" id="feed-content">
        <div class="feed-pane tab-pane">
          {{ visibleFeed.content }}
        </div>
      </div>
    </div>
  </div>
%else:

Not logged in!

%endif