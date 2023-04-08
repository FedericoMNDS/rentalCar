package it.si2001.rentalcar.servlet;

import it.si2001.rentalcar.dao.UserDAO;
import it.si2001.rentalcar.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet("/registrationServlet")
public class registrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDAO x = new UserDAO();
        User u = new User();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String role = request.getParameter("sub");
        String surname = request.getParameter("surname");
        String birth = request.getParameter("birth").toString();
        Date d = new Date();
        try {
            d = (Date) new SimpleDateFormat("yyyy-MM-dd").parse(birth);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        try {
            if (x.check(name, surname, email, d)) {
                request.getSession().setAttribute("errorMessage", "<strong>ERRORE: </strong>Utente già presente nel database!");
                response.sendRedirect("pages/registration.jsp");
            }
        } catch (javax.persistence.NoResultException e) {
            if (request.getParameter("sub").equals("CUSTOMER")) {
                u.setBirth(d);
                u.setName(name);
                u.setSurname(surname);


            } else {
                u.setName("admin." + name);
            }
            u.setEmail(email);
            u.setPassword(pass);
            u.setRole(role);
            x.saveUser(u);
            request.setAttribute("successMessage", "Registrazione avvenuta con successo!");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}