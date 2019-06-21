package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOPackage.ProductDAO;
import JavaBeans.ProductBean;


@WebServlet("/DoSearch")
public class DoSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userinput= request.getParameter("searchBar");
		ProductDAO handler = new ProductDAO();
		ArrayList<ProductBean> ret = null;
		
		try {
			ret=handler.retrieveProductByStringName(userinput);
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		request.setAttribute("searchRes", ret);
		request.getRequestDispatcher("searchresults.jsp").forward(request, response);
		
	}
	
	
	
	
	
	

}
