package dao;

import java.sql.*;
import java.util.ArrayList;

import vo.BookBean;

import static db.JdbcUtil.*;



public class BookDAO {
	private Connection con;
	private static BookDAO instance;
	
	private BookDAO() {}

	
	public static BookDAO getInstance() {
		if(instance==null) {
			instance = new BookDAO();
		}
		return instance;
	}

	public void setConnection(Connection con) {
		this.con = con;
	}

	public ArrayList<BookBean> selectBookList() {
		ArrayList<BookBean> list = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from book";
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<BookBean>();
				do {
					BookBean book = new BookBean();
					book.setbID(rs.getString("bID"));
					book.setAuthor(rs.getString("author"));
					book.setGenre(rs.getString("genre"));
					book.setPublisher(rs.getString("publisher"));
					book.setPubDate(Date.valueOf(rs.getString("pubDate")));
					book.setPage(rs.getInt("page"));
					book.setCompany(rs.getString("company"));
					book.setcAddr(rs.getString("cAddr"));
					book.setIBSN(rs.getString("IBSN"));
					book.setPrice(rs.getInt("price"));
					book.setOutline(rs.getString("outline"));
					book.setContents(rs.getString("contents"));
					book.setImgPage(rs.getInt("imgPage"));
					
					list.add(book);
				} while(rs.next());
			}
			
		}catch(Exception e){
			System.out.println("selectBookList 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int insertBook(BookBean book) {
		int insertCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into book values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, book.getbID());
			pstmt.setString(2, book.getAuthor());
			pstmt.setString(3, book.getGenre());
			pstmt.setString(4, book.getPublisher());
			pstmt.setDate(5, book.getPubDate());
			pstmt.setInt(6, book.getPage());
			pstmt.setString(7, book.getCompany());
			pstmt.setString(8, book.getcAddr());
			pstmt.setString(9, book.getIBSN());
			pstmt.setInt(10, book.getPrice());
			pstmt.setString(11, book.getOutline());
			pstmt.setString(12, book.getContents());
			pstmt.setInt(13, book.getImgPage());
			
			insertCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insertBook 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return insertCnt;
	}


	public int updateBook(BookBean book) {
		int updateCnt = 0;
		
		PreparedStatement pstmt = null;
		String sql = "update book set author = ?, genre = ?, publisher = ?,"
				+ " pubDate = ?, page = ?, company = ?, cAddr = ?, IBSN = ?,"
				+ " price = ?, outline = ?, contents = ?, imgPage = ? where bID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(13, book.getbID());
			pstmt.setString(1, book.getAuthor());
			pstmt.setString(2, book.getGenre());
			pstmt.setString(3, book.getPublisher());
			pstmt.setDate(4, book.getPubDate());
			pstmt.setInt(5, book.getPage());
			pstmt.setString(6, book.getCompany());
			pstmt.setString(7, book.getcAddr());
			pstmt.setString(8, book.getIBSN());
			pstmt.setInt(9, book.getPrice());
			pstmt.setString(10, book.getOutline());
			pstmt.setString(11, book.getContents());
			pstmt.setInt(12, book.getImgPage());
			
			updateCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("updateBook 에러 : " + e);
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		return updateCnt;
	}


	public BookBean selectBookInfo(String bID) {
		BookBean book = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from book where bID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bID);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				book = new BookBean();
				book.setbID(rs.getString("bID"));
				book.setAuthor(rs.getString("author"));
				book.setGenre(rs.getString("genre"));
				book.setPublisher(rs.getString("publisher"));
				book.setPubDate(Date.valueOf(rs.getString("pubDate")));
				book.setPage(rs.getInt("page"));
				book.setCompany(rs.getString("company"));
				book.setcAddr(rs.getString("cAddr"));
				book.setIBSN(rs.getString("IBSN"));
				book.setPrice(rs.getInt("price"));
				book.setOutline(rs.getString("outline"));
				book.setContents(rs.getString("contents"));
				book.setImgPage(rs.getInt("imgPage"));
			}
		} catch (Exception e) {
			System.out.println("selectBookInfo 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return book;
	}


	public int deleteBookInfo(String bID) {
		int delCnt = 0;
		
		PreparedStatement pstmt = null;
		String sql = "delete from book where bID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bID);
			delCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return delCnt;
	}


	public ArrayList<BookBean> selectmyLibrary(String uID) {
		ArrayList<BookBean> list = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(uID);
		String sql = "select b.bID, author, genre, publisher, pubDate, page, company, cAddr, IBSN, price, outline, contents, imgPage from lib l join book b on l.bID = b.bID where uID = ? order by l.lastDate desc";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<BookBean>();
				do {
					BookBean book = new BookBean();
					book.setbID(rs.getString("bID"));
					book.setAuthor(rs.getString("author"));
					book.setGenre(rs.getString("genre"));
					book.setPublisher(rs.getString("publisher"));
					book.setPubDate(Date.valueOf(rs.getString("pubDate")));
					book.setPage(rs.getInt("page"));
					book.setCompany(rs.getString("company"));
					book.setcAddr(rs.getString("cAddr"));
					book.setIBSN(rs.getString("IBSN"));
					book.setPrice(rs.getInt("price"));
					book.setOutline(rs.getString("outline"));
					book.setContents(rs.getString("contents"));
					book.setImgPage(rs.getInt("imgPage"));
					
					list.add(book);
				} while(rs.next());
			}
			
		}catch(Exception e){
			System.out.println("selectMyLibrary 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}


	public double selectReviewScore(String bID) {
		double score = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select avg(score) from review where bID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				score = rs.getDouble(1);
			}
		} catch (Exception e) {
			System.out.println("selectReviewScore 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return score;
	}


	public int selectReviewCount(String bID) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from review where bID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bID);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println("selectReviewCount 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}


	public ArrayList<BookBean> selectSearchBookList(String query) {
		ArrayList<BookBean> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from book where bID like ? or author like ? or genre like ? or company like ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + query + "%");
			pstmt.setString(2, "%" + query + "%");
			pstmt.setString(3, "%" + query + "%");
			pstmt.setString(4, "%" + query + "%");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				list = new ArrayList<BookBean>();
				
				do {
					BookBean book = new BookBean();
					book.setbID(rs.getString("bID"));
					book.setAuthor(rs.getString("author"));
					book.setGenre(rs.getString("genre"));
					book.setPublisher(rs.getString("publisher"));
					book.setPubDate(Date.valueOf(rs.getString("pubDate")));
					book.setPage(rs.getInt("page"));
					book.setCompany(rs.getString("company"));
					book.setcAddr(rs.getString("cAddr"));
					book.setIBSN(rs.getString("IBSN"));
					book.setPrice(rs.getInt("price"));
					book.setOutline(rs.getString("outline"));
					book.setContents(rs.getString("contents"));
					book.setImgPage(rs.getInt("imgPage"));
					
					list.add(book);
				} while(rs.next());
			}
		} catch (Exception e) {
			System.out.println("selectSearchBookList 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}


	public String selectBookContents(String bID) {
		String contents = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select contents from book where bID = ?";
		System.out.println(sql);
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				contents = rs.getString("contents");
			}
		} catch (Exception e) {
			System.out.println("selectBookContents 에러 : " + e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return contents;
	}


	public int selectKnownBook(String uID, String bID) {
		int selCnt = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from lib where uID = ? and bID = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uID);
			pstmt.setString(2, bID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				selCnt++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(rs);
			close(pstmt);
		}
		
		return selCnt;
	}


	public int updateLib(String uID, String bID) {
		int updCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "update lib set lastDate = curdate() where uID = ? and bID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uID);
			pstmt.setString(2, bID);
			updCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return updCnt;
	}


	public int insertLib(String uID, String bID) {
		int insCnt = 0;
		PreparedStatement pstmt = null;
		String sql = "insert into lib values(?, ?, curdate())";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uID);
			pstmt.setString(2, bID);
			insCnt = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			close(pstmt);
		}
		
		return insCnt;
	}

}
