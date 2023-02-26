<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
        //print
        //out.println("message");

%>
<div class="alert alert-success" role="alert">
    <h4 class="alert-heading">Well done!</h4>
    <strong> <%=message%> </strong>
    <hr>
    <p class="mb-0">Thank you for choosing BizBazar</p>
</div>

<%        session.removeAttribute("message");
    }
%>
