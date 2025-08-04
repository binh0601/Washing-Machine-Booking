
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Cart;
import Model.Item;
import Model.Order;
import Model.OrderDetail;
import dal.OrderDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author HP
 */
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            String shipFeeRaw = request.getParameter("shipFee");
            try {

                Cart cart = (Cart) request.getSession().getAttribute("cart");
                if (cart.getItems().isEmpty()) {
                    response.sendRedirect(request.getContextPath() + "/Cart?modalMess=emptyCart");
                } else {
                    int shipFee = Integer.parseInt(shipFeeRaw);
                    request.setAttribute("shipFee", shipFee);
                    request.getRequestDispatcher("View/User/Checkout.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                response.getWriter().print(e);
            }

        } else {
            if (action.equals("createOrder")) {
                try {
                    String name = request.getParameter("name");
                    String email = request.getParameter("email");
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    String note = request.getParameter("note");
                    String payMethod = request.getParameter("payMethod");
                    String amountRaw = request.getParameter("totalAmount");

                    UserDAO udao = new UserDAO();
                    OrderDAO odao = new OrderDAO();
                    Cart cart = (Cart) request.getSession().getAttribute("cart");

                    List<OrderDetail> odList = new ArrayList<>();
                    for (Item i : cart.getItems()) {
                        OrderDetail od = new OrderDetail(i.getQuantity(), 0, i.getProduct(), i.getSize(), i.getColor());
                        odList.add(od);
                    }
                    try {
                        int accId = udao.getUserID(email);
                        double amount = Double.parseDouble(amountRaw);
                        Order order = new Order(0, amount, udao.getUserByID(accId), address, "", name, note, phone, payMethod);
                        order.setListOrderDetail(odList);
                        odao.addOrder(order);
                    } catch (NumberFormatException e) {
                        response.getWriter().print(e);
                    }
                    request.getSession().setAttribute("cart", new Cart());
                    String txt = new Cart().getCookieForm();
                    Cookie cartCookies = new Cookie("cart", txt);
                    cartCookies.setMaxAge(3 * 24 * 60 * 60);
                    response.addCookie(cartCookies);
                    response.sendRedirect(request.getContextPath() + "/Home?modalMess=successfulOrder");
                } catch (IOException e) {
                    response.getWriter().print(e);
                }

            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
