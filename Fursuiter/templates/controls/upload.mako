<%inherit file="../base.mako"/>
<%namespace name="forms" file="../forms.mako"/>

<%block name="pagetitle">
<title>Upload | Fursuiter.net</title>
</%block>

<div class="centre">
    <div class="login">
        <h1 class="title">Login to Fursuits.NET</h1>
        <%forms:form class_="form centre" role="form" action="" method="POST" enctype="multipart/form-data">
            <input name="submission.name" type="text"/>
            <input name="submission.desc" type="text"/>
            <input type="file" name="image"/>
            <input type="submit"/>
        </%forms:form>
    </div>
</div>
