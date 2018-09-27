package Com.basar;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDao {

	public static Connection getConnection() throws SQLException {
		Connection conn = null ;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String userName = "sa";
			String password = "sa@123";
			String connectionUrl = "jdbc:sqlserver://197.51.205.198:1433;databaseName=st;user=sa;password=sa@123";

			conn = DriverManager.getConnection(connectionUrl, userName, password);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		;
		return conn;
	};
	
	public static int save(Student s) {
		int status = 0 ;
		 try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(
			"INSERT INTO students(name,password,email,gender,country) VALUES(?,?,?,?,?)" );
			ps.setString(1, s.getName());
			ps.setString(2, s.getPassword());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getGender());
			ps.setString(5, s.getCountry());
			status=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
		 return status;
	}

	
	public static int update(Student s) {
		int status = 0 ;
		 try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(
			"update students set name=?, password=?,email=?,gender=?,country=? where id =?" );
			ps.setString(1, s.getName());
			ps.setString(2, s.getPassword());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getGender());
			ps.setString(5, s.getCountry());
			ps.setInt(6, s.getId());
			status=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
		 return status;
	}
	
	
	public static int delete(Student s) {
		int status = 0 ;
		 try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(
			"delete from students where id = ?" );
			ps.setInt(1, s.getId());

			status=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e);
		}
		 return status;
	}

	
	public static List<Student> getAllRecords(){
		List<Student> list = new ArrayList<Student>();
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from students");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Student s = new Student();
						s.setId(rs.getInt("id"));
						s.setName(rs.getString("name"));
						s.setPassword(rs.getString("password"));
						s.setEmail(rs.getString("email"));
						s.setGender(rs.getString("gender"));
						s.setCountry(rs.getString("country"));
				list.add(s);
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return list;
	}


	public static Student getRecordById(int id) {
		Student s = null ;
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement("select * from students where id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
						s = new Student();
						s.setId(rs.getInt("id"));
						s.setName(rs.getString("name"));
						s.setPassword(rs.getString("password"));
						s.setEmail(rs.getString("email"));
						s.setGender(rs.getString("gender"));
						s.setCountry(rs.getString("country"));
			}
		} catch (SQLException e) {
			System.out.println(e);
		}
		return s;
	}



}
