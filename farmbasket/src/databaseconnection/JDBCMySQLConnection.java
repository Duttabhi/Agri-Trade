package databaseconnection;


//Step 1: Use interfaces from java.sql package
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class JDBCMySQLConnection {
    //static reference to itself
    private static JDBCMySQLConnection instance = new JDBCMySQLConnection();
    public static final String URL = "jdbc:mysql://localhost:8080/farmer_market";
    public static final String USER = "root";
    public static final String PASSWORD = "root";
    public static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";
     
    //private constructor
    public JDBCMySQLConnection() {
        try {
            //Step 2: Load MySQL Java driver
            Class.forName(DRIVER_CLASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
     
    public Connection createConnection() {
 
        Connection connection = null;
        try {
            //Step 3: Establish Java MySQL connection
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            System.out.println("ERROR: Unable to Connect to Database."+ e);
        }
        return connection;
    }  
     
    public static Connection getConnection() {
        return instance.createConnection();
    }
    
    public void closeLocalConnection(Connection con){
		
		try {
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}