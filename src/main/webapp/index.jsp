    
<%@page import="com.bigbazar.helper.Helper"%>
<%@page import="com.bigbazar.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.bigbazar.dao.ProductDao"%>
<%@page import="com.bigbazar.entity.Product"%>
<%@page import="com.bigbazar.entity.Category"%>
<%@page import="com.bigbazar.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            /*            .div-1 {
                            background-color: #EBEBEB;
                        }*/

            /*             .div-3 {
                            background-color: #ffe6ff;
                        }*/

            * {
                box-sizing: border-box;
            }
            body {
                font-family: Verdana, sans-serif;
            }
            .mySlides {
                display: none;
            }
            img {
                vertical-align: middle;
            }

            /* Slideshow container */
            .slideshow-container {
                max-width: 1000px;
                position: relative;
                margin: auto;
            }

            /* Caption text */
            .text {
                color: #f2f2f2;
                font-size: 15px;
                padding: 8px 12px;
                position: absolute;
                bottom: 8px;
                width: 100%;
                text-align: center;
            }

            /* Number text (1/3 etc) */
            .numbertext {
                color: #f2f2f2;
                font-size: 12px;
                padding: 8px 12px;
                position: absolute;
                top: 0;
            }

            /* The dots/bullets/indicators */
            .dot {
                height: 15px;
                width: 15px;
                margin: 0 2px;
                background-color: #bbb;
                border-radius: 50%;
                display: inline-block;
                transition: background-color 0.6s ease;
            }

            /*            .active {
                            background-color: #717171;
                        }*/

            /* Fading animation */
            .fade {
                animation-name: fade;
                animation-duration: 6s;

            }

            @keyframes fade {
                from {
                    opacity: .4
                }
                to {
                    opacity: 1
                }
            }

            /* On smaller screens, decrease text size */
            @media only screen and (max-width: 300px) {
                .text {
                    font-size: 11px
                }
            }


        </style>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SMART BAZAAR</title>

        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body> 

        <%@include file="components/navbar.jsp" %>
        <br>
        <div class="div-3">

            <div class="slideshow-container">

                <div class="mySlides fade">
                    <div class="numbertext">1 / 3</div>
                    <img src="img/products/slide51.png" style="width:40%">
                    <!--<div class="text">Caption Text</div>-->
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">2 / 3</div>
                    <img src="img/products/slide31.png" style="width:68%">
                    <!--<div class="text">Caption Two</div>-->
                </div>

                <div class="mySlides fade">
                    <div class="numbertext">3 / 3</div>
                    <img src="img/products/slide41.png" style="width:58%">
                    <!--<div class="text">Caption Three</div>-->
                </div>

            </div>

            <div style="text-align:center">
                <span class="dot"></span> 
                <span class="dot"></span> 
                <span class="dot"></span> 
            </div>

        </div>


        <div class="div-1">
            <div class="row mt-3 mx-2">
                <%                String cat = request.getParameter("category");

                    ProductDao dao = new ProductDao(FactoryProvider.getFactory());
                    List<Product> list = null;

                    if (cat == null) {
                        list = dao.getAllProducts();
                    } else if (cat.trim().equals("all")) {
                        list = dao.getAllProducts();
                    } else {
                        int cid = Integer.parseInt(cat.trim());
                        list = dao.getAllProductsById(cid);
                    }

                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                    List<Category> clist = cdao.getCategoryes();
                %>

                <div>



                </div>
                <!--show category-->
                <div class="col-md-2">

                    <div class="list-group mt-4">
                        
                        <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>
                        

                        <%
                            for (Category c : clist) {


                        %>
                        <a href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle()%></a>

                        <%                            }
                        %>
                    </div>
                </div>
                <!--show products-->
                <div class="col-md-10">
                    <!--row-->
                    <div class="row mt-4">

                        <div class="col-md-12">

                            <div class="card-columns">

                                <!--getting-products-->
                                <%
                                    for (Product p : list) {
                                %>

                                <!--product card-->

                                <div class="card product-card">
                                    <div class="container text-center">
                                        <img src="img/products/<%= p.getpPhoto()%>" style="max-height: 270px; max-width: 100%; width: auto;" class="card-img-top" alt="...">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text">
                                            <%= Helper.get10Words(p.getpDescription())%>
                                        </p>

                                    </div>

                                    <div class="card-footer text-center">
                                        <button class="btn custom-bg text-white" onclick="add_to_cart(<%= p.getpId()%>, '<%= p.getpName()%>', <%= p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
                                        <button class="btn btn-outline-success"> &#36; <%= p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label" style="font-size: 10px!important; font-style: italic!important;text-decoration: line-through;
                                                                                                                                       "> <%=p.getpPrice()%>  (<%= p.getpDiscount()%> % off) </span></button>
                                    </div>

                                </div>

                                <%}
                                    if (list.size() == 0) {
                                        out.println("<h5>No items available in this category</h5>");
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/common_modals.jsp"%>

        <script>
            let slideIndex = 0;
            showSlides();

            function showSlides() {
                let i;
                let slides = document.getElementsByClassName("mySlides");
                let dots = document.getElementsByClassName("dot");
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                slideIndex++;
                if (slideIndex > slides.length) {
                    slideIndex = 1
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
                setTimeout(showSlides, 2000); // Change image every 2 seconds
            }
        </script>

    </body>
</html>
