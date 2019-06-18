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
		
		UserDAO signupSetup =  new UserDAO();
		
		String signuser     =  (String) request.getAttribute("username");
		String signpassword =  (String) request.getAttribute("password");
		String signname     =  (String) request.getAttribute("name");
		String signsurname  =  (String) request.getAttribute("surname");
		String signnation   =  (String) request.getAttribute("nation");
		String signcity     =  (String) request.getAttribute("city");
		String signcap      =  (String) request.getAttribute("cap");
		String signaddr     =  (String) request.getAttribute("address");
		String signemail    =  (String) request.getAttribute("email");
		String signphone    =  (String) request.getAttribute("phone");
		
		boolean chuser= signuser.matches("/^[a-zA-Z0-9]+([a-zA-Z0-9](_|-| )[a-zA-Z0-9])*[a-zA-Z0-9]+$/");
		boolean chpassword = signpassword.matches("/^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,20}$/g");
		boolean chsignname = signname.matches("/^[a-zA-Z]+$/");
		boolean chsignsurname = signsurname.matches("/^[a-zA-Z]+$/");
		boolean chsignnation = signnation.matches("/^[a-zA-Z]+$/");
		boolean chsigncity = signcity.matches("/^[a-zA-Z]+$/");
		boolean chsigncap = signcap.matches("/^[0-9]{5}/;");
		boolean chsignaddr = signaddr.matches("/^[A-Za-z0-9 ,]+$/");
		boolean chsignemail = signemail.matches("/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/");
		boolean chsignphone = signphone.matches("/^[0-9]/");

		
		// INCOMPLETE
		
		
	}
	


}
