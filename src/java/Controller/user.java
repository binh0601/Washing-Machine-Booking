// This is a personal academic project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++, C#, and Java: http://www.viva64.com
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Account;
import Model.Order;
import Model.OrderDetail;
import dal.OrderDAO;
import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author HP
 */
public class user extends HttpServlet {

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
            String Mess = request.getParameter("errorMess");
            if (Mess != null) {
                request.setAttribute("errorMessage", Mess);
            }
            request.getRequestDispatcher("View/User/loginRegister.jsp").forward(request, response);
        } else {
            if (action.equals("login")) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String rem = request.getParameter("rem");
                UserDAO dao = new UserDAO();

                Account user = dao.getUser(email, password);
                if (email == null || password == null || email.isBlank() || password.isBlank()) {
                    request.setAttribute("errorMessage", "Vui lòng điền tài khoản và mật khẩu!");
                    request.getRequestDispatcher("View/User/loginRegister.jsp").forward(request, response);
                } else {
                    if (user == null) {
                        request.setAttribute("errorMessage", "Tài khoản hoặc mật khẩu không đúng!");
                        request.getRequestDispatcher("View/User/loginRegister.jsp").forward(request, response);
                    } else {
                        Cookie user_email = new Cookie("email", email);
                        Cookie pass = new Cookie("pass", password);
                        Cookie r = new Cookie("rem", rem);
                        request.getSession().setAttribute("user", user);
                        if (rem != null) {
                            user_email.setMaxAge(60 * 60 * 24);
                            pass.setMaxAge(60 * 60 * 24);
                            r.setMaxAge(60 * 60 * 24);
                        } else {
                            user_email.setMaxAge(0);
                            pass.setMaxAge(0);
                            r.setMaxAge(0);
                        }
                        response.addCookie(user_email);
                        response.addCookie(pass);
                        response.addCookie(r);
                        if (!user.isIsAdmin()) {
                            response.sendRedirect(request.getContextPath() + "/Home");
                        } else {
                            response.sendRedirect(request.getContextPath() + "/dashboard");
                        }
                    }
                }
            }

            if (action.equals("logout")) {
                request.getSession().removeAttribute("user");
                response.sendRedirect(request.getContextPath() + "/Home");
            }
            if (action.equals("register")) {
                String regisEmail = request.getParameter("user_email");
                String pass = request.getParameter("password");
                String username = request.getParameter("username");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                UserDAO dao = new UserDAO();

                if (dao.checkEmailExisted(regisEmail)) {
                    response.sendRedirect("View/User/loginRegister.jsp?emailTaken=true&regisEmail=" + regisEmail + "&regis=true");
                } else {
                    Account account = new Account(0, username, regisEmail, pass, false, address, phone);
                    dao.addUser(account);
                    response.sendRedirect("View/User/loginRegister.jsp?modalMess=Account created successfully! Please login&modalTitle=Register Successful");
                }
            }
            if (action.equals("accountDetail")) {
                String idRaw = request.getParameter("id");

                if (idRaw == null || idRaw.isBlank()) {
                    response.sendRedirect(request.getContextPath() + "/user?errorMess=Please login first!");
                }
                String changeMess = request.getParameter("changeMess");
                if (changeMess != null) {
                    if (changeMess.equals("true")) {
                        request.setAttribute("accChangeMess", "Thay đổi đã được lưu!!");
                    } else {
                        request.setAttribute("passWrong", "Sai mật khẩu!!");
                    }
                }
                try {
                    int id = Integer.parseInt(idRaw);
                    OrderDAO odao = new OrderDAO();
                    List<Order> orders = odao.getOrderByUserID(id);
                    request.setAttribute("orders", orders);
                    request.getRequestDispatcher("View/User/MyAccount.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                }
            }
            if (action.equals("getOrderModal")) {
                String idRaw = request.getParameter("id");
                try {
                    int id = Integer.parseInt(idRaw);
                    OrderDAO odao = new OrderDAO();
                    List<OrderDetail> details = odao.getDetail(id);
                    request.setAttribute("orderDetail", details);
                    request.getRequestDispatcher("View/User/MyAccount.jsp").forward(request, response);
                } catch (NumberFormatException e) {
                    response.getWriter().print(e);
                }
            }
            if (action.equals("changeAccountDetail")) {
                String name = request.getParameter("name");
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String curPass = request.getParameter("current_pwd");
                String newpass = request.getParameter("newpass");
                UserDAO dao = new UserDAO();
                Account curUser = (Account) request.getSession().getAttribute("user");
                if (curUser.getUser_pass().equals(curPass)) {
                    if (null != newpass && !newpass.isEmpty()) {
                        Account account = new Account(curUser.getUser_id(), name, curUser.getUser_email(), newpass, curUser.isIsAdmin(),
                                address, phone);
                        dao.updateUser(account);
                        request.getSession().setAttribute("user", account);
                        response.sendRedirect(request.getContextPath() + "/user?action=accountDetail&id=" + curUser.getUser_id());
                    } else {
                        Account account = new Account(curUser.getUser_id(), name, curUser.getUser_email(), curUser.getUser_pass(), curUser.isIsAdmin(),
                                address, phone);
                        dao.updateUser(account);
                        request.getSession().setAttribute("user", account);
                        response.sendRedirect(request.getContextPath() + "/user?action=accountDetail&changeMess=true&id=" + curUser.getUser_id());
                    }
                } else {
                    response.sendRedirect(request.getContextPath() + "/user?action=accountDetail&changeMess=false&id=" + curUser.getUser_id());
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
