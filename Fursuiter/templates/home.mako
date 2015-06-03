%if req.user:
  
  <%include file="home.loggedin.mako" />

%else:

  <%include file="public/home.mako" />

%endif
