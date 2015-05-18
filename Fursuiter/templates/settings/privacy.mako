%if req.user:
<%inherit file="../base.mako" />

<%block name="includes">
	<link rel="stylesheet" href="/static/style/css/settings.css">
</%block>

<div class="row">
	<div class="col-md-3 hidden-xs" style="border-right:dashed 1px rgba(0,0,0,0.1)">
		<%include file="settingsmenu.mako" />
	</div>
	<div class="col-md-7 col-xs-12">
		<h3>Privacy Settings</h3>
	</div>
</div>

%else:

<%include file="../notlogged.mako" />

%endif
