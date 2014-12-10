<%inherit file="base.mako" />
<%namespace name="forms" file="forms.mako" />
%if req.user:
<div class="col-sm-4 col-md-3">
    <div class="well">
        <div class="identity" style="text-align:center">
            <img src="/static/demo/full_bg.png" alt="Copper's Icon" class="img-circle img-responsive center-block" style="border:solid 6px rgba(0,0,0,0.2);max-width:240px;width:100%" />
            <h2>Copper</h2>
            <h4>@CopperBadger</h4>
        </div>
    </div>

    <div class="list-group">
        <a href="#feed" class="list-group-item">
            <span class="glyphicon glyphicon-list"></span>
            Feed
        </a>
        <a href="#inbox" class="list-group-item">
            <span class="pull-right badge">14</span>
            <span class="glyphicon glyphicon-envelope"></span>
            Inbox
        </a>
        <a href="#profile" class="list-group-item">
            <span class="glyphicon glyphicon-user"></span>
            Profile
        </a>
        <a href="#settings" class="list-group-item">
            <span class="glyphicon glyphicon-cog"></span>
            Settings
        </a>
    </div>

    <p>
        Copyright &copy; 2014 Fursuiter.net
    </p>
</div>
<div class="col-sm-8 col-md-9">
    <div class="content">
        <ul class="nav nav-pills nav-justified" style="margin-bottom:6px">
            <li><a href="popular">Popular</a></li>
            <li class="active"><a href="recent">Recent</a></li>
            <li><a href="social">Social</a></li>
            <li><a href="events">Groups &amp; Events</a></li>
        </ul>
        <div class="media-list">
            <div class="media well">
                <a href="user/dreae" class="pull-left user-icon img-responsive">
                    <img src="/static/demo/avatar.png" alt="Dreae" class="media-object img-rounded img-responsive">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="user/dreae">
                            <strong>Dreae</strong>
                        </a> updated his status
                    </h4>
                    <p>
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ullam, quas, ut, dolore et nostrum ipsam veritatis consectetur commodi harum totam necessitatibus magni iusto fugit officia aut vitae qui. Ullam, quas!
                    </p>
                </div>
            </div>

            <div class="media well">
                <a href="user/rechner" class="pull-left user-icon">
                    <img src="/static/demo/rechner.jpg" alt="Rechner Fox" class="media-object img-rounded img-responsive">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="user/rechner">
                            <strong>Rechner</strong>
                        </a> updated his status
                    </h4>
                    <p>
                        HTML5 and WebM would be the format of choice, with a fallback to mp4/flash if needed.  Flash is going the way of the dinosaur though so we'll want to weigh the options.
                    </p>
                    <p>
                        Many people already upload to Youtube so making it easy to embed videos instead of uploading them outright would be something to look at.
                    </p>
                </div>
            </div>

            <div class="media well">
                <a href="user/jacktail" class="pull-left user-icon">
                    <img src="/static/demo/JackTail.jpg" alt="JackTail" class="media-object img-rounded img-responsive">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="user/rechner">
                            <strong>JackTail</strong>
                        </a> updated his status
                    </h4>
                    <p>
                        Fursuiter.net is underway!
                    </p>
                </div>
            </div>

            <div class="media well">
                <a href="user/rechner" class="pull-left user-icon">
                    <img src="/static/demo/rechner.jpg" alt="Rechner Fox" class="media-object img-rounded img-responsive">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="user/rechner">
                            <strong>Rechner</strong>
                        </a> changed his commission status
                    </h4>
                    <span style="font-size:24pt">
                        <span class="glyphicon glyphicon-star"></span> Open for Commissions!
                    </span>
                    <p>
                        I'm opening 5 commission spots.
                    </p>
                </div>
            </div>

            <div class="media well">
                <a href="user/grenrir" class="pull-left user-icon">
                    <img src="/static/demo/grenrir.jpg" alt="Grenrir Hunstman" class="media-object img-rounded img-responsive">
                </a>
                <div class="media-body">
                    <h4 class="media-heading">
                        <a href="user/rechner">
                            <strong>Grenrir</strong>
                        </a> updated his status
                    </h4>
                    <p>
                        Dedicated hosting can be pretty cheap. Since our site is going to be heavily database driven, I would take a REALLY close look at the Terms of Service to make sure there is no limitations/restrictions being put on CPU utilization and disk I/O. Many placed will lure you in with these unlimited packages, but hidden in there would be limitations on CPU and Disk usage.
                    </p>
                    <p>
                        I can take the lead on researching. Dedicated hosting as well as cloud services (like Amzon AWS or Azure) may pay off better in the long run, but we need to do some performance testing to know for sure.
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
%else:
<div class="col-md-6 col-md-offset-3" style="text-align:center;">
    <div style="margin-bottom:53px;" tabindex="0">A community for fursuit makers, performers, and enthusiasts.</div>
    <div><a href="/register" role="button" class="btn btn-primary btn-lg">Get started</a></div>
</div>
%endif
