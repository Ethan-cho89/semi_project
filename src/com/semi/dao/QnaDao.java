package com.semi.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.semi.domain.QnaVo;
import com.semi.util.db.DBCPBean;

public class QnaDao {
	private static QnaDao instance = new QnaDao();
	
	private QnaDao() {}
	
	public static QnaDao getDao() {
		return instance;
	}
	
	public ArrayList<QnaVo> list(String field, String keyword, int startRow, int endRow){
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql="";
			if(keyword!=null && !keyword.equals("")) {
				sql="select * from (" + 
						"    select rownum rnum, aa.* from (" + 
						"        select * from tbl_qna where "+field+" like '%"+keyword+"%' order by num desc" + 
						"    ) aa " + 
						") where rnum>=? and rnum<=?";
			}else {
				sql = "select * from ("+
					    "select rownum rnum, aa.* from ("+
					            "select * from tbl_qna order by num desc"+
					            ") aa"+
					    ") where rnum>=? and rnum<=?";
			}
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs=pstmt.executeQuery();
			ArrayList<QnaVo> list = new ArrayList<QnaVo>();
			while(rs.next()) {
				int n = rs.getInt("num");
				String w = rs.getString("writer");
				String tem =w.substring(2);
				String rep ="";			
				for(int i=0; i<tem.length(); i++) {
					rep+="*";
				}
				String nick = w.replace(tem, rep);
				String p = rs.getString("pwd");
				String t = rs.getString("type");
				String c = rs.getString("contents");
				Date r = rs.getDate("regdate");
				String a = rs.getString("answer");
				String tt = rs.getString("title");
				QnaVo vo = new QnaVo(n, w, p, t, c, r, a, tt, nick);
				list.add(vo);
			}
			return list;
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally{
			DBCPBean.close(con, pstmt, rs);
		}
	}
	
	public int getCount(String field, String keyword) {
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql = "";
			if(keyword!=null && !keyword.equals("")) {
				sql="select nvl(count(num),0) from tbl_qna where "
						+field+" like '%"+keyword+"%'";
			}else {
				sql = "select nvl(count(num),0) from tbl_qna";
			}
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}else {
				return 0;
			}
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally{
			DBCPBean.close(con, pstmt, rs);
		}
	}
	
	
	
	public int insert(QnaVo vo) {
		Connection con= null;
		PreparedStatement pstmt=null;
		String writer = vo.getWriter();
		String pwd = vo.getPwd();
		String type = vo.getType();
		String contents = vo.getContents();
		String answer = vo.getAnswer();
		String title = vo.getTitle();
		
		try {
			con=DBCPBean.getConn();
			String sql ="insert into tbl_qna values(seq_qna.nextval,?,?,?,?,sysdate,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, pwd);
			pstmt.setString(3, type);
			pstmt.setString(4, contents);
			pstmt.setString(5, answer);
			pstmt.setString(6, title);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally{
			DBCPBean.close(con, pstmt, null);
		}
	}
	
	 //�۹�ȣ,�ۼ���,������� ���ٱ��� üũ�ϸ鼭 ��ȸ���� �ѹ��� 
	public QnaVo check(int num, String writer, String pwd) {
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql = "select * from tbl_qna where writer=? and pwd=? and num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, pwd);
			pstmt.setInt(3, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int n = rs.getInt("num");
				String w = rs.getString("writer");
				String p = rs.getString("pwd");
				String t = rs.getString("type");
				String c = rs.getString("contents");
				Date r = rs.getDate("regdate");
				String a = rs.getString("answer");
				String tt = rs.getString("title");
				QnaVo vo = new QnaVo(n, w, p, t, c, r, a, tt, null);
				return vo;
			}else {
				return null;
			}
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally{
			DBCPBean.close(con, pstmt, rs);
		}
	}
	
	//������ư ������ ������������ �Ѿ�� �ҷ����� �޼ҵ�
	public QnaVo load(int num) {
		Connection con= null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		try {
			con=DBCPBean.getConn();
			String sql = "select * from tbl_qna where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			ArrayList<QnaVo> list = new ArrayList<QnaVo>();
			QnaVo vo = null;
			if(rs.next()) {
				int n = rs.getInt("num");
				String w = rs.getString("writer");
				String p = rs.getString("pwd");
				String t = rs.getString("type");
				String c = rs.getString("contents");
				Date r = rs.getDate("regdate");
				String a = rs.getString("answer");
				String tt = rs.getString("title");
				vo = new QnaVo(n, w, p, t, c, r, a, tt, null);
				return vo;
			}else {
				return null;
			}
		}catch(SQLException s) {
			s.printStackTrace();
			return null;
		}finally{
			DBCPBean.close(con, pstmt, rs);
		}
	}
	
	public int edit(QnaVo vo) {
		Connection con= null;
		PreparedStatement pstmt=null;
		int num = vo.getNum();
		String type = vo.getType();
		String contents = vo.getContents();
		String answer = vo.getAnswer();
		try {
			con=DBCPBean.getConn();
			String sql ="update tbl_qna set type=?,contents=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, type);
			pstmt.setString(2, contents);
			pstmt.setInt(3, num);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally{
			DBCPBean.close(con, pstmt, null);
		}
	}
	
	public int edit(int num, String answer) {
		Connection con= null;
		PreparedStatement pstmt=null;
		try {
			con=DBCPBean.getConn();
			String sql ="update tbl_qna set answer=? where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, answer);
			pstmt.setInt(2, num);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally{
			DBCPBean.close(con, pstmt, null);
		}
	}
	
	
	
	public int delete(int n) { //���� ��ȣ, ��� �޾� ����
		Connection con= null;
		PreparedStatement pstmt=null;
		try {
			con=DBCPBean.getConn();
			String sql ="delete tbl_qna where num=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, n);
			return pstmt.executeUpdate();
		}catch(SQLException s) {
			s.printStackTrace();
			return -1;
		}finally{
			DBCPBean.close(con, pstmt, null);
		}
	}
	
	
	
	
	
}
