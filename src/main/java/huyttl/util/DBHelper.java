/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author DELL
 */
public class DBHelper {
        public static Connection makeConnection() throws ClassNotFoundException, SQLException{
        
        //1.Load Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        
        //2.Create connection String
        String url = "jdbc:sqlserver://"
                    + "milktea.cstmsw0qhetj.ap-southeast-2.rds.amazonaws.com:1433;"
                    + "databaseName = MilkTeaDB2";    
        //3. Open connection
        Connection con = DriverManager.getConnection(url, "admin", "qazpl,123456789");  
        return con;
        
    }
        
}
