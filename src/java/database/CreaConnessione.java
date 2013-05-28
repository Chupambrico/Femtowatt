package database;

import java.sql.*;

/**
 *
 * @author i5a11
 */
public class CreaConnessione {
    String      dbLocation;
    String      username;
    String      pass;
    
    public CreaConnessione(String path, String user, String pass) throws Exception {
        this.dbLocation = path;
        this.username = user;
        this.pass = pass;
    }
    
    public Connection connetti() throws Exception {
        Class.forName("org.firebirdsql.jdbc.FBDriver");
        return DriverManager.getConnection(this.dbLocation, this.username, this.pass);
    }
}
