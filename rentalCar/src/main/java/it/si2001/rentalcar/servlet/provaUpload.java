package it.si2001.rentalcar.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;

@WebServlet(name = "provaUpload", value = "/provaUpload")
public class provaUpload extends HttpServlet {




    @MultipartConfig
    public class UploadServlet extends HttpServlet {


        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            response.setContentType("text/html;charset=UTF-8");
            try (PrintWriter out = response.getWriter()) {
                //fetch form data

                Part part = request.getPart("img");
                String fileName = part.getSubmittedFileName();

                String path = getServletContext().getRealPath("/"+"pictures"+ File.separator+fileName);

                InputStream is = part.getInputStream();
                boolean test = uploadFile(is,path);
                if(test){
                    out.println("uploaded");
                }else{
                    out.println("something wrong");
                }


            }
        }

        public boolean uploadFile(InputStream is, String path){
            boolean test = false;
            try{
                byte[] byt = new byte[is.available()];
                is.read();

                FileOutputStream fops = new FileOutputStream(path);
                fops.write(byt);
                fops.flush();
                fops.close();

                test = true;

            }catch(Exception e){
                e.printStackTrace();
            }

            return test;
        }

        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
                throws ServletException, IOException {
            processRequest(request, response);
        }

        // </editor-fold>

    }
}
