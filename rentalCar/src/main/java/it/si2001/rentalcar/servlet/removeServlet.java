package it.si2001.rentalcar.servlet;

import it.si2001.rentalcar.dao.CarDAO;
import it.si2001.rentalcar.dao.UserDAO;
import it.si2001.rentalcar.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/removeServlet")
public class removeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String s = request.getParameter("del");
        if (s.equals("user")) {
            Long id = Long.valueOf(request.getParameter("id"));
            UserDAO x = new UserDAO();
            x.deleteUser(id);
            request.getSession().setAttribute("successMessage", "Utente rimosso con successo!");
            response.sendRedirect("pages/listaCustomer.jsp");
        } else {
            long id = Long.valueOf(request.getParameter("del"));
            CarDAO x = new CarDAO();
            x.deleteCar(id);
            request.getSession().setAttribute("successMessage", "Veicolo rimosso con successo!");
            response.sendRedirect("pages/parcoAuto.jsp");
        }

    }
}
