package DBPackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.TimeZone;

public class DatabaseConnector {
	
	private static String usernameDB = "test";
	private static String passwordDB = "kekko";
	private String nameDB = "dbgiabby";
	private String pathDB = "jdbc:mysql://localhost:3306/"+ nameDB +"?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=" + TimeZone.getDefault().getID();
	private Connection jdbcConnection = null;
	
	public boolean startConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		} catch (ClassNotFoundException | InstantiationException | IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("ERR: Error with forName");
			return false;
		}
		try {
			this.jdbcConnection = DriverManager.getConnection(this.pathDB, usernameDB, passwordDB);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("ERR: Problem with getConnection method");
			return false;
		}
		return true;
	}
	
	public boolean closeConnection() {
		if (this.jdbcConnection != null) {
			try {
				this.jdbcConnection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.err.println("ERR: Cannot close connection");
				return false;
			}
		}
		return true;
	}

	public Connection getJdbcConnection() {
		return jdbcConnection;
	}

	public void setJdbcConnection(Connection jdbcConnection) {
		this.jdbcConnection = jdbcConnection;
	}

}
