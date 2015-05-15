<%inherit file="../base.mako"/>
<%namespace file="character_well.mako" import="character_well"/>

<%block name="pagetitle">
<title>${user.username | h} | Fursuiter.net</title>
</%block>

<%block name="includes">
    <script src="/static/lib/user.js"></script>
    <link rel="stylesheet" href="/static/style/css/user.css">
</%block>

<div class="panel">
    <div class="panel-heading" id="user-cover" style="background-image:url('/static/demo/defaultCover.png')">
    </div>
    <div class="panel-body">
        <div class="row" id="user-cover-content">
            <div class="col-sm-3 hidden-xs" id="user-identity-column">
                <a href="/user/${user.username}">
                  <img src="/static/demo/profile/${user.username}.png" alt="${user.realname}'s Icon" class="user-identity-icon img-rounded img-responsive" />
                </a>

                %if req.user.username != user.username:
                    <div class="panel panel-default">
                        <ul class="list-group">
                            <a href="javascript:void(0)" class="list-group-item">
                                <span class="glyphicon glyphicon-plus"></span>
                                Add Friend
                            </a>
                            <a href="javascript:void(0)" class="list-group-item">
                                <span class="glyphicon glyphicon-star-empty"></span>
                                Follow
                            </a>
                            <a href="/message/new/${user.username}" class="list-group-item">
                                <span class="glyphicon glyphicon-envelope"></span>
                                Send Message
                            </a>
                        </ul>
                    </div>

                    <div class="panel panel-danger">
                        <ul class="list-group">
                            <a href="" class="list-group-item list-group-item-danger">
                                <span class="glyphicon glyphicon-exclamation-sign"></span> Report User
                            </a>
                        </ul>
                    </div>
                %else:
                    <div class="panel panel-default">
                        <ul class="list-group">
                            <a href="/settings/profile" class="list-group-item">
                                <span class="glyphicon glyphicon-cog"></span> Edit Profile
                            </a>
                        </ul>
                    </div>
                %endif
            </div>


            <div class="col-sm-6 col-xs-12" id="user-content-column">

                <div role="tabpanel">

                    <ul class="nav nav-tabs" role="tablist" data-tabs="tabs" id="user-navbar">
                        <li role="presentation" class="active">
                            <a href="#about" data-toggle="tab">${user.realname}</a>
                        </li>
                        <li role="presentation">
                            <a href="#characters" data-toggle="tab">Characters</a>
                        </li>
                        <li role="presentation">
                            <a href="#groups" data-toggle="tab">Groups</a>
                        </li>
                    </ul>

                    <div class="tab-content" style="margin-top: 16px;">
                        <div id="about" class="tab-pane active">
                            <h3>About ${user.realname}</h3>
                        </div>

                        <div id="characters" class="tab-pane">
                            <div id="user-character-list">
                                % if user.username == req.user.username:
                                    <div class="row">
                                        <div class="col-xs-12">
                                            <div class="pull-right btn-toolbar">
                                                <a href="javascript:void(0)" class="btn btn-success" id="new-character-button">
                                                    <span class="glyphicon glyphicon-plus"></span> New Character
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                % endif
                                % for character in characters:
                                ${character_well(character)}
                                % endfor
                            </div>
                            % if user.username == req.user.username:
                            <div id="user-character-editor" style="display:none">
                                <form class="form-horizontal" method="POST" action="/user/${user.username|h}/characters/create">
                                    <input type="hidden" id="character-id" class="user-character-editor-input">
                                    <fieldset>
                                        <legend>Edit Character</legend>

                                        <div class="form-group">
                                          <label class="col-sm-2 control-label" for="character-name">Name</label>  
                                          <div class="col-sm-10">
                                            <input id="character-name" name="character-name" type="text" placeholder="Character Name" class="form-control input-md user-character-editor-input" required>
                                          </div>
                                        </div>

                                        <div class="form-group">
                                          <label class="col-sm-2 control-label" for="character-species">Species</label>  
                                          <div class="col-sm-10">
                                            <input id="character-species" name="character-species" type="text" placeholder="Character Species" class="form-control input-md user-character-editor-input">
                                          </div>
                                        </div>

                                        <div class="form-group">
                                          <label class="col-sm-2 control-label" for="character-gender">Gender</label>  
                                          <div class="col-sm-10">
                                            <input id="character-gender" name="character-gender" type="text" placeholder="Character Gender" class="form-control input-md user-character-editor-input">
                                          </div>
                                        </div>
                                        <div class="form-group">
                                          <div class="col-xs-12">
                                            <div class="btn-toolbar pull-right">
                                                <button type="button" id="user-character-editor-cancel" name="user-character-editor-cancel" class="btn btn-default">Cancel</button>
                                                <button type="submit" id="user-character-editor-submit" name="user-character-editor-submit" class="btn btn-primary">Submit</button>
                                            </div>
                                          </div>
                                        </div>

                                    </fieldset>
                                </form>
                            </div>
                            % endif
                        </div>

                        <div id="groups" class="tab-pane">
                            <h3>Groups</h3>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-sm-3 col-xs-12">
                <div class="panel panel-default">
                    <ul class="list-group">
                        <a href="/user/${user.username}/commissions" class="list-group-item">
                            <strong>
                                <span class="glyphicon glyphicon-bullhorn"></span>
                                Commissions
                            </strong>
                            &middot;
                            Closed
                        </a>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>
