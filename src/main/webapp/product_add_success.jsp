<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
        //print
        //out.println("message");

%>
<div class="alert alert-success" role="alert">
    <h4 class="alert-heading">Great!</h4>
    <strong> <%=message%> </strong>
    <hr>
    <p class="mb-0">To add more product click on back</p>
</div>

<%        session.removeAttribute("message");
    }
%>
