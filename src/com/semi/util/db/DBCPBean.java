package com.semi.util.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBCPBean {
	private static DataSource ds;
	
	static {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection getConn() throws SQLException{
		return ds.getConnection();
	}
	
	public static void close(Connection con, Statement stmt, ResultSet rs) {
		try {		
			if(rs!=null) {
				rs.close();
			}else if(stmt!=null) {
				stmt.close();
			}else if(con!=null) {
				con.close();
			}
		}catch(SQLException se) {
			se.printStackTrace();
		}
	}
}
