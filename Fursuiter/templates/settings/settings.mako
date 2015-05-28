%if req.user:

<div class="row">
	<div class="col-md-4 hidden-xs" style="border-right:dashed 1px rgba(0,0,0,0.1)">
		<%include file="settingsmenu.mako" />
	</div>
	<div class="col-md-8 col-xs-12" ui-view></div>
</div>

%else:

<%include file="../notlogged.mako" />

%endif
