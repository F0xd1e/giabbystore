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


@WebServlet("/DoRetrieveUserProfile")
public class DoRetrieveUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DoRetrieveUserProfile() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		UserBean user = null;
		UserDAO handler = new UserDAO();
		String username = null;
		String userSession = (String) request.getSession().getAttribute("userSession");
		String adminSession = (String) request.getSession().getAttribute("adminSession");
		
		if (userSession == null && adminSession == null) {
			
			System.err.println("userSession and adminSession are both set to NULL. This should never happen.");
			System.exit(-1);
			
		}
		
		if (userSession != null && adminSession == null) {
			
			username = userSession;
			
		} else if (adminSession != null && userSession == null) {
			
			username = adminSession;
			
		} else {
			
			System.err.println("Something wrong in the cascaded if determining true username");
			return;
			
		}
		
		
		try {
			user = handler.doRetrieveByUsername(username);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		request.getSession().setAttribute("userinfobean", user);
		response.sendRedirect("profile.jsp");
		return;
		
		
		
	}

}
