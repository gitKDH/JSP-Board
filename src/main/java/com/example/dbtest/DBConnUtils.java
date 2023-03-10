package com.example.dbtest;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnUtils {
    public static Connection getConnection(){
        try{
            String dbURL = "jdbc:mysql://localhost:3306/game";
            String dbID = "root";
            String dbPW = "12345";
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(dbURL,dbID,dbPW);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}