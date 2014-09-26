<%inherit file="../base.mako"/>
<%namespace name="forms" file="../forms.mako"/>
<div class="centre">
    <div class="login">
        <h1 class="title">Login to Fursuits.NET</h1>
        <%forms:form class_="form centre" role="form" action="" method="POST" enctype="multipart/form-data">
            <input type="file" name="image"/>
            <input type="submit"/>
        </%forms:form>
    </div>
</div>