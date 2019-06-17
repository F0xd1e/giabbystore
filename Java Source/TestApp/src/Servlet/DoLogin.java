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
 
/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/Login")
public class DoLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoLogin() {
        super();
        // TODO Auto-generated constructor stub
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
        
        String user = request.getParameter("username");
        String password= request.getParameter("password");
        UserDAO userquery = new UserDAO();
        String result = null;
        try {
            result= userquery.checkUserExistence(user, password);
        } catch (SQLException e) {
            
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        
        if (result == null) {
        
            throw new ServletException("Username e/o password non validi.");
            
        
            
        }
            
            request.getSession().setAttribute("user", result);
            String dest = request.getHeader("referer");
            if (dest == null || dest.contains("/Login") || dest.trim().isEmpty()) {
                dest = ".";
            }
            response.sendRedirect(dest);
        }
 
            
 
    }