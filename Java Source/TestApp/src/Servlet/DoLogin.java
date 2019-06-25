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
import JavaBeans.UserBean;
 
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
        Boolean canAccess=false;
        /*
        try {
        	//result will contain the nickname of the user
            result= userquery.checkUserExistence(user, password);
            canAccess= userquery.checkUserAccessPermit(result);
            System.err.println(canAccess);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
        */
        
        try {
			result= userquery.checkUserExistence(user, password);
		} catch (ClassNotFoundException | InstantiationException | SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
        
        //login failed case
        if (result == null) {
        	String errmessage="Username and/or password are incorrect. Please retry.";
        	request.setAttribute("errms", errmessage);
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        	return;
        }
        
        try {
    		canAccess= userquery.checkUserAccessPermit(result);
    	} catch (SQLException e1) {
    		// TODO Auto-generated catch block
    		e1.printStackTrace();
    	}
        
        if (canAccess == false) {
        
        	String banmessage="You are banned from the site.";
        	request.setAttribute("banmsg", banmessage);
        	request.getRequestDispatcher("login.jsp").forward(request, response);
        	return;
        	
        }
        //success login case
        
        /*TAKING THE USER BEAN*/
        UserDAO luDAO = new UserDAO();
        UserBean loggedUser = null;
        try {
			loggedUser = luDAO.doRetrieveByUsername(result);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			System.err.println("PROBLEM WITH USERBEAN!");
		}
        
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

        } else {
        	
        	newsess.setAttribute("admin", null);
        	newsess.setAttribute("user", result);

        }
        
 
        if (loggedUser != null) {
        	newsess.setAttribute("userBean", loggedUser);
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
 