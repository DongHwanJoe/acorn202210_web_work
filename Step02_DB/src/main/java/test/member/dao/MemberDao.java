package test.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.member.dto.MemberDto;
import test.util.DbcpBean;

public class MemberDao {
	//자신의 참조값을 저장할 static 필드(하나만 만들어 사용할 예정이기 떄문에)
	private static MemberDao dao;	
	
	//외부에서 객체 생성하지 못하도록 생성자의 접근지정자를 private으로 한다.
	private MemberDao() {}
	
	//자신의 참조값을 리턴하는 static 메소드를 제공한다.
	//MemberDao dao = MemberDao.getInstance(); 식으로 참조값 얻기
	public static MemberDao getInstance() {
		//만일 최초 호출이라면 자신의 객체를 생성해서 static 필드에 담아둔다.
		if(dao == null) {
			dao = new MemberDao();
		}
		//최초 호출이 아니라면 필드에 있는 자신의 참조값을 리턴해준다.
		return dao;
	}
	
	//전체 회원의 목록을 리턴하는 메소드
	public List<MemberDto> getList(){
		//회원 목록을 담을 객체 생성
		List<MemberDto> list = new ArrayList<>();
		
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT num, name, addr"
					+ " FROM member"
					+ " ORDER BY num ASC";
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기

			pstmt = conn.prepareStatement(sql);
			//SELECT문을 수행하고 결과값을 얻어온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				//커서가 위치한 곳에서 회원 한 명의 정보를 얻어내서 MemberDto 객체에 담은 후
				MemberDto dto = new MemberDto();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				//ArrayList 객체에 누적 시킨다.
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기
			} catch (Exception e) {}
		}
		return list;
	}
	
	public boolean insert(MemberDto dto) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "INSERT INTO member"
					+ " (num, name, addr)"
					+ " VALUES(member_seq.NEXTVAL, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			
			//SELECT문을 수행하고 결과값을 얻어온다.
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)pstmt.close();
				if (conn != null)conn.close(); //Connection Pool에 Connection 반납하기
			} catch (Exception e) {}
		}
		return rowCount > 0 ? true : false;
	}
	
	public boolean delete(int num) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "DELETE FROM member"
					+ " WHERE num = ?";

			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setInt(1, num);
			//SELECT문을 수행하고 결과값을 얻어온다.
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기
			} catch (Exception e) {
			}
		}
		return rowCount > 0 ? true : false;
	}
	
	public boolean update(MemberDto dto) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "UPDATE member SET"
					+ " name = ?, addr = ?"
					+ " WHERE num = ?";

			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setInt(3, dto.getNum());
			
			//SELECT문을 수행하고 결과값을 얻어온다.
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기
			} catch (Exception e) {
			}
		}
		return rowCount > 0 ? true : false;
	}
	
	public MemberDto getData(int num) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberDto dto = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT name, addr"
					+ " FROM member"
					+ " WHERE num = ?";

			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setInt(1, num);
			//SELECT문을 수행하고 결과값을 얻어온다.
			rs = pstmt.executeQuery();
			//반복문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			if(rs.next()) {
				dto = new MemberDto();
				dto.setNum(num);
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close(); //Connection Pool에 Connection 반납하기
			} catch (Exception e) {
			}
		}
		
		return dto;
	}
}
