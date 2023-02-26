<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
        //print
        //out.println("message");

%>
<div class="alert alert-success" role="alert">
    <h4 class="alert-heading">Oops</h4>
    <strong> <%=message%> </strong>
    <hr>
    <p class="mb-0">Please try again</p>
</div>

<%        session.removeAttribute("message");
    }
%>
