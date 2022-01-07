
package com.helper;

import java.sql.Connection;
import java.sql.DriverManager;


public class SnsDataBaseConnection {
public static Connection openConnection() throws Exception
     {
     Class.forName("com.mysql.jdbc.Driver");
        String str="jdbc:mysql://localhost:3306/sns";
        Connection con=DriverManager.getConnection(str,"root","rajesh");
        return con;
     }    
}
