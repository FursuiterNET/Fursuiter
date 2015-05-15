%if req.user:
  <div class="visible-xs">
    <%include file="../users/userbadge.mako" />
  </div>
  <form action="javascript:void(0)" class="panel panel-default" id="message-form">
    <div class="panel-body">
      <div class="form-group">
        <label for="message-input" class="control-label sr-only">Message</label>
        <textarea name="message" class="form-control" id="message-input" placeholder="Status Update" rows="3"></textarea>
      </div>
    </div>
    <div class="form-group status-addon-group" style="display:none;" data-addon-type="media">
      <div class="row">
        <div class="col-xs-6">
          <a class="center-block" style="text-align:center">
            <span class="span glyphicon glyphicon-folder-open" style="font-size:64px"></span><br>
            Choose Existing
          </a>
        </div>
        <div class="col-xs-6">
          <a class="center-block" style="text-align:center">
            <span class="span glyphicon glyphicon-upload" style="font-size:64px"></span><br>
            Upload
          </a>
        </div>
      </div>
    </div>
    <div class="form-group status-addon-group" style="display:none;" data-addon-type="commission-status">
      <label for="commission-status-select" class="control-label">Status</label>
      <select name="commission-status" id="commission-status-select" class="form-control">
        <option value="open">Open</option>
        <option value="closed">Closed</option>
      </select>
    </div>
    <div class="panel-footer control-footer">
      <div class="form-group" style="margin-bottom:0">
        <div class="btn-group">
          <button type="button" class="btn btn-sm btn-default status-addon-button">
            Normal Status
          </button>
          <button type="button" class="btn btn-sm btn-default status-addon-button" data-addon-type="media">
            <span class="glyphicon glyphicon-picture"></span>
            Image / Video
          </button>
          <button type="button" class="btn btn-sm btn-default status-addon-button" data-addon-type="commission-status">
            <span class="glyphicon glyphicon-bullhorn"></span>
            Commission Status
          </button>
        </div>
        <button type="submit" class="btn btn-sm btn-primary pull-right">Post</button>
      </div>
    </div>
  </form>

  <div role="tabpanel">
    <ul class="nav nav-tabs visible-xs" id="feed-nav" data-tabs="tabs">
        <li role="presentation">
          <a href="javascript:void(0)" class="feed-trigger default" data-target-feed="popular" data-toggle="tab">Popular</a>
        </li>
        <li role="presentation">
          <a href="javascript:void(0)" class="feed-trigger" data-target-feed="recent" data-toggle="tab">Recent</a>
        </li>
        <li role="presentation">
          <a href="javascript:void(0)" class="feed-trigger" data-target-feed="social" data-toggle="tab">Social</a>
        </li>
        <li role="presentation">
          <a href="javascript:void(0)" class="feed-trigger" data-target-feed="events" data-toggle="tab">Groups &amp; Events</a>
        </li>
    </ul>

    <div class="tab-content" id="feed-content">
      <div class="feed-pane tab-pane active" id="feed-popular" data-cursor=""></div>
      <div class="feed-pane tab-pane" id="feed-recent" data-cursor=""></div>
      <div class="feed-pane tab-pane" id="feed-social" data-cursor=""></div>
      <div class="feed-pane tab-pane" id="feed-events" data-cursor=""></div>
    </div>
  </div>
%else:

Not logged in!

%endif