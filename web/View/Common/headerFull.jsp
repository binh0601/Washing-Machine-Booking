<%-- 
    Document   : headerFull
    Created on : Jun 16, 2024, 11:05:21 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="header-area">
    <div class="container">
        <div class="header-large-device">
            <div class="header-top header-top-ptb-1 border-bottom-1">
                <div class="row">
                    <div class="col-xl-4 col-lg-5">
                        <div class="header-offer-wrap">
                            <p><i class="icon-paper-plane"></i> FREE SHIPPING world wide for all orders over <span>$199</span></p>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-7">
                        <div class="header-top-right">
                            <div class="same-style-wrap">
                                <div class="same-style same-style-border track-order">
                                    <a href="order-tracking.html">Track Your Order</a>
                                </div>
<!--                                <div class="same-style same-style-border language-wrap">
                                    <a class="language-dropdown-active" href="#">English <i class="icon-arrow-down"></i></a>
                                    <div class="language-dropdown">
                                        <ul>
                                            <li><a href="#">English</a></li>
                                            <li><a href="#">Vietnam</a></li>
                                           
                                        </ul>
                                    </div>
                                </div>-->
<!--                                <div class="same-style same-style-border currency-wrap">
                                    <a class="currency-dropdown-active" href="#">US Dollar <i class="icon-arrow-down"></i></a>
                                    <div class="currency-dropdown">
                                        <ul>
                                            <li><a href="#">USD</a></li>
                                            <li><a href="#">VIE</a></li>
                                            
                                        </ul>
                                    </div>
                                </div>-->
                            </div>
                            <div class="social-style-1 social-style-1-mrg">
                                <a href="#"><i class="icon-social-twitter"></i></a>
                                <a href="#"><i class="icon-social-facebook"></i></a>
                                <a href="#"><i class="icon-social-instagram"></i></a>
                                <a href="#"><i class="icon-social-youtube"></i></a>
                                <a href="#"><i class="icon-social-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="header-bottom">
                <div class="row align-items-center">
                    <div class="col-xl-2 col-lg-2">
                        <div class="logo">
                            <a href="${pageContext.request.contextPath}/Home"><img src="${pageContext.request.contextPath}/assets/images/logo/clothing.jpg" alt="logo"></a>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-7">
                        <div class="main-menu main-menu-padding-1 main-menu-lh-1">
                            <nav>
                                <ul>
                                    <li><a href="${pageContext.request.contextPath}/Home">HOME </a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/Product">SHOP </a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/Cart">MY CART</a>
                                    </li>
                                    <li><a href="contact.html">CONTACT </a></li>
                                        <c:if test="${sessionScope.user.isAdmin}">
                                        <li><a href="${pageContext.request.contextPath}/dashboard">SHOP MANAGEMENT </a></li>
                                        </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-xl-2 col-lg-3">
                        <div class="header-action header-action-flex header-action-mrg-right">
                            <div class="same-style-2 header-search-1">
                                <a class="search-toggle" href="#">
                                    <i class="icon-magnifier s-open"></i>
                                    <i class="icon_close s-close"></i>
                                </a>
                                <div class="search-wrap-1">
                                    <form action="${pageContext.request.contextPath}/Product">
                                        <input type="text" hidden name="action" value="searchFilter">
                                        <input placeholder="Type anything & Hit enter" name="searchKey" type="text">
                                        <button class="button-search"><i class="icon-magnifier"></i></button>
                                    </form>
                                </div>
                            </div>
                            <div class="same-style-2">
                                <a class="active" href="${pageContext.request.contextPath}/user?action=accountDetail&id=${user.user_id}" style="text-align: center;"><i class="icon-user"></i><p>${sessionScope.user.user_name}</p></a>
                            </div>
                            <div class="same-style-2 header-cart">
                                <a class="cart-active" href="#" id="header_cart">
                                    <i class="icon-basket-loaded"></i><span class="pro-count red">${sessionScope.cartSize}</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="header-small-device small-device-ptb-1">
            <div class="row align-items-center">
                <div class="col-5">
                    <div class="mobile-logo">
                        <a href="${pageContext.request.contextPath}/Home">
                            <img alt="" src="${pageContext.request.contextPath}/assets/images/logo/clothing.jpg">
                        </a>
                    </div>
                </div>
                <div class="col-7">
                    <div class="header-action header-action-flex">
                        <div class="same-style-2">
                            <a href="login-register.html"><i class="icon-user"></i></a>
                        </div>
                        <div class="same-style-2">
                            <a href="wishlist.html"><i class="icon-heart"></i><span class="pro-count red">03</span></a>
                        </div>
                        <div class="same-style-2 header-cart">
                            <a class="cart-active" href="#">
                                <i class="icon-basket-loaded"></i><span class="pro-count red">${sessionScope.cartSize}</span>
                            </a>
                        </div>
                        <div class="same-style-2 main-menu-icon">
                            <a class="mobile-header-button-active" href="#"><i class="icon-menu"></i> </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
