<%@page import="com.semi.util.db.DBCPBean"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String phone=request.getParameter("phone");
	String nick=request.getParameter("nick");
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String id=null;
	boolean using=false;
	try{
		con=DBCPBean.getConn();
		String sql="select * from tbl_member where phone=? and nick=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,phone);
		pstmt.setString(2,nick);
		rs=pstmt.executeQuery();
		if(rs.next()){
			id=rs.getString("id");
		}
	}catch(SQLException se){
		se.printStackTrace();
	}finally{
		DBCPBean.close(con,pstmt,rs);
	}
	if(id!=null){
%>
	<h1>회원님의 아이디: <%=id %></h1>
<%		
	}else{
%>		
	<h1>요청하신 정보를 찾지 못했습니다..</h1>
<%	
	}
%>