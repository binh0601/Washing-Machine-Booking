<%-- 
    Document   : Checkout
    Created on : Jul 2, 2024, 3:29:02 PM
    Author     : HP
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>CHECKOUT - SUPPERCLEAN</title>
        <meta name="robots" content="noindex, follow" />
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/images/logo/clothing.jpg">

        <!-- All CSS is here
            ============================================ -->

        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/simple-line-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/elegant.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/vendor/linear-icon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/nice-select.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/easyzoom.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/slick.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins/jquery-ui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

    </head>

    <body>

        <div class="main-wrapper">
            <jsp:include page="../Common/headerFull.jsp"></jsp:include>
                <!-- Mobile menu start -->
            <jsp:include page="../Common/mobileMenu.jsp"></jsp:include>
                <!-- mini cart start -->
            <jsp:include page="../Common/miniCart.jsp"></jsp:include>
                <div class="breadcrumb-area bg-gray">
                    <div class="container">
                        <div class="breadcrumb-content text-center">
                            <ul>
                                <li>
                                    <a href="${pageContext.request.contextPath}/Home">Home</a>
                            </li>
                            <li class="active">Checkout </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="checkout-main-area pt-120 pb-120">
                <div class="container">
                    <div class="customer-zone mb-20">
                        <p class="cart-page-title">Returning customer? <a class="checkout-click1" href="#">Click here to login</a></p>
                        <div class="checkout-login-info">
                            <p>If you have shopped with us before, please enter your details in the boxes below. If you are a new customer, please proceed to the Billing & Shipping section.</p>

                            
                            <div class="login-register-area pt-115 pb-120">
                                <c:set var="cookie" value="${pageContext.request.cookies}"></c:set>
                                    <div class="container">

                                        <div class="row">
                                            <div class="col-lg-7 col-md-12 ms-auto me-auto">
                                                <div class="login-register-wrapper">
                                                    <div class="login-register-tab-list nav">
                                                        <a  ${param.regis==null?'class="active"':''} data-bs-toggle="tab" href="#lg1">
                                                        <h4> login </h4>
                                                    </a>
                                                    <a ${param.regis!=null?'class="active"':''} data-bs-toggle="tab" href="#lg2">
                                                        <h4> register </h4>
                                                    </a>
                                                </div>
                                                <div class="tab-content">
                                                    <div id="lg1" class="tab-pane ${param.regis==null?'active':''}">
                                                        <div class="login-form-container">
                                                            <div class="login-register-form">
                                                                <form action="${pageContext.request.contextPath}/user?action=login" method="post">
                                                                    <input type="text" pattern="[^@\s]+@[^@\s]+\.[^@\s]+" title="Địa chỉ email không đúng định dạng" name="email" placeholder="Email" value="${cookie.email.value}">
                                                                    <input type="password" name="password" minlength="5" title="Mật khẩu cần trên 5 kí tự" placeholder="Password" value="${cookie.pass.value}">
                                                                    <c:if test="${errorMessage!=null}">
                                                                        <p class="alert alert-warning alert-warning" style="margin-top: 10px ;font: icon;">${errorMessage}</p>
                                                                    </c:if>
                                                                    <div class="button-box">
                                                                        <div class="login-toggle-btn">
                                                                            <input type="checkbox" name="rem" value="true" ${cookie.rem.value!=null?'checked':''}>
                                                                            <label>Remember me</label>
                                                                        </div>
                                                                        <button type="submit">Login</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div id="lg2" class="tab-pane ${param.regis!=null?'active':''}">
                                                        <div class="login-form-container">
                                                            <div class="login-register-form">
                                                                <form action="${pageContext.request.contextPath}/user?action=register" method="post" onsubmit="CheckRePassword(event)">
                                                                    <input type="text" name="username" placeholder="Username" required="true">
                                                                    <input type="password" name="password" minlength="5" title="Mật khẩu cần trên 5 kí tự" placeholder="Password" id="pass" required="true" onkeyup="document.getElementById('repass').setCustomValidity('')">
                                                                    <input type="password" name="repassword" minlength="5" title="Mật khẩu cần trên 5 kí tự" placeholder="Re-Password" id="repass" required="true" onkeyup="this.setCustomValidity('')">
                                                                    <input name="user_email" placeholder="Email" type="text" pattern="[^@\s]+@[^@\s]+\.[^@\s]+" title="Địa chỉ email không đúng định dạng" id="email" value="${param.regisEmail}">
                                                                    <input name="address" placeholder="Address" type="text">
                                                                    <input name="phone" placeholder="Phone" type="text" pattern="[0]{1}[0-9]{9}">
                                                                    <div class="button-box">
                                                                        <button type="submit">Register</button>
                                                                    </div>
                                                                    <c:if test="${param.emailTaken!=null}">
                                                                        <c:set value="true" var="check"/>
                                                                        <c:if test="${param.emailTaken.equals(check)}">
                                                                            <p class="alert alert-warning alert-warning" style="margin-top: 10px">Email already taken! Try another email</p>
                                                                        </c:if>
                                                                    </c:if>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${param.modalMess!=null}">
                                <jsp:include page="../Common/modalMessage.jsp"></jsp:include>
                                    <script>
                                        window.onload = () => {
                                            $('#modalMessContent').text("${param.modalMess}");
                                            $('#myModelTitle').text("${param.modalTitle}");
                                            const myModal = new bootstrap.Modal('#myMessModal');
                                            myModal.show();
                                        };
                                </script>
                            </c:if>
                        </div>
                    </div>

                    <div class="checkout-wrap pt-30">
                        <form action="Order" id="orderForm">
                            <input type="text" hidden value="createOrder" name="action">
                            <div class="row">
                                <c:if test="${sessionScope.user == null}">
                                    <div class="col-lg-7">
                                        <div class="billing-info-wrap mr-50">
                                            <h3>Billing Details</h3>
                                            <div class="row">

                                                <div class="col-lg-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Name <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" name="name" required="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Street Address <abbr class="required" title="required">*</abbr></label>
                                                        <input class="billing-address" name="address" placeholder="Your Address" type="text" required="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Phone <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" name="phone" placeholder="Your Phone Number" required="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Email Address <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" name="email"  placeholder="Your Email"  required="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="additional-info-wrap">
                                                <label>Order notes</label>
                                                <textarea placeholder="Notes about your order, e.g. special notes for delivery. " name="note"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <div class="col-lg-7">
                                        <div class="billing-info-wrap mr-50">
                                            <h3>Billing Details</h3>
                                            <div class="row">
                                                <div class="col-lg-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Name <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" name="name" value="${sessionScope.user.user_name}" required="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Street Address <abbr class="required" title="required">*</abbr></label>
                                                        <input class="billing-address" name="address" placeholder="Your Address" type="text" value="${sessionScope.user.address}" required="true">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Phone <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" name="phone" placeholder="Your Phone Number" value="${sessionScope.user.phone}" required="true" pattern="[0]{1}[0-9]{9}">
                                                    </div>
                                                </div>
                                                <div class="col-lg-12 col-md-12">
                                                    <div class="billing-info mb-20">
                                                        <label>Email Address <abbr class="required" title="required">*</abbr></label>
                                                        <input type="text" pattern="[^@\s]+@[^@\s]+\.[^@\s]+" title="Địa chỉ email không đúng định dạng" name="email" placeholder="Your Email" value="${sessionScope.user.user_email}" required="true">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="additional-info-wrap">
                                                <label>Order notes</label>
                                                <textarea placeholder="Notes about your order, e.g. special notes for delivery. " name="note"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <div class="col-lg-5">
                                    <div class="your-order-area">
                                        <h3>Your order</h3>
                                        <div class="your-order-wrap gray-bg-4">
                                            <div class="your-order-info-wrap">
                                                <div class="your-order-info">
                                                    <ul>
                                                        <li>Product <span>Total</span></li>
                                                    </ul>
                                                </div>
                                                <div class="your-order-middle">
                                                    <ul>
                                                        <c:forEach items="${sessionScope.cart.items}" var="i">
                                                            <li>${i.product.productName} X ${i.quantity}
                                                                <span>
                                                                    <fmt:setLocale value = "en_US"/>
                                                                    <fmt:formatNumber  value="${i.product.getProductPriceFloat() * i.quantity}"  type="currency"></fmt:formatNumber>
                                                                    </span></li>
                                                            </c:forEach>


                                                    </ul>
                                                </div>
                                                <div class="your-order-info order-subtotal">
                                                    <ul>
                                                        <li>Subtotal <span>
                                                                <fmt:setLocale value = "en_US"/>
                                                                <fmt:formatNumber  value="${sessionScope.cart.getTotalMoney()}"  type="currency"></fmt:formatNumber>
                                                                </span></li>
                                                        </ul>
                                                    </div>
                                                    <div class="your-order-info order-shipping">
                                                        <ul>
                                                            <li>Shipping <p>
                                                                <fmt:setLocale value = "en_US"/>
                                                                <fmt:formatNumber  value="${requestScope.shipFee}"  type="currency"></fmt:formatNumber>
                                                                </p>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                    <div class="your-order-info order-total">
                                                        <ul>
                                                            <li>Total <span>
                                                                <fmt:setLocale value = "en_US"/>
                                                                <fmt:formatNumber  value="${sessionScope.cart.getTotalMoney()+requestScope.shipFee}"  type="currency"></fmt:formatNumber>
                                                                <input type="hidden" value="${sessionScope.cart.getTotalMoney()+requestScope.shipFee}" name="totalAmount">
                                                            </span></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="payment-method">
                                                <div class="pay-top sin-payment">
                                                    <input id="payment_method_1" class="input-radio" type="radio" value="Direct Bank Transfer" checked="checked" name="payMethod">
                                                    <label for="payment_method_1"> Direct Bank Transfer </label>
                                                    <div class="payment-box payment_method_bacs">
                                                        <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference.</p>
                                                    </div>
                                                </div>
                                                <div class="pay-top sin-payment">
                                                    <input id="payment-method-2" class="input-radio" type="radio" value="Check payments" name="payMethod">
                                                    <label for="payment-method-2">Check payments</label>
                                                    <div class="payment-box payment_method_bacs">
                                                        <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference.</p>
                                                    </div>
                                                </div>
                                                <div class="pay-top sin-payment">
                                                    <input id="payment-method-3" class="input-radio" type="radio" value="Cash on delivery" name="payMethod">
                                                    <label for="payment-method-3">Cash on delivery </label>
                                                    <div class="payment-box payment_method_bacs">
                                                        <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference.</p>
                                                    </div>
                                                </div>
                                                <div class="pay-top sin-payment sin-payment-3">
                                                    <input id="payment-method-4" class="input-radio" type="radio" value="PayPal" name="payMethod">
                                                    <label for="payment-method-4">PayPal <img alt="" src="assets/images/icon-img/payment.png"><a href="#">What is PayPal?</a></label>
                                                    <div class="payment-box payment_method_bacs">
                                                        <p>Make your payment directly into our bank account. Please use your Order ID as the payment reference.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="Place-order">
                                            <a href="#" onclick="checkLoginAndSubmit()">Place Order</a>
                                            <input type="submit" id="orderFormSubmit" hidden>
                                        </div>
                                    </div>
                                </div>
                            </div>                   
                        </form>
                    </div>
                </div>
            </div>
            <jsp:include page="../Common/footer.jsp"></jsp:include>
            </div>
            
            <!-- Login Required Modal -->
            <div class="modal fade" id="loginRequiredModal" tabindex="-1" aria-labelledby="loginRequiredModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="loginRequiredModalLabel">Login Required</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <p>Please login to place your order.</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" onclick="scrollToLogin()">Go to Login</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- All JS is here
        ============================================ -->

            <script src="${pageContext.request.contextPath}/assets/js/vendor/modernizr-3.11.7.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-v3.6.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-migrate-v3.3.2.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/slick.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery.syotimer.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery.nice-select.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/wow.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/jquery-ui.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/magnific-popup.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/sticky-sidebar.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/easyzoom.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/scrollup.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/plugins/ajax-mail.js"></script>
        <!-- Main JS -->
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
        
        <!-- Check login script -->
        <script>
            function CheckRePassword(event) {
                var pass = document.getElementById("pass").value;
                var repass = document.getElementById("repass").value;
                if (pass !== repass) {
                    document.getElementById("repass").setCustomValidity("Mật khẩu không khớp");
                    event.preventDefault();
                } else {
                    document.getElementById("repass").setCustomValidity('');
                }
            }
            
            function checkLoginAndSubmit() {
                // Check if user is logged in
                var isLoggedIn = ${sessionScope.user != null};
                
                if (!isLoggedIn) {
                    // Show login required modal
                    var loginModal = new bootstrap.Modal(document.getElementById('loginRequiredModal'));
                    loginModal.show();
                } else {
                    // If logged in, submit the form
                    document.getElementById('orderFormSubmit').click();
                }
            }
            
            function scrollToLogin() {
                // Close the modal
                var loginModal = bootstrap.Modal.getInstance(document.getElementById('loginRequiredModal'));
                loginModal.hide();
                
                // Scroll to login section and expand it
                var loginSection = document.querySelector('.checkout-login-info');
                if (loginSection) {
                    loginSection.style.display = 'block';
                    loginSection.scrollIntoView({ behavior: 'smooth' });
                    
                    // Trigger the checkout click to expand the login form if it's not already visible
                    document.querySelector('.checkout-click1').click();
                }
            }
        </script>

    </body>

</html>