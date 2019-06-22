package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOPackage.UserDAO;
import JavaBeans.UserBean;

/**
 * Servlet implementation class DoUserBan
 */
@WebServlet("/DoUserBan")
public class DoUserBan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoUserBan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String toBan=request.getParameter("username");
		UserDAO uDao=new UserDAO();
		UserBean usr=null;
		try {
			usr=uDao.doRetrieveByUsername(toBan);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(usr==null) {
			request.setAttribute("response","No such user in the database.");
			request.getRequestDispatcher("banpanel.jsp").forward(request, response);
			return;
		}
		
		if(usr.isCanAccess()==false) {
			request.setAttribute("response","The user is already banned.");
			request.getRequestDispatcher("banpanel.jsp").forward(request, response);
			return;
		}
		
		usr.setCanAccess(false);
		
		try {
			uDao.doSaveOrUpdate(usr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("response","User banned with success!");
		request.getRequestDispatcher("banpanel.jsp").forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
