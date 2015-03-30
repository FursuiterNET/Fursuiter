<%inherit file="../base.mako"/>
<%namespace file="character_well.mako" import="character_well"/>

<%block name="pagetitle">
<title>${user.username | h} | Fursuiter.net</title>
</%block>

<%block name="includes">
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
                    % for character in characters:
                    ${character_well(character)}
                    % endfor
                </div>
            </div>

        </div>
    </div>
</div>