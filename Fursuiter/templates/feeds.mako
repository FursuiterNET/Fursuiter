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
  <div class="panel-footer">
    <div class="form-group">
      <div class="btn-group">
        <button type="button" class="btn btn-default status-addon-button">
          Normal Status
        </button>
        <button type="button" class="btn btn-default status-addon-button" data-addon-type="media">
          <span class="glyphicon glyphicon-picture"></span>
          Image / Video
        </button>
        <button type="button" class="btn btn-default status-addon-button" data-addon-type="commission-status">
          <span class="glyphicon glyphicon-bullhorn"></span>
          Commission Status
        </button>
      </div>
      <button type="submit" class="btn btn-primary pull-right">Post</button>
    </div>
  </div>
</form>

<div role="tabpanel">
  <ul class="nav nav-tabs nav-justified" id="feed-nav" data-tabs="tabs">
      <li role="presentation" class="active">
        <a href="#popular" data-toggle="tab">Popular</a>
      </li>
      <li role="presentation">
        <a href="#recent" data-toggle="tab">Recent</a>
      </li>
      <li role="presentation">
        <a href="#social" data-toggle="tab">Social</a>
      </li>
      <li role="presentation">
        <a href="#events" data-toggle="tab">Groups &amp; Events</a>
      </li>
  </ul>

  <div class="tab-content panel panel-default" id="feed-content">
    <div class="feed-pane tab-pane active" id="popular" data-cursor="">
      <p>Characters: ${req.user.characters}</p>
      <p>Email: ${req.user.email}</p>
      <p>Galleries: ${req.user.galleries}</p>
      <p>Groups: ${req.user.groups}</p>
      <p>ID: ${req.user.id}</p>
      <p>Level: ${req.user.level}</p>
      <p>Metadata: ${req.user.metadata}</p>
      <p>Password: ${req.user.password}</p>
      <p>Realname: ${req.user.realname}</p>
      <p>Submissions: ${req.user.submissions}</p>
      <p>Username: ${req.user.username}</p>
    </div>
    <div class="feed-pane tab-pane" id="recent" data-cursor=""></div>
    <div class="feed-pane tab-pane" id="social" data-cursor=""></div>
    <div class="feed-pane tab-pane" id="events" data-cursor=""></div>
  </div>
</div>

