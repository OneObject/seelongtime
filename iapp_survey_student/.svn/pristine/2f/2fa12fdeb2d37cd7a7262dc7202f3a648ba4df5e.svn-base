/**
 * 
 */
package org.adl.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



/**
 * @author congwang
 * 
 */
public class DbUtil {
	private static Connection conn;

	public static Connection getConnection() {
		
			try {
				
//					Class.forName(getDriverClassName()).newInstance();
//
//					conn = DriverManager.getConnection(getDbURL(), getDbUsername(),getDbPassword());
					if(conn==null ||(conn.isClosed()) ){
						Class.forName("org.logicalcobwebs.proxool.ProxoolDriver");
						conn = DriverManager.getConnection("proxool.LMS"); 
					}
					
							

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
			
			return conn;
		
	}

	public static String getDriverClassName() {
		String returnString = "";
		try {
			returnString = ConfigFile.getString("driverClassName");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnString;
	}

	public static String getDbURL() {
		String returnString = "";
		try {
			returnString = ConfigFile.getString("url");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnString;
	}

	public static String getDbUsername() {
		String returnString = "";
		try {
			returnString = ConfigFile.getString("username");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnString;
	}

	public static String getDbPassword() {
		String returnString = "";
		try {
			returnString = ConfigFile.getString("password");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnString;
	}
}
