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

@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       /*
        if(request.getParameter("sub").equals("mod")) {
            Long id = Long.valueOf(request.getParameter("id"));
            UserDAO a=new UserDAO();
            request.getSession().setAttribute("mod", a.findUser(id));
            response.sendRedirect("/pages/profiloUtente.jsp");
        }
        */
        Long id=Long.valueOf(request.getParameter("idmod"));
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String birth = request.getParameter("birth");
        User sess=(User)request.getSession().getAttribute("auth");
        User upd;
        UserDAO x = new UserDAO();
        if(sess.getRole().equals("ADMIN"))
         upd=x.findUser(id);
        else upd=sess;
        try {
            Date d = new SimpleDateFormat("yyyy-MM-dd").parse(birth);
            x.update(upd, name, surname, email, password, d);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        response.sendRedirect("index.jsp");
    }
}
