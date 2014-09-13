<%def name="csrf()">
<input type="hidden" name="csrf_token" value="${req.session.get_csrf_token()}"/>
</%def>

<%def name="form(**kwargs)">
    <%
        attribs = " ".join(['%s="%s"' % (k.rstrip('_'), v) for (k, v) in kwargs.items()])
    %>
    <form ${attribs}>
        ${csrf()}
        ${caller.body()}
    </form>
</%def>