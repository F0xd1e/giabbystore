package Servlet;
 
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOPackage.UserDAO;
 
/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/DoLogin")
public class DoLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoLogin() {
        super();
        
    }
 
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
 
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //getting parameters from the form
    	String user = request.getParameter("username");
        String password= request.getParameter("password");
        UserDAO userquery = new UserDAO();
        String result = null;
        try {
        	//result will contain the nickname of the user
            result= userquery.checkUserExistence(user, password);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        //login failed case
        if (result == null) {
        	String errmessage="Username and/or password are incorrect. Please retry.";
        	request.setAttribute("errms", errmessage);
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        	return;
        }
        //success login case
        HttpSession newsess = request.getSession();
       	boolean permithandler=false;
       	UserDAO checkinguser = new UserDAO();
        try {
        	permithandler = checkinguser.checkUserSecurityClearance(result);
        } catch (SQLException e) {
			e.printStackTrace();
        }
        if (permithandler == true) {
        	//set of session attributes - admin user
        	newsess.setAttribute("admin", result);
        	newsess.setAttribute("user", null);
        	/*Cookie idCookie = new Cookie("name",result);  // Cookies if admin
        	Cookie sessiontracking = new Cookie("sessid", newsess.getId());
        	idCookie.setMaxAge(60*60*2);  //Admin has less cookie durability due to security operations
        	sessiontracking.setMaxAge(60*60*2); // As ^ 
            response.addCookie(idCookie);
            response.addCookie(sessiontracking);*/
        } else {
        	//set of session attributes - normal user
        	newsess.setAttribute("admin", null);
        	newsess.setAttribute("user", result);
        	/*Cookie idCookie = new Cookie("name",result);  // Cookies if regular user
        	Cookie sessiontracking = new Cookie("sessid", newsess.getId());
        	idCookie.setMaxAge(60*60*48);
        	sessiontracking.setMaxAge(60*60*48);
            response.addCookie(idCookie);
            response.addCookie(sessiontracking);*/
        }
        response.addIntHeader("Success", 888); //Debug purposes
    	String dest = "index.jsp";
    	if (dest == null || dest.contains("/DoLogin") || dest.trim().isEmpty()) {
    		dest = ".";
    	}
    	response.sendRedirect(dest);
    	return;
    }
            
}
 