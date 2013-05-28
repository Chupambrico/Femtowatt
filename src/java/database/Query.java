package database;

import java.sql.*;

/**
 *
 * @author i5a11
 */
public class Query {
    Connection connessione;
    
    public Query(Connection conn) throws Exception {
        this.connessione = conn;
    }
    
    public ResultSet esecuzioneQuery(String query) throws Exception {
        ResultSet rs = this.esecuzioneQuery(query, false);
        return rs;
    }
    
    public ResultSet esecuzioneQuery(String query, Boolean fetch) throws Exception {
        Statement stat;
        stat = this.connessione.createStatement();
        ResultSet rs = stat.executeQuery(query);
        if(fetch == true){
            rs.next();
        }
        return rs;
    }
    
    public void esecuzioneUpdate(String query) throws Exception {
        Statement stat;
        stat = this.connessione.createStatement();
        stat.executeUpdate(query);
       
    }
}
