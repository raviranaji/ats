/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.DECO.dao;

import com.tcs.ignite.DECO.bean.Assignment;
import com.tcs.ignite.DECO.bean.Subject;
import com.tcs.ignite.DECO.bean.Submission;
import com.tcs.ignite.DECO.bean.User;
import com.tcs.ignite.DECO.util.decoConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Roshan Suresh
 */
public class decodao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public decodao() {
        try {
            this.conn = new decoConnection().getConnection();
        } catch (Exception e) {
            System.out.println("error" + e);
        }
    }

    public JSONObject login(User u) {
        JSONObject obj = new JSONObject();
        try {
            String sql = "select * from tb_user where username = ? and password = ?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUser_name());
            ps.setString(2, u.getPassword());
            rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println(rs.getString("username"));
                System.out.println(rs.getString("userid"));
                System.out.println(rs.getString("roleid"));
                System.out.println(rs.getString("status"));

                String username = rs.getString("username");

                int user_id = Integer.parseInt(rs.getString("userid").toString());
                int role_id = Integer.parseInt(rs.getString("roleid").toString());
                int status = Integer.parseInt(rs.getString("status").toString());
                obj.put("user_name", username);
                obj.put("userid", user_id);
                obj.put("roleid", role_id);
                obj.put("status", status);
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return obj;
    }

    public JSONObject register(User u) throws SQLException, JSONException {
         JSONObject jSONObject = new JSONObject();
        String check="select * from tb_user where username=?;";
        ps=conn.prepareStatement(check);
        ps.setString(1, u.getUser_name());
        rs=ps.executeQuery();
        
        if(rs.next()){
           
        
            jSONObject.put("reg_status", "You are already registered");
            System.out.println("you are already registered");
             
        }else{
           String sql = "insert into tb_user(username,password,roleid,status) values(?,?,?,?);";
            ps = conn.prepareStatement(sql);
            
            ps.setString(1, u.getUser_name());
            ps.setString(2, u.getPassword());
            ps.setInt(3, 3);
            ps.setInt(4, 1);

            int added = ps.executeUpdate();
            if(added > 0){
                JSONObject obj=login(u);
               jSONObject=obj;
                
                
            } 
        }
        
        
        return jSONObject;
    }

    public JSONArray getSubject() {
        JSONArray arr = new JSONArray();
        try {

            String sql = "select * from subject where status = '1';";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                JSONObject obj1 = new JSONObject();
                obj1.put("subject_id", rs.getString("subject_id"));
                obj1.put("subject_name", rs.getString("subject_name"));
                arr.put(obj1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return arr;
    }

    public boolean addAssignment(Assignment assignment) {
        boolean added = false;
        try {
            String sql = "insert into assignment (userid,subject_id,assignment_description,start_date,end_date,status,file_path,assignment_name)values (?,?,?,?,?,?,?,?);";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, assignment.getUser_id());
            ps.setInt(2, assignment.getSubject_id());
            ps.setString(3, assignment.getAssignment_description());
            ps.setString(4, assignment.getStart_date());
            ps.setString(5, assignment.getEnd_date());
            ps.setString(6, assignment.getStatus());
            ps.setString(7, assignment.getFile_path());
            ps.setString(8, assignment.getAssignment_name());
            int i = ps.executeUpdate();
            added = i > 0 ? true : false;
        } catch (Exception e) {
            System.out.println(e);
        }
        return added;
    }

    public JSONArray getAssignments() {
        JSONArray arr = new JSONArray();
        try {
            String sql = "select * from assignment;";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                JSONObject obj1 = new JSONObject();
                obj1.put("assignment_id", rs.getString("assignment_id"));
                obj1.put("subject_id", rs.getString("subject_id"));
                obj1.put("assignment_desc", rs.getString("assignment_description"));
                obj1.put("s_date", rs.getString("start_date"));
                obj1.put("e_date", rs.getString("end_date"));
                obj1.put("assignment_name", rs.getString("assignment_name"));
                obj1.put("file_path", rs.getString("file_path"));
                obj1.put("user_id", rs.getString("userid"));
                
                arr.put(obj1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return arr;
    }

    public JSONObject forgotPassword(User u) {
       JSONObject obj=new JSONObject();
             
        try {
                   
            String sql = "select * from tb_user where username=?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUser_name());
            rs = ps.executeQuery();
            if(rs.next()) {
                obj.put("userid", rs.getInt("userid"));                
            }else{
                obj.put("userid", -1);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
         return obj;
    }

    public JSONObject updatePassword(User u) {
       JSONObject obj=new JSONObject();
             
        try {
                   
            String sql = "UPDATE tb_user SET password=? WHERE userid=? and username=?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getPassword());
            ps.setInt(2, u.getUser_id());
            ps.setString(3, u.getUser_name());
            
            int updated = ps.executeUpdate();
            if(updated>0) {
                obj.put("status", "updated");                
            }else{
                obj.put("status", -1);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
         return obj;
    }
    public JSONObject updateUser(User u) {
       JSONObject obj=new JSONObject();
             
        try {
                   
            String sql = "UPDATE tb_user SET username=?,roleid=?,status=?  WHERE userid=?;";
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUser_name());
            ps.setInt(2, u.getRole_id());
            ps.setInt(3, u.getStatus());
            ps.setInt(4, u.getUser_id());
            int updated = ps.executeUpdate();
            if(updated>0) {
                obj.put("status", "updated");                
            }else{
                obj.put("status", -1);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
         return obj;
    }
    public JSONObject addNewUser(User u) {
       JSONObject obj=new JSONObject();
             
        try {
                   
            String sql = "insert into tb_user(username,password,roleid,status) values(?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, u.getUser_name());
            ps.setString(2, u.getPassword());
            ps.setInt(3, u.getRole_id());
            ps.setInt(4, u.getStatus());
            
            int updated = ps.executeUpdate();
            if(updated>0) {
                obj.put("status", "inserted");                
            }else{
                obj.put("status", -1);
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
         return obj;
    }
    public JSONArray getUsers() {
        JSONArray users = new JSONArray();
                try {
                    String sql = "select * from tb_user where roleid !='1' and status = '1';";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        JSONObject obj1 = new JSONObject();
                        obj1.put("userid", Integer.parseInt(rs.getString("userid").toString()));
                        obj1.put("username", rs.getString("username").toString());
                        obj1.put("password", rs.getString("password").toString());
                        obj1.put("roleid",Integer.parseInt(rs.getString("roleid").toString()));
//                        obj1.put("roledescription", rs.getString("description").toString());
                        obj1.put("status", Integer.parseInt(rs.getString("status").toString()));
                       
                        users.put(obj1);
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                return users;

    }

    public JSONArray getAdmins() {
             JSONArray users = new JSONArray();
                try {
                    String sql = "select * from tb_user where roleid='1' and status = '1' ;";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        JSONObject obj1 = new JSONObject();
                        obj1.put("userid", Integer.parseInt(rs.getString("userid").toString()));
                        obj1.put("username", rs.getString("username").toString());
                        obj1.put("password", rs.getString("password").toString());
                        obj1.put("roleid",Integer.parseInt(rs.getString("roleid").toString()));
//                        obj1.put("roledescription", rs.getString("description").toString());
                        obj1.put("status", Integer.parseInt(rs.getString("status").toString()));
                       
                        users.put(obj1);
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                return users;
    }
    
    
      public JSONArray getAllUsers() {
             JSONArray users = new JSONArray();
                try {
                    String sql = "select * from tb_user;";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        JSONObject obj1 = new JSONObject();
                        obj1.put("userid", Integer.parseInt(rs.getString("userid").toString()));
                        obj1.put("username", rs.getString("username").toString());
                        obj1.put("password", rs.getString("password").toString());
                        obj1.put("roleid",Integer.parseInt(rs.getString("roleid").toString()));
//                        obj1.put("roledescription", rs.getString("description").toString());
                        obj1.put("status", Integer.parseInt(rs.getString("status").toString()));
                       
                        users.put(obj1);
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                return users;
    }

    public JSONArray getTrashs() {
            JSONArray users = new JSONArray();
                try {
                    String sql = "select * from tb_user where status='0' ;";
                    ps = conn.prepareStatement(sql);
                    rs = ps.executeQuery();
                    while (rs.next()) {
                        JSONObject obj1 = new JSONObject();
                        obj1.put("userid", Integer.parseInt(rs.getString("userid").toString()));
                        obj1.put("username", rs.getString("username").toString());
                        obj1.put("password", rs.getString("password").toString());
                        obj1.put("roleid",Integer.parseInt(rs.getString("roleid").toString()));
//                        obj1.put("roledescription", rs.getString("description").toString());
                        obj1.put("status", Integer.parseInt(rs.getString("status").toString()));
                       
                        users.put(obj1);
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }
                return users;

    }

    public JSONArray trash(User u,String action) {
       int userid=u.getUser_id();
       JSONArray users = new JSONArray();
        String sql="update tb_user set status = '0' where userid=?";
        try {
            ps=conn.prepareStatement(sql);
            ps.setInt(1,userid);
            
            int trashed = ps.executeUpdate();
            
            if(trashed > 0){
                if(action.equalsIgnoreCase("trashUsers")){
                    users=getUsers();
                }else if(action.equalsIgnoreCase("trashAdmin")){
                    users=getAdmins();
                }
                 
               
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(decodao.class.getName()).log(Level.SEVERE, null, ex);
        }       
        
        
        return  users;
 
    }

    public JSONArray addUser(User u) {
       int userid=u.getUser_id();
       JSONArray users = new JSONArray();
        String sql="update tb_user set status = '1' where userid=?";
        try {
            ps=conn.prepareStatement(sql);
            ps.setInt(1,userid);
            
            int added = ps.executeUpdate();
            if(added > 0){
                 users=getTrashs();
               
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(decodao.class.getName()).log(Level.SEVERE, null, ex);
        }       
        
        
        return  users;
    }

//    public JSONArray trashAdmin(User u) {
//        int userid=u.getUser_id();
//             JSONArray users = new JSONArray();
//              String sql="update tb_user set status = '0' where userid=?";
//              try {
//                  ps=conn.prepareStatement(sql);
//                  ps.setInt(1,userid);
//
//                  int trashed = ps.executeUpdate();
//                  if(trashed > 0){
//                       users=getUsers();
//
//                  }
//
//              } catch (SQLException ex) {
//                  Logger.getLogger(decodao.class.getName()).log(Level.SEVERE, null, ex);
//              }       
//
//
//        return  users;
//     }

    public boolean addSubmission(Submission submission) {
       boolean added = false;
        try {
            String sql = "insert into submission (assignment_id,userid,submission_date,file_path)values (?,?,?,?);";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, submission.getAssignment_id());
            ps.setInt(2, submission.getUser_id());
            ps.setString(3,submission.getSubmission_date());
            ps.setString(4, submission.getFile_path());
            int i = ps.executeUpdate();
            added = i > 0 ? true : false;
        } catch (Exception e) {
            System.out.println(e);
        }
        return added;
    }


}

   