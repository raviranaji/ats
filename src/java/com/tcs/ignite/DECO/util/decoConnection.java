/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tcs.ignite.DECO.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Roshan Suresh
 */
public class decoConnection {
    Connection conn = null;
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/assignment_tracker";
    static final String USER = "root";
    static final String PASS = "root";
    
    public Connection getConnection() throws ClassNotFoundException, SQLException{
        Class.forName(JDBC_DRIVER);
        conn = DriverManager.getConnection(DB_URL, USER, PASS);
        return conn;
    }
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        decoConnection c = new decoConnection();
        System.out.println(c.getConnection());
    }
}
