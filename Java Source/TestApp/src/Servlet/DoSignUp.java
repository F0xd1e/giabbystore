package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOPackage.UserDAO;

/**
 * Servlet implementation class DoSignUp
 */
@WebServlet("/DoSignUp")
public class DoSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DoSignUp() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UserDAO signupSetup = new UserDAO();
		
		String signuser =(String) request.getAttribute("username");
		String signpassword = (String) request.getAttribute("password");
		String signname = (String) request.getAttribute("name");
		String signsurname = (String) request.getAttribute("surname");
		String signnation = (String) request.getAttribute("nation");
		String signcity = (String) request.getAttribute("city");
		String signcap = (String) request.getAttribute("cap");
		String signaddr = (String) request.getAttribute("address");
		String signemail = (String) request.getAttribute("email");
		String signphone = (String) request.getAttribute("phone");
		
	}

}
