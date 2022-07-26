package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Dep;
import model.DepDAO;
import model.Student;
import model.StudentDAO;

/**
 * Servlet implementation class Update
 */
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		StudentDAO sDAO = new  StudentDAO();
		Student stu = new Student();
		stu.setId(request.getParameter("id"));
		stu = sDAO.getStudent(stu.getId());
		
		Dep d = new Dep();
		DepDAO depDAO = new DepDAO();
		
		ArrayList<Dep> dep = depDAO.getAllDep();
		
		request.setAttribute("depList", dep);
		
		request.setAttribute("student", stu);
		request.getRequestDispatcher("UpdateStudent.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
