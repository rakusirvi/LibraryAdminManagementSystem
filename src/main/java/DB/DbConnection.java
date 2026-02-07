package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost:3306/LibrarySystem","root","Rakesh@1234");
		}catch(Exception e ) {
			System.out.println(e.getMessage());
		}
		return null;
		
	}

}

