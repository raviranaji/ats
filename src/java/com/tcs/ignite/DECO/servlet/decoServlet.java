
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.DECO.servlet;

import com.tcs.ignite.DECO.bean.Subject;
import com.tcs.ignite.DECO.bean.User;
import com.tcs.ignite.DECO.dao.decodao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Roshan Suresh
 */
public class decoServlet extends HttpServlet {

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
            out.println("<title>Servlet decoServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet decoServlet at " + request.getContextPath() + "</h1>");
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
        String action = request.getParameter("act");
        JSONObject page = new JSONObject();
        if(action.equalsIgnoreCase("login"))
        {
            User u = new User();
            u.setUser_name(request.getParameter("email"));
            u.setPassword(request.getParameter("pass"));
            JSONObject obj = new decodao().login(u);
            HttpSession session = request.getSession();
            try{
            
            session.setAttribute("username",obj.getString("user_name"));
            session.setAttribute("userid",obj.get("userid"));
            
            if(Integer.parseInt(obj.get("status").toString())==1){
                if(Integer.parseInt(obj.get("roleid").toString())!=1){

                   page.put("status",true);
//                   page.put("page","User/index.jsp");
                    page.put("page","userpage.jsp");
                 }
                    else
                    {
                        page.put("status",true);
//                        page.put("page","Admin/index.jsp");
                        page.put("page","admin.jsp");
                    }
            }
            else{
                page.put("status",false);
                page.put("page","");
            }
            
            }catch(Exception e){
                
            }
            out.print(page);
        }
        else if(action.equalsIgnoreCase("getSubject")){
            JSONObject obj = new JSONObject();
            try{
                JSONArray subject = new decodao().getSubject();
                obj.put("subject_details",subject);
            }catch(Exception e){
                
            }
            out.print(obj);
        }else if(action.equalsIgnoreCase("getUsers")){
            JSONObject obj = new JSONObject();
            try{
                JSONArray users = new decodao().getUsers();
                obj.put("user_list",users);
            }catch(Exception e){
                
            }
            out.print(obj);
        }else if(action.equalsIgnoreCase("getAdmins")){
            JSONObject obj = new JSONObject();
            try{
                JSONArray admins = new decodao().getAdmins();
                obj.put("admin_list",admins);
            }catch(Exception e){
                
            }
            out.print(obj);
        }else if(action.equalsIgnoreCase("getAllUsers")){
            JSONObject obj = new JSONObject();
            try{
                JSONArray admins = new decodao().getAllUsers();
                obj.put("admin_list",admins);
            }catch(Exception e){
                
            }
            out.print(obj);
        }
        else if(action.equalsIgnoreCase("getTrashs")){
            JSONObject obj = new JSONObject();
            try{
                JSONArray trash = new decodao().getTrashs();
                obj.put("trash_list",trash);
            }catch(Exception e){
                
            }
            out.print(obj);
        }else if(action.equalsIgnoreCase("trash")){
            int userid=Integer.parseInt(request.getParameter("userid").toString());
            User u = new User();
            u.setUser_id(userid);
            JSONObject obj = new JSONObject();
            
            try {
                JSONArray arr = new decodao().trash(u,request.getParameter("type"));
                obj.put("user_list", arr);
            } catch (JSONException ex) {
                Logger.getLogger(decoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            out.print(obj);
        }
//        else if(action.equalsIgnoreCase("trashAdmin")){
//            int userid=Integer.parseInt(request.getParameter("userid").toString());
//            User u = new User();
//            u.setUser_id(userid);
//            JSONObject obj = new JSONObject();
//            
//            try {
//                JSONArray arr = new decodao().trash(u,action);
//                obj.put("user_list", arr);
//            } catch (JSONException ex) {
//                Logger.getLogger(decoServlet.class.getName()).log(Level.SEVERE, null, ex);
//            }
//            out.print(obj);
//        }
        else if(action.equalsIgnoreCase("addUser")){
            int userid=Integer.parseInt(request.getParameter("userid").toString());
            User u = new User();
            u.setUser_id(userid);
            JSONObject obj = new JSONObject();
            
            try {
                JSONArray arr = new decodao().addUser(u);
                obj.put("remaining_users", arr);
            } catch (JSONException ex) {
                Logger.getLogger(decoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            out.print(obj);
        }else if(action.equalsIgnoreCase("updateuser")){
            int userid=Integer.parseInt(request.getParameter("userid").toString());
            
            User u = new User();
            u.setUser_id(userid);
            u.setUser_name(request.getParameter("username").toString());
            u.setRole_id(Integer.parseInt(request.getParameter("roleid").toString()));
            u.setStatus(Integer.parseInt(request.getParameter("status").toString()));
        
            JSONObject obj = new JSONObject();
            
            try {
                JSONObject updatestatus = new decodao().updateUser(u);
                obj.put("status", updatestatus);
            } catch (JSONException ex) {
                Logger.getLogger(decoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            out.print(obj);
        }else if(action.equalsIgnoreCase("addNewUser")){
            
            User u = new User();
            u.setPassword(request.getParameter("userpassword").toString());
            u.setUser_name(request.getParameter("username").toString());
            u.setRole_id(Integer.parseInt(request.getParameter("roleid").toString()));
            u.setStatus(Integer.parseInt(request.getParameter("status").toString()));
        
            JSONObject obj = new JSONObject();
            
            try {
                JSONObject updatestatus = new decodao().addNewUser(u);
                obj.put("status", updatestatus);
            } catch (JSONException ex) {
                Logger.getLogger(decoServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            out.print(obj);
        }
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
