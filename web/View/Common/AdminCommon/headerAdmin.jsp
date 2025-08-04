<%-- 
    Document   : headerAdmin
    Created on : Jul 3, 2024, 4:19:08 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">
        <!-- User Menu-->
        <li><a class="app-nav__item" href="${pageContext.request.contextPath}/Home"><i class='bx bx-log-out bx-rotate-180'></i> </a>
        </li>
    </ul>
</header>
