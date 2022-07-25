package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentDAO {
	private Connection con;

	public StudentDAO() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/person?characterEncoding=utf-8","root", "");
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
	public ArrayList<Student> getAllStudents()  {
		ArrayList<Student> studentList = new ArrayList<Student>();
			PreparedStatement pStatement;
			try {
				String sql = "SELECT * FROM student, dep WHERE student.id_dep = dep.id_dep";
				pStatement = con.prepareStatement(sql);
				ResultSet rs;
				rs = pStatement.executeQuery();
				while (rs.next()) {
					Student s = new Student();
					Dep d = new Dep();
					s.setId(rs.getString("id"));
					s.setPre(rs.getString("pre"));
					s.setFname(rs.getString("Fname"));
					s.setLname(rs.getString("lname"));
					s.setAge(Integer.parseInt(rs.getString("age")));
					d.setName_dep(rs.getString("name_dep"));
					s.setDep(d);
					studentList.add(s);
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		//closeConnection();
		return studentList;
	}

	// เพิ่มข้อมูลนักเรียน
	public void createStudent(Student student) {

		PreparedStatement p;
		try {
			String sql = "INSERT INTO student (id, pre, fname, lname, age, id_dep) VALUES (?, ?, ?, ?, ?, ?)";
			p = con.prepareStatement(sql);
			p.setString(1, student.getId());
			p.setString(2, student.getPre());
			p.setString(3, student.getFname());
			p.setString(4, student.getLname());
			p.setInt(5, student.getAge());
			p.setString(6, student.getDep().getName_dep());
			int count = p.executeUpdate();
			if (count > 0)
				System.out.print("Insert data to student");
			else
				System.out.print("Not insert data");

		} catch (SQLException e) {
			System.out.print("Not insert data");
		}

	}

	// ทำการลบ ข้อมูลนักเรียน
	public void delStudent(Student student) {
		PreparedStatement p;
		try {
			String sql = "DELETE FROM student WHERE id = ?";
			p = con.prepareStatement(sql);
			p.setString(1, student.getId());
			p.executeUpdate();
			System.out.print("Delete id " + student.getId());
		} catch (SQLException e) {
			System.out.print("Not Delete id " + student.getId());
			e.printStackTrace();
		}
	}

	// ทำการ update นักศึกษา
	public void updateStudent(Student student) {
		String sql = "UPDATE student SET pre = ?, fname = ?, lname = ?, age = ? WHERE id = ?";
		PreparedStatement p;
		try {
			p = con.prepareStatement(sql);
			p.setString(1, student.getPre());
			p.setString(2, student.getFname());
			p.setString(3, student.getLname());
			p.setInt(4, student.getAge());
			p.setString(5, student.getId());
			int num = p.executeUpdate();
			if(num > 0)
				System.out.print("Update id : " + student.getId());
		} catch (SQLException e) {
			System.out.print("Not update id : " + student.getId());
			e.printStackTrace();
		}

	}
	// ค้นหาข้อมูลนักศึกษาตาม รหัส
	public Student getStudent(String id) {
		PreparedStatement p;
		
		try {
			p = con.prepareStatement("SELECT * FROM student WHERE id = ?");
			p.setString(1, id);
			ResultSet rs = p.executeQuery();
			if (rs.next()) { 
					Student student = mappingStudent(rs); 
					return student;
			} 
		} catch (SQLException e) {
			System.out.print("NOT get id student " + id);
			e.printStackTrace();
		}
		
		return null;
	}
	
	

	// ทำการ mapping 
	private Student mappingStudent(ResultSet rs)  {
		Student student = new Student();
		try {
			student.setId(rs.getString("id"));
			student.setPre(rs.getString("pre"));
			student.setFname(rs.getString("fname"));
			 student.setLname(rs.getString("lname"));
			 student.setAge(Integer.parseInt(rs.getString("age")));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 
		return student; 
	}
}
