<%-- 
    Document   : register
    Created on : Feb 7, 2023, 12:10:34 AM
    Author     : ATIM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="row mt-5">
            <div class="container-fluid">

                <div class = "col-md-4 offset-md-4">
                    <div class="card">
                        <div style="box-shadow: 5px 10px 18px #888888;" class="card-body px-5">

                            <h4 class="text-center my-3">Register Here</h4>
                            <form action="RegisterServlet" method ="post">
                                <div class="form-group">
                                    <label for="name">User Name</label>
                                    <input name="user_name" style="box-shadow: 2px 4px 10px #888888;" type="text" class="form-control" id="name" placeholder="Enter your name" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="email">User Email</label>
                                    <input name="user_email" style="box-shadow: 2px 4px 10px #888888;" type="email" class="form-control" id="email" placeholder="Enter your email" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="password">User Password</label>
                                    <input name="user_password" style="box-shadow: 2px 4px 10px #888888;" type="password" class="form-control" id="password" placeholder="Enter password" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="phone">User Phone</label>
                                    <input name="user_phone" style="box-shadow: 2px 4px 10px #888888;" type="number" class="form-control" id="phone" placeholder="Enter your phone number" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="address">User Address</label>
                                    <textarea name="user_address" style="height: 100px;" class="form-control" placeholder="Enter your address"></textarea>
                                </div>
                                <div class="container text-center">
                                    <button class="btn btn-outline-success">Register</button>
                                    <button class="btn btn-outline-warning">Reset</button>
                                </div>

                            </form>

                        </div>

                    </div>

                </div>
            </div>

        </div>
    </body>
</html>
