package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DepDAO {
	private Connection con;

	public DepDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/Person?characterEncoding=utf-8","root", "");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("No Driver");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Not connect Database");
		}
	}

	public void closeConnection() {
		try {
			con.close();
			System.out.println("Close connect Database");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Not close connect Database");
		}
	}

	// ดึงข้อมูลจากฐานข้อมูลมาแสดงผล
	public ArrayList<Dep> getAllDep()  {
		ArrayList<Dep> depList = new ArrayList<Dep>();
			PreparedStatement pStatement;
			try {
				pStatement = con.prepareStatement("SELECT * FROM dep");
				ResultSet rs;
				rs = pStatement.executeQuery();
				while (rs.next()) {
					Dep d = new Dep();
					d.setId_dep(rs.getString("id_dep"));
					d.setName_dep(rs.getString("name_dep"));
					depList.add(d);
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		//closeConnection();
		return depList;
	}

}
