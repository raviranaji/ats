/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.DECO.servlet;

import com.tcs.ignite.DECO.bean.User;
import com.tcs.ignite.DECO.dao.decodao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author ignite292
 */
public class UserServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UserServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UserServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        PrintWriter out = response.getWriter();
        JSONObject obj = new JSONObject();
        try{
            String action = request.getParameter("act");
            if(action.equalsIgnoreCase("getAssignment")){
                
                JSONArray assignments = new decodao().getAssignments();
                obj.put("assignment_details",assignments);
            }else if(action.equalsIgnoreCase("register")){
                
                String user_name=request.getParameter("user_name");
                String password=request.getParameter("password");
                User user=new User();
                user.setUser_name(user_name);
                user.setPassword(password);
                JSONObject jSONObject=new decodao().register(user);
                if(jSONObject.has("reg_status")){
                    obj=jSONObject;
                }else{
                    HttpSession session=request.getSession();
                    session.setAttribute("username",jSONObject.getString("user_name"));
                    session.setAttribute("userid",jSONObject.get("userid"));
                    JSONObject page=new JSONObject();
                    if(Integer.parseInt(jSONObject.get("status").toString())==1){
                        if(Integer.parseInt(jSONObject.get("roleid").toString())!=1){

                            page.put("status",true);
                            page.put("page","userpage.jsp");
                            obj=page;
                         }
                            else
                            {
                                page.put("status",true);
                                page.put("page","admin.jsp");
                                obj=page;
                            }
                    }
                    else{
                        page.put("status",false);
                        page.put("page","");
                        obj=page;
                    }
                }
                
            }else if(action.equalsIgnoreCase("forgotpassword")){
                String user_name=request.getParameter("user_name");
                User u=new User();
                u.setUser_name(user_name);
                JSONObject jsonObject= new decodao().forgotPassword(u);
                obj=jsonObject;
                
                
            }else if(action.equalsIgnoreCase("updatepassword")){
                String user_name=request.getParameter("user_name").toString();
                int user_id=Integer.parseInt(request.getParameter("user_id").toString());
                String pwd=request.getParameter("password");
               
                User u=new User();
                
                u.setUser_name(user_name);
                u.setPassword(pwd);
                u.setUser_id(user_id);
                JSONObject jsonObject= new decodao().updatePassword(u);
                obj=jsonObject;               
                
            }
            
            
            
        }catch(Exception e){
            
        }
        out.print(obj);
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
