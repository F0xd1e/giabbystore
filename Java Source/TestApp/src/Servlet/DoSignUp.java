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
		UserBean newUser = new UserBean();
		
		String signuser     =  (String) request.getParameter("username");
		String signpassword =  (String) request.getParameter("password");
		String signname     =  (String) request.getParameter("name");
		String signsurname  =  (String) request.getParameter("surname");
		String signnation   =  (String) request.getParameter("nation");
		String signcity     =  (String) request.getParameter("city");
		String signcap      =  (String) request.getParameter("cap");
		String signaddr     =  (String) request.getParameter("address");
		String signemail    =  (String) request.getParameter("email");
		String signphone    =  (String) request.getParameter("phone");
		
	
		boolean chuser= signuser.matches("^[a-zA-Z0-9]+([a-zA-Z0-9](_|-| )[a-zA-Z0-9])*[a-zA-Z0-9]+$");
		boolean chpassword = signpassword.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,20}$");
		boolean chsignname = signname.matches("^[a-zA-Z]+$");
		boolean chsignsurname = signsurname.matches("^[a-zA-Z]+$");
		boolean chsignnation = signnation.matches("^[a-zA-Z]+$");
		boolean chsigncity = signcity.matches("^[a-zA-Z ]+$");
		boolean chsigncap = signcap.matches("^[0-9]{5}+$");
		boolean chsignaddr = signaddr.matches("^[A-Za-z0-9 ,]+$");
		boolean chsignemail = signemail.matches("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
		boolean chsignphone = signphone.matches("^[0-9]+$");

		if (chuser == true && chpassword == true && chsignname == true && chsignsurname == true && chsignnation == true && chsigncity == true && chsigncap == true
			&& chsignaddr == true && chsignemail == true && chsignphone == true	) {
			
			// Signup data is valid
			
			newUser.setUsername(signuser);
			newUser.setPassword(signpassword);
			newUser.setName(signname);
			newUser.setSurname(signsurname);
			newUser.setNation(signnation);
			newUser.setCity(signcity);
			newUser.setCap(signcap);
			newUser.setAddress(signaddr);
			newUser.setEmail(signemail);
			newUser.setPhone(signphone);
			newUser.setAdmin(false);
			newUser.setCanAccess(true);
			
			try {
				signupSetup.doSave(newUser);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			request.setAttribute("greet", "Thank you for signing up, you can now login!");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
			// response.sendRedirect("index.jsp");
			
		} else {
			
			// Signup data is not valid
			
			System.out.println("Error! Value of flags: "+chuser+chpassword+chsignname+chsignsurname+chsignnation+chsigncity+chsigncap+chsignaddr+chsignemail+chsignphone+"  END");
			response.sendRedirect("signup.jsp");
			
		}
	}
}
