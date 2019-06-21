package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import DAOPackage.UserDAO;
import JavaBeans.UserBean;

/**
 * Servlet implementation class DoGetBannedUsers
 */
@WebServlet("/DoGetBannedUsers")
public class DoGetBannedUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoGetBannedUsers() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		UserDAO uDao=new UserDAO();
		ArrayList<UserBean> allUser=null;
		
		try {
			allUser=uDao.doRetrieveAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String json=toJSONBannedList(allUser);
		response.getWriter().write(json);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String toJSONBannedList(ArrayList<UserBean> allUser) {
		JSONArray arr=new JSONArray();
		for(UserBean u : allUser) {
			if(u.isCanAccess()==false) {
				arr.put(u.getUsername());
			}
		}
		
		return arr.toString();
		
	}

}
