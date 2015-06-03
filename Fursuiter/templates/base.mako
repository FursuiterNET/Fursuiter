%if req.user:
  
  <%include file="base.loggedin.mako" />

%else:

  <%include file="public/home.mako" />

%endif
