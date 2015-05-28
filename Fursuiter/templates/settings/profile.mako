%if req.user:

<div class="row">
	<div class="col-sm-4" style="border-right:dashed 1px rgba(0,0,0,0.1)">
		<%include file="settingsmenu.mako" />
	</div>
	<div class="col-sm-8 col-xs-12">
		<h3>Profile Settings</h3>
	</div>
</div>

%else:

<%include file="../notlogged.mako" />

%endif
