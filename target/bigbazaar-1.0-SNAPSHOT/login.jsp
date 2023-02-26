

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">

                    <div style="box-shadow: 2px 4px 10px #888888;" class="card mt-3">
                        <div class="card-header custom-bg text-white">
                            <h3>Login Here</h3>
                        </div>

                        <div class="card-body">
                            <form action="LoginServlet" mathod="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input style="box-shadow: 1px 2px 5px #888888;" name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted"></small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input style="box-shadow: 1px 2px 5px #888888;" name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <a href="register.jsp">Register</a>
                                <div class="container text-center">
                                    <button style="box-shadow: 1px 2px 5px #888888;" type="Login" class="btn btn-primary custom-bg">Submit</button>

                                </div>
                            </form>

                        </div>

                       
                    </div>


                </div>

            </div>

        </div>

    </body>
</html>
