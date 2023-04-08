package it.si2001.rentalcar.servlet;

import it.si2001.rentalcar.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        UserDAO x = new UserDAO();
        String pathInfo = request.getPathInfo();

        try {
            HttpSession session = request.getSession();
            session.setAttribute("auth", x.findUser(email, pass));
            response.sendRedirect("index.jsp");
        } catch (javax.persistence.NoResultException e) {
            log(request.getPathInfo());
            System.out.println(request.getServletPath());
            request.getSession().setAttribute("errorMessage", "Utente non trovato!");
            response.sendRedirect("index.jsp");
        }
    }

}
