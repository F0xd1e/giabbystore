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
 * Servlet implementation class DoDeleteProduct
 */
@WebServlet("/DoDeleteProduct")
public class DoDeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoDeleteProduct() {
        super();
        
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int productCode=Integer.parseInt(request.getParameter("productCode"));
		ProductDAO pDao=new ProductDAO();
		ProductBean prod=null;
		
		try {
			prod=pDao.doRetrieveProductByID(productCode);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(prod==null) {
			request.setAttribute("response","No such element in the database");
			request.getRequestDispatcher("productHandler.jsp").forward(request, response);
			return;
		}
		
		try {
			pDao.doDelete(prod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("response","Element successfully deleted!");
		request.getRequestDispatcher("productHandler.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
