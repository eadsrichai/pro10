package controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;
/**
 * Servlet implementation class InsertStudent
 */
public class InsertStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		Dep d = new Dep();
		Student s = new Student();
		s.setId(request.getParameter("id"));
		s.setPre(request.getParameter("pre"));
		s.setFname(request.getParameter("fname"));
		s.setLname(request.getParameter("lname"));
		s.setAge(Integer.parseInt(request.getParameter("age")));
		d.setName_dep(request.getParameter("id_dep"));
		s.setDep(d);
		
		StudentDAO stuDAO = new StudentDAO();
		stuDAO.createStudent(s);
		stuDAO.closeConnection();
		response.sendRedirect("/project10");
		//request.getRequestDispatcher("TestDb").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
