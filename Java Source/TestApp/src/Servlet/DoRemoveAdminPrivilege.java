package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOPackage.UserDAO;
import JavaBeans.UserBean;

/**
 * Servlet implementation class DoRemoveAdminPrivilege
 */
@WebServlet("/DoRemoveAdminPrivilege")
public class DoRemoveAdminPrivilege extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoRemoveAdminPrivilege() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String remAdmin=request.getParameter("username");
		UserDAO uDao=new UserDAO();
		UserBean usr=null;
		HttpSession sess = request.getSession();
		try {
			usr=uDao.doRetrieveByUsername(remAdmin);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(usr==null) {
			sess.setAttribute("msgConfirm","No such user in the database.");
			String dest = "adminpanel.jsp";
			response.sendRedirect(dest);
			return;
		}
		
		if(usr.isAdmin()==false) {
			sess.setAttribute("msgConfirm","The user is not an admin already.");
			String dest = "adminpanel.jsp";
			response.sendRedirect(dest);
			return;
		}
		
		usr.setAdmin(false);
		
		try {
			uDao.doSaveOrUpdate(usr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		sess.setAttribute("msgConfirm","User is no longer an admin!");
		String dest = "adminpanel.jsp";
		response.sendRedirect(dest);
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
