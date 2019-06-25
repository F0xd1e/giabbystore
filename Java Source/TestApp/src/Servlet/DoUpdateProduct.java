package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOPackage.ProductDAO;
import JavaBeans.ProductBean;

/**
 * Servlet implementation class DoUpdateProduct
 */
@WebServlet("/DoUpdateProduct")
public class DoUpdateProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoUpdateProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int productCode=Integer.parseInt(request.getParameter("productCode"));
		int availability=Integer.parseInt(request.getParameter("availability"));
		
		ProductDAO pDao=new ProductDAO();
		ProductBean prod=null;
		try {
			prod=pDao.doRetrieveProductByID(productCode);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(prod==null) {
			request.setAttribute("response-update", "No such element in the database.");
			request.getRequestDispatcher("productpanel.jsp").forward(request, response);
			return;
		}
		
		prod.setAvailability(availability);
		try {
			pDao.doSaveOrUpdate(prod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("response-update", "Availability successfully updated.");
		request.getRequestDispatcher("productpanel.jsp").forward(request, response);
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
