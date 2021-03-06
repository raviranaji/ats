/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.DECO.servlet;

import com.tcs.ignite.DECO.bean.Assignment;
import com.tcs.ignite.DECO.dao.decodao;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Roshan Suresh
 */
public class FileUploadServlet extends HttpServlet {

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
            out.println("<title>Servlet FileUploadServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet FileUploadServlet at " + request.getContextPath() + "</h1>");
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
        String filePath = "";
        try{
            String path = "/home/ravi";
            
            List<FileItem> fileItemList = new ArrayList<FileItem>();
            ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
            List formFieldItems;
            formFieldItems = upload.parseRequest(request);
            ListIterator itr = formFieldItems.listIterator();
            while (itr.hasNext()) {
                fileItemList.add((FileItem) itr.next());
            }
            int subject_id = Integer.parseInt(fileItemList.get(0).getString().toString());
            String assignment_name = fileItemList.get(1).getString();
            String assignment_desc = fileItemList.get(2).getString();
            String start_date = fileItemList.get(3).getString();
            String end_date = fileItemList.get(4).getString();
                if(!fileItemList.get(5).isFormField()){
                    if(fileItemList.get(5).getName()!=null){
                        try{
                            String fileName = fileItemList.get(5).getName().toString();
                            System.out.println(fileName);
                            String folderName = "Assignment_attachments";
                            File fp = new File(path +File.separator+ folderName);
                        if (!fp.exists()) {
                            fp.mkdirs();
                        }
                        File fp1 = new File(path+File.separator+folderName+File.separator+assignment_name);
                        if(!fp1.exists()){
                            fp1.mkdirs();
                        }
                        String fileStoringPath = path+File.separator+folderName+File.separator+assignment_name+File.separator+fileName;
                        System.out.println(fileStoringPath);
                        filePath = fileStoringPath;
                        File file = new File(fileStoringPath);
                        fileItemList.get(5).write(file);
                        System.out.println("file stored");
                        }catch(Exception e){
                            System.out.println(e);
                        }
                    }
                    HttpSession session = request.getSession();
                    int user_id = Integer.parseInt(session.getAttribute("userid").toString());
                    Assignment assignment = new Assignment();
                    assignment.setFile_path(filePath);
                    assignment.setStatus("1");
                    assignment.setStart_date(start_date);
                    assignment.setEnd_date(end_date);
                    assignment.setAssignment_name(assignment_name);
                    assignment.setUser_id(user_id);
                    assignment.setAssignment_description(assignment_desc);
                    assignment.setSubject_id(subject_id);
                    boolean added = new decodao().addAssignment(assignment);
                    out.print(added);
                }
            
            
        }catch(Exception e){
            
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
