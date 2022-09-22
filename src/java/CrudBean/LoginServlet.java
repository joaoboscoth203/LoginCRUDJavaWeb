package CrudBean;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joaobosco
 */
@WebServlet (urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // accept username and password from index
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // database
        try{
            //open connection
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/login", "postgres", "postgres");
            
            //get data from login using query
            Statement stm = con.createStatement();
            ResultSet rs = stm.executeQuery("select * from usuario where nome='"+username+"' and senha='"+password+"'");
            if(rs.next()) {
                // if username and password true than go to home.html file
                response.sendRedirect("viewusuarios.jsp"); 
                
            } else {
                //wrong username and password
               // System.out.println("Wrong username or password.");
               response.sendRedirect("loginfailed.jsp"); 
            }
            
            // close connection
            con.close();
            
        } catch(Exception e) {
            System.out.println(e.getMessage());
        }
       
    }


}
