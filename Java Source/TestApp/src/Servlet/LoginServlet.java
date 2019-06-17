package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOPackage.UserDAO;
import JavaBeans.UserBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserBean usr = new UserBean();
		usr.setUsername(request.getParameter("field_username"));
		usr.setPassword(request.getParameter("field_password"));
		usr.setName(request.getParameter("field_name"));
		usr.setSurname(request.getParameter("field_surname"));
		usr.setAddress(request.getParameter("field_address"));
		usr.setCity(request.getParameter("field_city"));
		usr.setCap(request.getParameter("field_cap"));
		usr.setNation(request.getParameter("field_nation"));
		usr.setPhone(request.getParameter("field_phone"));
		usr.setEmail(request.getParameter("field_email"));
		usr.setAdmin(false);
		usr.setCanAccess(true);
		UserDAO injector = new UserDAO();
		try {
			injector.doSave(usr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.err.println("ERR: Cannot use the doSave method on the DAO object");
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("result.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
