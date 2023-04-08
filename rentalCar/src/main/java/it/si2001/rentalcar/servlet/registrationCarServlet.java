package it.si2001.rentalcar.servlet;

import it.si2001.rentalcar.dao.CarDAO;
import it.si2001.rentalcar.dao.UserDAO;
import it.si2001.rentalcar.model.Car;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet("/registrationCarServlet")
@MultipartConfig(fileSizeThreshold = 1600 * 1067 * 2,  // 1 MB
        maxFileSize = 1024 * 1024 * 10, // 10 MB
        maxRequestSize = 1024 * 1024 * 15)
public class registrationCarServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetch form data

            Part part = request.getPart("img");
            String fileName = part.getSubmittedFileName();
            String path = ("C:\\Progetti\\rentalCar\\src\\main\\webapp\\pictures" + File.separator + fileName);
            String path2 = ("C:\\Progetti\\rentalCar\\target\\rentalCar-1.0-SNAPSHOT\\pictures" + File.separator + fileName);

            InputStream is = part.getInputStream();
            boolean test = uploadFile(is, path);
            boolean test2 = uploadFile(is, path2);
            if (test && test2) {
                request.getSession().setAttribute("successMessage", "Inserimento veicolo eseguito con successo!");
            } else {
                request.getSession().setAttribute("errorMessage", "Errore nell'inserimento del veicolo!");
            }
            response.sendRedirect("pages/parcoAuto.jsp");
        }
    }

    public boolean uploadFile(InputStream is, String path) {
        boolean test = false;
        try {
            byte[] byt = new byte[is.available()];
            is.read(byt);

            FileOutputStream fops = new FileOutputStream(path);
            fops.write(byt);
            fops.flush();
            fops.close();

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brand = request.getParameter("brand");
        String model = request.getParameter("model");
        String type = request.getParameter("type");
        Part part = request.getPart("img");
        String fileName = part.getSubmittedFileName();
        int hp = Integer.valueOf(request.getParameter("hp"));
        short registration = Short.parseShort(request.getParameter("registration"));
        String plate = request.getParameter("plate");
        Car c = new Car();
        c.setBrand(brand);
        c.setModel(model);
        c.setType(type);
        c.setCarRegistration(registration);
        c.setPlate(plate);
        c.setHp(hp);
        c.setImg(fileName);
        CarDAO c1 = new CarDAO();
        UserDAO x = new UserDAO();
        try {
            if (c1.check(brand, model, type, hp)) {
                request.getSession().setAttribute("warningMessage", "Veicolo già presente nel database!");
                response.sendRedirect("pages/parcoAuto.jsp");
            }
        } catch (javax.persistence.NoResultException e) {
            x.saveUser(c);
            processRequest(request, response);
        }
    }
}
