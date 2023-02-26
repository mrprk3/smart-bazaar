<%@page import="java.util.List"%>
<%@page import="com.bigbazar.helper.FactoryProvider"%>
<%@page import="com.bigbazar.dao.CategoryDao"%>
<%@page import="com.bigbazar.entity.User" %>
<%@page import="com.bigbazar.entity.Category"%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not login !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin");

            return;
        }
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin</title>
        <%@include file="components/common_css_js.jsp" %>

        <style>
            .bodydesign {
                background-color: lightblue;
                text-align: center;
            }
        </style>


    </head>
    <body class="bodydesign">
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-3">
                <div class="col-md-4">
                    <div style="box-shadow: 2px 4px 10px #888888;" class="card ">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 150px" class="img-fluid" src="img/profile.png" alt="user_icon"/>
                            </div>

                            <h1>12345</h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>

                    </div>

                </div>

                <div class="col-md-4">
                    <div style="box-shadow: 2px 4px 10px #888888;" class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 150px" class="img-fluid" src="img/list.png" alt="user_icon"/>
                            </div>
                            <h1>12345</h1>

                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>

                    </div>

                </div>

                <div class="col-md-4">
                    <div style="box-shadow: 2px 4px 10px #888888;" class="card">
                        <div class="card-body  text-center">
                            <div class="container">
                                <img style="max-width: 150px" class="img-fluid" src="img/product.png" alt="user_icon"/>
                            </div>
                            <h1>12345</h1>

                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>

                    </div>

                </div>
            </div>

            <div class="row mt-5">
                <div class="col-md-6">

                    <div style="box-shadow: 2px 4px 10px #888888;" class="card " data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 150px" class="img-fluid" src="img/plus.png" alt="user_icon"/>
                            </div>

                            <p class="mt-2">click here to add new categories</p>
                            <h1 class="text-uppercase text-muted">Add Categories</h1>
                        </div>

                    </div>

                </div>

                <div class="col-md-6">

                    <div style="box-shadow: 2px 4px 10px #888888;" class="card " data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-width: 150px" class="img-fluid" src="img/addnewp.png" alt="user_icon"/>
                            </div>

                            <p class="mt-2">click here to add new Product</p>
                            <h1 class="text-uppercase text-muted">Add Products</h1>
                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!--add-category-model-->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Enter Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">                     
                            <input type="hidden" name="operation" value="addcategory">
                            <div class="form-group">
                                <input type="text" class="form-control" name="catTitle" placeholder="Enter Category Title" required/>
                            </div>

                            <div class="form-group">
                                <textarea style="height: 250px" class="form-control" name="catDescription" placeholder="Enter category description" required>
                                    
                                </textarea> 
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!--end-add-category-modal-->
        <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
        <!--start-product-modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addproduct">
                            
                            <!--product-title-->
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required>
                            </div>
                            <!--product-description-->
                            <div class="form-group">
                                <textarea style="height: 180px" class="form-control" placeholder="Enter product description" name="pDesc"></textarea>
                            </div>

                            <!--product-price-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter price of the product" name="pPrice" required>
                            </div>

                            <!--product-discount-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required>
                            </div>

                            <!--product-qty-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter product quentity" name="pQuentity" required>
                            </div>

                            <!--fetch-product-category-from db-->

                            <%                                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                List<Category> list = cdao.getCategoryes();
                            %>
                            <div class="form-group">
                                <select name="catId" class="form-control" id="">

                                    <%
                                        for (Category c : list) {


                                    %>

                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option><%}%>

                                </select>
                            </div>

                            <!--product-photo-->
                            <div class="form-group text-center">
                                <!--                                <level for="pPic">Select product photo</level>
                                                                <br></br>-->
                                <input type="file" id="pPic" name="pPic" required>
                            </div>

                            <!--submit-button-->
                            <div class="container text-center">
                                <button class="btn btn-outline-success">Add Product</button>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <!--end-product-modal-->


    </body>
</html>
