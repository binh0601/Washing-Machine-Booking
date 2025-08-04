<%-- 
    Document   : order
    Created on : Jul 3, 2024, 4:13:21 PM
    Author     : HP
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Danh sách đơn hàng | Quản trị Admin</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/mainAdmin.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

        <!-- Enhanced CSS -->
        <style>
            /* Enhanced styling for the order management page */
            .filter-section {
                background-color: #f8f9fa;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            }

            .filter-section h6 {
                color: #333;
                font-weight: 600;
                margin-bottom: 12px;
                font-size: 14px;
                text-transform: uppercase;
                letter-spacing: 0.5px;
            }

            .filter-card {
                height: 100%;
                background-color: white;
                border-radius: 6px;
                padding: 15px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            }

            .sorting-section {
                margin-bottom: 20px;
            }

            .sorting-control {
                background-color: white;
                border-radius: 6px;
                padding: 10px 15px;
                margin-bottom: 15px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
                display: inline-block;
                margin-right: 15px;
            }

            .sorting-control label {
                font-weight: 600;
                color: #333;
                margin-right: 10px;
                font-size: 14px;
            }

            .btn-outline-primary {
                border-color: #007bff;
                color: #007bff;
                transition: all 0.2s;
            }

            .btn-outline-primary:hover {
                background-color: #007bff;
                color: white;
            }

            .input-group-text {
                background-color: #f0f0f0;
                border: 1px solid #ced4da;
                color: #495057;
            }

            #dailyRevenueSummary {
                max-height: 150px;
                overflow-y: auto;
                padding: 10px;
                background-color: white;
                border-radius: 6px;
                border: 1px solid #dee2e6;
            }

            #dailyRevenueSummary p {
                margin-bottom: 8px;
                padding-bottom: 8px;
                border-bottom: 1px solid #f0f0f0;
            }

            #dailyRevenueSummary p:last-child {
                border-bottom: none;
                margin-bottom: 0;
                padding-bottom: 0;
            }

            #dailyRevenueSummary strong {
                color: #28a745;
                font-weight: 600;
            }

            /* Table enhancements */
            #sampleTable {
                border-collapse: separate;
                border-spacing: 0;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            }

            #sampleTable thead th {
                background-color: #f8f9fa;
                border-bottom: 2px solid #dee2e6;
                font-weight: 600;
                text-transform: uppercase;
                font-size: 12px;
                letter-spacing: 0.5px;
                padding: 12px 15px;
            }

            #sampleTable tbody td {
                padding: 12px 15px;
                vertical-align: middle;
            }

            #sampleTable tbody tr:hover {
                background-color: #f8f9fa;
            }

            /* Badge styling */
            .badge.bg-success {
                font-weight: 600;
                padding: 5px 10px;
                border-radius: 4px;
            }

            /* Action button styling */
            .action-link {
                display: inline-block;
                color: rgb(245, 157, 57);
                background-color: rgb(251, 226, 197);
                padding: 6px 12px;
                border-radius: 4px;
                font-weight: 500;
                text-decoration: none;
                transition: all 0.2s;
            }

            .action-link:hover {
                background-color: rgb(245, 157, 57);
                color: white;
                text-decoration: none;
            }

            /* Print button enhancement */
            .btn-delete.btn-sm.print-file {
                background-color: #6c757d;
                color: white;
                border-radius: 4px;
                padding: 8px 15px;
                transition: all 0.2s;
            }

            .btn-delete.btn-sm.print-file:hover {
                background-color: #5a6268;
            }

            /* DataTable pagination enhancements */
            .dataTables_wrapper .dataTables_paginate .paginate_button {
                border-radius: 4px;
                margin: 0 3px;
            }

            .dataTables_wrapper .dataTables_paginate .paginate_button.current {
                background: #007bff;
                border-color: #007bff;
                color: white !important;
            }

            /* Page title enhancement */
            .app-title {
                background-color: white;
                padding: 15px;
                margin-bottom: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            }

            .breadcrumb-item a {
                color: #007bff;
                font-weight: 600;
            }

            #clock {
                color: #6c757d;
                font-weight: 500;
            }

            /* Responsive adjustments */
            @media (max-width: 992px) {
                .filter-card {
                    margin-bottom: 15px;
                }
            }
        </style>
    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <jsp:include page="../Common/AdminCommon/headerAdmin.jsp"></jsp:include>
            <!-- Sidebar menu-->
        <jsp:include page="../Common/AdminCommon/sidebarAdmin.jsp"></jsp:include>
            <main class="app-content">
                <div class="app-title">
                    <ul class="app-breadcrumb breadcrumb side">
                        <li class="breadcrumb-item active"><a href="#"><b>Danh sách đơn hàng</b></a></li>
                    </ul>
                    <div id="clock"></div>
                </div>

                <!-- New Filter Controls with enhanced styling -->
                <div class="filter-section">
                    <div class="row">
                        <!-- Date filter elements -->
                        <div class="col-md-4">
                            <div class="filter-card">
                                <h6>Lọc theo ngày mua</h6>
                                <div class="input-group mb-2">
                                    <div class="input-group-prepend"><span class="input-group-text">Từ</span></div>
                                    <input type="date" id="dateFrom" class="form-control">
                                </div>
                                <div class="input-group">
                                    <div class="input-group-prepend"><span class="input-group-text">Đến</span></div>
                                    <input type="date" id="dateTo" class="form-control">
                                </div>
                            </div>
                        </div>

                        <!-- Address filter elements -->
                        <div class="col-md-4">
                            <div class="filter-card">
                                <h6>Lọc theo địa chỉ</h6>
                                <div class="input-group">
                                    <input type="text" id="addressFilter" class="form-control" placeholder="Nhập địa chỉ...">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-primary" type="button" id="applyAddressFilter">Lọc</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Daily revenue summary elements -->
<!--                        <div class="col-md-4">
                            <div class="filter-card">
                                <h6>Tổng doanh thu theo ngày</h6>
                                <div id="dailyRevenueSummary"></div>
                            </div>
                        </div>-->
                    </div>
                </div>

                <!-- Custom Sort Controls with enhanced styling -->
                <div class="sorting-section">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="sorting-control">
                                <label>Sắp xếp tên người dùng:</label>
                                <button class="btn btn-sm btn-outline-primary mr-2" onclick="sortByUserName('asc')">A đến Z</button>
                                <button class="btn btn-sm btn-outline-primary" onclick="sortByUserName('desc')">Z đến A</button>
                            </div>
                        </div>
<!--                        <div class="col-md-6">
                            <div class="sorting-control">
                                <label>Sắp xếp theo giá:</label>
                                <button class="btn btn-sm btn-outline-primary mr-2" onclick="sortByAmount('asc')">Thấp đến cao</button>
                                <button class="btn btn-sm btn-outline-primary" onclick="sortByAmount('desc')">Cao đến thấp</button>
                            </div>
                        </div>-->
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="tile">
                            <div class="tile-body">
<!--                                <div class="row element-button">
                                    <div class="col-sm-2">
                                        <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()">
                                            <i class="fas fa-print"></i> In dữ liệu
                                        </a>
                                    </div>
                                </div>-->
                                <table class="table table-hover table-bordered js-copytextarea" id="sampleTable">
                                    <thead>
                                        <tr>
                                            <th>ID đơn hàng</th>
                                            <th>Người dùng</th>
                                            <th>Tên Người nhận</th>
                                            <th>Số điện thoại</th>
                                            <th>Địa chỉ</th>
                                            <th>Ngày mua</th>
                                            <th>Tổng tiền</th>
                                            <th>Thanh Toán</th>
                                            <th>Tính năng</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="totalAmount" value="0" />
                                    <c:forEach items="${order}" var="o">
                                        <tr>
                                            <td>${o.id}</td>
                                            <td>${o.user == null ? "Khách" : o.user.user_name}</td>
                                            <td>${o.name}</td>
                                            <td>(+84)${o.phone}</td>
                                            <td>${o.address}</td>
                                            <td>${o.createdAt}</td>
                                            <td>
                                                <fmt:setLocale value="en_US" />
                                                <fmt:formatNumber value="${o.amount}" type="currency" />
                                            </td>
                                            <td><span class="badge bg-success">${o.paymentMethod}</span></td>
                                            <td>
                                                <a class="action-link" href="ordermanager?action=showdetail&order_id=${o.id}">
                                                    <i class="fa fa-info-circle"></i> Chi tiết đơn hàng
                                                </a>
                                            </td>
                                        </tr>
                                        <c:set var="totalAmount" value="${totalAmount + o.amount}" />
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="6" class="text-right"><strong>Tổng tiền :</strong></td>
                                        <td>
                                            
                                            <fmt:formatNumber value="${totalAmount}" type="currency" />
                                        </td>
                                        <td colspan="2"></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Essential javascripts for application to work-->
<script src="${pageContext.request.contextPath}/assets/js/vendor/jquery-v3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/vendor/bootstrap.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/mainAdmin.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="${pageContext.request.contextPath}/assets/js/plugins/pace.min.js"></script>
<!-- Page specific javascripts-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
<!-- Data table plugin-->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/plugins/dataTables.bootstrap.min.js"></script>

<script>
                    //Thời Gian
//                    function time() {
//                        var today = new Date();
//                        var weekday = new Array(7);
//                        weekday[0] = "Chủ Nhật";
//                        weekday[1] = "Thứ Hai";
//                        weekday[2] = "Thứ Ba";
//                        weekday[3] = "Thứ Tư";
//                        weekday[4] = "Thứ Năm";
//                        weekday[5] = "Thứ Sáu";
//                        weekday[6] = "Thứ Bảy";
//                        var day = weekday[today.getDay()];
//                        var dd = today.getDate();
//                        var mm = today.getMonth() + 1;
//                        var yyyy = today.getFullYear();
//                        var h = today.getHours();
//                        var m = today.getMinutes();
//                        var s = today.getSeconds();
//                        m = checkTime(m);
//                        s = checkTime(s);
//                        nowTime = h + " giờ " + m + " phút " + s + " giây";
//                        if (dd < 10) {
//                            dd = '0' + dd;
//                        }
//                        if (mm < 10) {
//                            mm = '0' + mm;
//                        }
//                        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
//                        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
//                                '</span>';
//                        document.getElementById("clock").innerHTML = tmp;
//                        clocktime = setTimeout("time()", "1000", "Javascript");
//
//                        function checkTime(i) {
//                            if (i < 10) {
//                                i = "0" + i;
//                            }
//                            return i;
//                        }
//                    }

                    //In dữ liệu
                    var myApp = new function () {
                        this.printTable = function () {
                            var tab = document.getElementById('sampleTable');
                            var win = window.open('', '', 'height=700,width=700');
                            win.document.write(tab.outerHTML);
                            win.document.close();
                            win.print();
                        };
                    };

                    // Initialize DataTable with enhanced features
                    var table;
                    $(document).ready(function () {
                        table = $('#sampleTable').DataTable({
                            "aaSorting": [[5, 'desc']], // Default sort by date (descending)
                            "language": {
                                "lengthMenu": "Hiển thị _MENU_ bản ghi",
                                "zeroRecords": "Không tìm thấy dữ liệu",
                                "info": "Hiển thị trang _PAGE_ của _PAGES_",
                                "infoEmpty": "Không có bản ghi nào",
                                "infoFiltered": "(lọc từ _MAX_ bản ghi)",
                                "search": "Tìm kiếm:",
                                "paginate": {
                                    "first": "Đầu",
                                    "last": "Cuối",
                                    "next": "Sau",
                                    "previous": "Trước"
                                }
                            }
                        });

                        // Initialize date range filter
                        initializeDateFilter();

                        // Initialize address filter
                        initializeAddressFilter();

                        // Calculate initial daily revenue
                        calculateDailyRevenue();
                    });

                    // Function to sort by user name
                    function sortByUserName(direction) {
                        table.order([1, direction]).draw();
                    }

                    // Function to sort by amount
                    function sortByAmount(direction) {
                        table.order([6, direction]).draw();
                    }

                    // Initialize date range filter
                    function initializeDateFilter() {
                        $('#dateFrom, #dateTo').on('change', function () {
                            var dateFrom = $('#dateFrom').val();
                            var dateTo = $('#dateTo').val();

                            $.fn.dataTable.ext.search.push(function (settings, data, dataIndex) {
                                if (!dateFrom && !dateTo) {
                                    return true; // No filter applied
                                }

                                var orderDate = new Date(data[5]); // Date column (index 5)
                                var startDate = dateFrom ? new Date(dateFrom) : new Date(0);
                                var endDate = dateTo ? new Date(dateTo) : new Date(9999, 11, 31);

                                return orderDate >= startDate && orderDate <= endDate;
                            });

                            table.draw();
                            calculateDailyRevenue();

                            // Remove the filter after it's applied
                            $.fn.dataTable.ext.search.pop();
                        });
                    }

                    // Initialize address filter
                    function initializeAddressFilter() {
                        $('#applyAddressFilter').on('click', function () {
                            var addressTerm = $('#addressFilter').val().toLowerCase();

                            table.column(4) // Address column (index 4)
                                    .search(addressTerm, true, false)
                                    .draw();

                            calculateDailyRevenue();
                        });

                        // Also enable filtering on pressing Enter key
                        $('#addressFilter').on('keypress', function (e) {
                            if (e.which === 13) { // Enter key
                                $('#applyAddressFilter').click();
                            }
                        });
                    }

                    // Calculate daily revenue from visible rows
                    function calculateDailyRevenue() {
                        var dailyRevenue = {};

                        // Loop through visible rows
                        table.rows({search: 'applied'}).every(function (rowIdx, tableLoop, rowLoop) {
                            var data = this.data();
                            var date = data[5]; // Date column (index 5)
                            var formattedDate = formatDate(date);

                            // Extract amount (remove currency symbol and commas)
                            var amountText = data[6]; // Amount column (index 6)
                            var amount = parseFloat(amountText.replace(/[$,]/g, ''));

                            // Add to daily revenue
                            if (!dailyRevenue[formattedDate]) {
                                dailyRevenue[formattedDate] = 0;
                            }
                            dailyRevenue[formattedDate] += amount;
                        });

                        // Display daily revenue
                        displayDailyRevenue(dailyRevenue);
                    }

                    // Format date to YYYY-MM-DD
                    function formatDate(dateString) {
                        var date = new Date(dateString);
                        return date.toISOString().split('T')[0];
                    }

                    // Display daily revenue in the summary container
                    function displayDailyRevenue(dailyRevenue) {
                        var $summary = $('#dailyRevenueSummary');
                        $summary.empty();

                        // Convert to array for sorting
                        var revenueArray = Object.entries(dailyRevenue);

                        // Sort by date (default)
                        revenueArray.sort(function (a, b) {
                            return new Date(a[0]) - new Date(b[0]);
                        });

                        // Display daily revenue
                        if (revenueArray.length === 0) {
                            $summary.append('<p>Không có dữ liệu</p>');
                        } else {
                            var totalAllDays = 0;
                            revenueArray.forEach(function (item) {
                                var date = item[0];
                                var amount = item[1];
                                totalAllDays += amount;
                                $summary.append('<p>' + date + ': <strong>' + formatCurrency(amount) + '</strong></p>');
                            });

                            // Add total for all days
                            $summary.append('<p class="mt-2 pt-2" style="border-top: 1px solid #dee2e6;"><b>Tổng cộng:</b> <strong>' +
                                    formatCurrency(totalAllDays) + '</strong></p>');
                        }
                    }

                    // Format currency
                    function formatCurrency(amount) {
                        return '$' + amount.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
                    }
</script>
</body>
</html>