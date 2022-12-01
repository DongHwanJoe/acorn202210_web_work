package food.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import food.dto.FoodDto;
import test.util.DbcpBean;

public class FoodDao {
	private static FoodDao dao;
	
	static {
		if(dao == null) {
			dao = new FoodDao();
		}
	}
	
	private FoodDao() {}
	
	public static FoodDao getInstance() {
		return dao;
	}
	
	public boolean insert(FoodDto dto) {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "INSERT INTO recom_food"
					+ "	(num, writer, title, content, viewCount, regdate, divfood, likeCount, dislikeCount)"
					+ "	VALUES(recom_food)seq.NEXTVAL, ?, ?, ?, 0, SYSDATE, ?, 0, 0)";

			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			
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
	
	public int getCount() {
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT MAX(ROWNUM) AS num"
					+ " FROM recom_food";

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
	
	public List<FoodDto> getList(FoodDto dto){
		List<FoodDto> list = new ArrayList<>();
		
		//필요한 객체를 담을 지역변수를 미리 만들어 둔다.
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			//Connection Pool에서 Connection 객체를 하나 얻어온다.
			conn = new DbcpBean().getConn();
			//실행할 sql문의 뼈대 구성하기
			String sql = "SELECT * FROM"
					+ " (SELECT result1.*, ROWNUM AS rnum"
					+ " FROM"
					+ " 	(SELECT num, writer, title, viewCount,"
					+ " likeCount, dislikeCoune, divfood, image, TO_CHAR(regdate, 'YYYY.MM.DD) AS regdate"
					+ "	FROM recom_food"
					+ " ORDER BY likeCount DESC, num DESC) result1)"
					+ " WHERE rnum BETWEEN ? AND ?";

			pstmt = conn.prepareStatement(sql);
			//sql문의 ?에 바인딩 할게 있으면 바인딩하기
			pstmt.setInt(1, dto.getStartRowNum());
			pstmt.setInt(2, dto.getEndRowNum());
			//SELECT문을 수행하고 결과값을 얻어온다.
			rs = pstmt.executeQuery();
			//반복문 or if문 돌면서 ResultSet에서 필요한 값을 얻어낸다.
			while (rs.next()) {
				FoodDto tmp = new FoodDto();
				
				tmp.setNum(rs.getInt("num"));
				tmp.setWriter(rs.getString("writer"));
				tmp.setTitle(rs.getString("title"));
				tmp.setViewCount(rs.getInt("viewCount"));
				tmp.setLikeCount(rs.getInt("likeCount"));
				tmp.setDislikeCount(rs.getInt("dislikeCount"));
				tmp.setDivfood(rs.getString("divfood"));
				tmp.setImage(rs.getString("image"));
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
