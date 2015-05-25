%if req.user:
  <div ng-controller="feedsCtrl" id="feeds-container">
    <div class="visible-xs">
      <%include file="../users/userbadge.mako" />
    </div>
    <%include file="feedForm.mako" />


    <div role="tabpanel">
      <tabset>
        <tab ng-repeat="feed in feeds" ng-click="fetch(feed)">
          <tab-heading>
            <span class="glyphicon glyphicon-{{feed.icon}}"></span> {{feed.label}}
          </tab-heading>

          <div class="panel panel-default" ng-repeat="post in feed.posts">

            <div class="panel-heading">
              <div class="post-heading">
                <a href="/user/{{ post.username }}" class="pull-left">
                  <img src="/static/demo/avatar/{{ post.username }}.png" alt="{{ post.realname }}'s Avatar" class="user-icon img-rounded">
                </a>
                <div class="btn-toolbar pull-right">
                  <a href="javascript:void(0)" class="btn btn-sm btn-default">
                    <span class="glyphicon glyphicon-thumbs-up"></span> Like
                  </a>
                </div>
                <strong>
                  <a href="/user/{{ post.username }}">{{ post.realname }}</a>
                </strong>
                <br>
                <a href="/post/{{ post.id }}" class="text-muted">{{ post.edate }}</a>
              </div>
            </div>

            <div class="panel-body">{{ post.content }}</div>

          </div>

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