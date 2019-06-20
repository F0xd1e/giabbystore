package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOPackage.CartDAO;
import DAOPackage.OrderDAO;
import DAOPackage.ProductDAO;
import JavaBeans.CartBean;
import JavaBeans.OrderBean;
import JavaBeans.ProductBean;
import JavaBeans.UserBean;

/**
 * Servlet implementation class DoBuyCartProducts
 */
@WebServlet("/DoBuyCartProducts")
public class DoBuyCartProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoBuyCartProducts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession sess=request.getSession();
		String userId=(String) sess.getAttribute("user");
		double totPrice=Double.parseDouble(request.getParameter("price"));
		
		
		UserBean usr=new UserBean();
		usr.setUsername(userId);
		
		ArrayList<CartBean> cart=null;
		CartDAO cartDao=new CartDAO();
		try {
			cart=cartDao.doRetrieveAll_byUser(usr);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/* WORK IN PROGRESS --> ADD ORDER TO DB
		int shipment=getLatestShipment(cart);
		OrderDAO cDao=new OrderDAO();
	    OrderBean oBean=new OrderBean();
		oBean.setOrderDate( (java.sql.Date) new Date());
		oBean.setShipmentDate((java.sql.Date)new Date());
		oBean.setPaymentCode("Porco DIOOOO");
		oBean.setShipmentPrice(shipment);
		oBean.setTotalPrice(totPrice);
		oBean.setUsername(userId);
		
		
		try {
			cDao.doSave(oBean);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		*/
		
		for( CartBean c : cart) {
			try {
				cartDao.doDelete(c);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	private int getLatestShipment(ArrayList<CartBean> cart) {
		ProductDAO pDao=new ProductDAO();
		ProductBean pBean=null;
		int max=0;
		for(CartBean c : cart) {
			try {
				pBean=pDao.doRetrieveProductByID(c.getProductCode());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(pBean.getShipment()>max) {
				max=pBean.getShipment();
			}
		}
		return max;
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
