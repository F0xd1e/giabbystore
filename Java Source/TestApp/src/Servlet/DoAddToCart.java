package Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOPackage.CartDAO;
import DAOPackage.ProductDAO;
import JavaBeans.CartBean;
import JavaBeans.ProductBean;

/**
 * Servlet implementation class DoAddToCart
 */
@WebServlet("/DoAddToCart")
public class DoAddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoAddToCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sess=request.getSession();
		String usrId=(String) sess.getAttribute("user");
		int prodId=Integer.parseInt(request.getParameter("prodId"));
		int number=Integer.parseInt(request.getParameter("number"));
		
		ProductDAO pDao=new ProductDAO();
		ProductBean pBean=null;
		try {
			pBean=pDao.doRetrieveProductByID(prodId);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(pBean.getAvailability()-number<0) {
			response.sendRedirect("/WEB-INF/jsp/error.jsp");
			return;
		}
		
		pBean.setAvailability(pBean.getAvailability()-number);
		try {
			pDao.doSaveOrUpdate(pBean);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		CartBean prod=new CartBean();
		prod.setProductCode(prodId);
		prod.setUserCode(usrId);
		
		CartDAO cart=new CartDAO();
		try {
			cart.doSave(prod);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
