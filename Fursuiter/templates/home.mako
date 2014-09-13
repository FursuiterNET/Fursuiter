<%inherit file="base.mako"/>
<%namespace name="forms" file="forms.mako"/>
<div class="dash-menu">
    <div class="profile">
        <img src="/static/demo/avatar.png">

        <p class="full-name">Dreae</p>

        <p class="username">@TheDreae</p>

        <div class="tab active">
            <div class="icon">
                <i class="fa fa-list fa-lg fa-fw"></i>
            </div>
            Feed
        </div>
        <div class="tab">
            <div class="icon">
                <i class="fa fa-inbox fa-lg fa-fw"></i>

                <div class="pill">14</div>
            </div>
            Inbox
        </div>
        <div class="tab">
            <div class="icon">
                <i class="fa fa-user fa-lg fa-fw"></i>
            </div>
            Profile
        </div>
        <div class="tab">
            <div class="icon">
                <i class="fa fa-cog fa-lg fa-fw"></i>
            </div>
            Settings
        </div>
    </div>
</div>
<div class="dash-content">
    <div class="dash-feed">
        <h2 class="title">Feed</h2>

        <div class="media">
            <img src="/static/demo/avatar.png" class="avi">

            <p class="time">2 Hours ago</p>

            <p>SomeUser liked SomeThing</p>
        </div>
        <div class="media">
            <img src="/static/demo/avatar.png" class="avi">

            <p class="time">2 Hours ago</p>

            <p>SomeUser liked SomeThing</p>
        </div>
        <div class="media">
            <img src="/static/demo/avatar.png" class="avi">

            <p class="time">2 Hours ago</p>

            <p>SomeUser liked SomeThing</p>
        </div>
        <div class="media">
            <img src="/static/demo/avatar.png" class="avi">

            <p class="time">2 Hours ago</p>

            <p>SomeUser liked SomeThing</p>
        </div>
    </div>
    <div class="trending">
        <h2 class="title">Trends</h2>

        <div class="media"><a href="#">SomeImage</a> by <a href="#">@SomeUser</a></div>
        <div class="media"><a href="#">#SomeUpcomingConvention</a></div>
        <div class="media"><a href="#">SomeImage</a> by <a href="#">@SomeUser</a></div>
        <div class="media"><a href="#">#SomeUpcomingConvention</a></div>
        <div class="media"><a href="#">SomeImage</a> by <a href="#">@SomeUser</a></div>
        <div class="media"><a href="#">#SomeUpcomingConvention</a></div>
        <div class="media"><a href="#">SomeImage</a> by <a href="#">@SomeUser</a></div>
        <div class="media"><a href="#">#SomeUpcomingConvention</a></div>
    </div>
</div>