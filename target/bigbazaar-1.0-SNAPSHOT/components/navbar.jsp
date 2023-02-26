<%@page import="com.bigbazar.entity.User" %>

<%
    User user1 = (User) session.getAttribute("current-user");

%>

<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <head>
        <style>
            body {
                font-family: Arial, Helvetica, sans-serif;
            }

            .navbar {
                width: 100%;
                background-color: #000099;
                overflow: auto;
            }

            .navbar a {
                float: left;
                padding: 12px;
                color: white;
                text-decoration: none;
                font-size: 17px;
            }

            .navbar a:hover {
                background-color: #000;
            }

            /*            .active {
                            background-color: #04AA6D;
                        }*/

            @media screen and (max-width: 500px) {
                .navbar a {
                    float: none;
                    display: block;
                }
            }



        </style>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark custom-bg">
            <div class ="container">

                <a class="navbar-brand" href="index.jsp"> <h3><b> SMART BAZAAR</b></h3></a>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">


                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp"> About<span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">Contact Us <span class="sr-only">(current)</span></a>
                        </li>
                        
                 
<!--                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Category
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">All Products</a>
                                <a class="dropdown-item" href="#"></a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </li>-->
                        <input class="search-bar" style="border-radius: 18px; width: 350px" type="text" placeholder="        Search Product">

                    </ul>
                    <ul class="navbar-nav ml-auto">

                        <li class="nav-item active">
                            <a class="nav-link" href="#!" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 25px; color: blue"></i> <span class="ml-2" style="font-size: 15px; margin-top: -25px">(2)</span> </a>
                        </li>


                        <%                    if (user1 == null) {
                        %>
                        <li class="nav-item active">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="register.jsp">Register</a>
                        </li>

                        <%
                        } else {
                        %>

                        <li class="nav-item active">
                            <a class="nav-link" href="#"><%= user1.getUserName()%></a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="LogoutServlet">Logout</a>
                        </li>


                        <%
                            }

                        %>



                    </ul>
                </div>

            </div>
        </nav>
</html></head></body>