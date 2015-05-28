<div class="panel panel-default">

    <div class="panel-heading" id="user-cover" style="background-image:url('/static/demo/defaultCover.png')"></div>

    <div class="panel-body">
        <div class="row" id="user-cover-content">

            <div class="col-sm-3 hidden-xs" id="user-identity-column">
                <a href="/#/user/${user.username}">
                  <img ng-src="/static/demo/profile/${user.username}.png" alt="${user.realname}'s Icon" class="user-identity-icon img-rounded img-responsive" />
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
                            <a href="/#/message/new/${user.username}" class="list-group-item">
                                <span class="glyphicon glyphicon-envelope"></span>
                                Send Message
                            </a>
                        </ul>
                    </div>

                    <div class="panel panel-danger">
                        <ul class="list-group">
                            <a href="/#/report/user/${user.username}" class="list-group-item list-group-item-danger">
                                <span class="glyphicon glyphicon-exclamation-sign"></span> Report User
                            </a>
                        </ul>
                    </div>
                %else:
                    <div class="panel panel-default">
                        <ul class="list-group">
                            <a href="/#/settings/profile" class="list-group-item">
                                <span class="glyphicon glyphicon-cog"></span> Edit Profile
                            </a>
                        </ul>
                    </div>
                %endif
            </div>


            <div class="col-sm-9 col-xs-12" id="user-content-column">
                <tabset>
                    <tab heading="${user.realname}">
                        <div class="row">
                            <div class="col-sm-8">
                                <h3>
                                    About ${user.realname} (${user.username})
                                </h3>
                                
                            </div>
                            <div class="col-sm-4">
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
                    </tab>

                    <tab heading="Characters">
                        
                    </tab>

                    <tab heading="Groups">
                        
                    </tab>
                </tabset>
            </div>

        </div>
    </div>
</div>
