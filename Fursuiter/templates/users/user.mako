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
            <div class="col-sm-3 hidden-xs">
                <a href="/user/${user.username}">
                  <img src="/static/demo/${user.username}.png" alt="${user.realname}'s Icon" class="user-identity-icon img-circle img-responsive" />
                </a>

                %if req.user.username != user.username:
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

                <ul class="list-group">
                    <a href="" class="list-group-item">
                        <span class="glyphicon glyphicon-exclamation-sign"></span> Report User
                    </a>
                </ul>
                %endif
            </div>
            <div class="col-sm-9 col-xs-12" style="margin-top: 74px;">
                <h2 id="user-cover-title">
                    <strong>${user.realname}</strong>
                </h2>
                <ul class="nav nav-tabs" id="user-navbar">
                    <li role="presentation">
                        <a href="#about">About</a>
                    </li>
                    <li role="presentation" class="active">
                        <a href="#characters">Characters</a>
                    </li>
                    <li role="presentation">
                        <a href="#groups">Groups</a>
                    </li>
                </ul>

                <div id="user-character-pane">
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
                        <form class="form-horizontal">
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
            </div>

        </div>
    </div>
</div>