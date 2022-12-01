package test.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import test.file.dto.FileDto;
import test.util.DbcpBean;

public class FileDao {
	private static FileDao dao;
	
	private FileDao() {}
	
	public static FileDao getInstance() {
		if(dao == null) {
			dao = new FileDao();
		}
		return dao;
	}
	
	//전체 글의 갯수를 리턴하는 메소드
	public int getCount() {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//글의 개수를 답을 지역변수
		int count = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT MAX(ROWNUM) AS num FROM board_file";

			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기

			//SELECT문을 수행하고 결과값을 얻어온다.
			rs = pstmt.executeQuery();
			//반복문 or if문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				count = rs.getInt("num");
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
		return count;
	}
	
	//파일정보를 삭제하는 메소드
	public void delete(int num) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "DELETE FROM board_file"
					+ " WHERE num = ?";

			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setInt(1, num);
			//INSERT or UPDATE or DELETE 문을 수행하고 수정, 삭제, 추가 된 ROW의 개수 리턴받기
			pstmt.executeUpdate();
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
	}
	
	//파일 하나의 정보를 리턴하는 메소드
	public FileDto getData(int num) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		FileDto dto = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT writer, title, orgFileName, saveFileName, fileSize, regdate"
					+ " FROM board_file"
					+ " WHERE num = ?";

			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setInt(1, num);
			//SELECT문을 수행하고 결과값을 얻어온다.
			rs = pstmt.executeQuery();
			//반복문 or if문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			if (rs.next()) {
				dto = new FileDto();
				
				dto.setNum(num);
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setOrgFileName(rs.getString("orgFileName"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setFileSize(rs.getLong("fileSize"));
				dto.setRegdate(rs.getString("regdate"));
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
	
	//업로드된 파일 정보를 DB에 저장하는 메소드
	public boolean insert(FileDto dto) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "INSERT INTO board_file"
					+ " (num, writer, title, orgFileName, saveFileName, fileSize, regdate)"
					+ " VALUES(board_file_seq.NEXTVAL, ?, ?, ?, ?, ?, SYSDATE)";

			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getOrgFileName());
			pstmt.setString(4, dto.getSaveFileName());
			pstmt.setLong(5, dto.getFileSize());
			//INSERT or UPDATE or DELETE 문을 수행하고 수정, 삭제, 추가 된 ROW의 개수 리턴받기
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
	
	//특정 페이지에 해당하는 파일 목록을 리턴하는 메소드
	public List<FileDto> getList(FileDto dto) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<FileDto> list = new ArrayList<>();
		
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT *"
					+ " FROM"
					+ "	(SELECT result1.*, ROWNUM AS rnum"
					+ "	FROM"
					+ "		(SELECT num, writer, title, orgFileName, fileSize, regdate"
					+ "		FROM board_file"
					+ "		ORDER BY num DESC) result1)"
					+ " WHERE rnum BETWEEN ? AND ?";

			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//SELECT문을 수행하고 결과값을 얻어온다.
			rs = pstmt.executeQuery();
			//반복문 or if문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				FileDto tmp = new FileDto();
				
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setOrgFileName(rs.getString("orgFileName"));
				tmp.setFileSize(rs.getLong("fileSize"));
				tmp.setRegdate(rs.getString("regdate"));
				
				list.add(tmp);
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
		return list;
	}
}
