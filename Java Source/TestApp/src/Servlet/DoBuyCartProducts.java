package Servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAOPackage.CartDAO;
import DAOPackage.OrderDAO;
import DAOPackage.ReferenceDAO;
import JavaBeans.CartBean;
import JavaBeans.OrderBean;
import JavaBeans.ReferenceBean;
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
		int shipment=Integer.parseInt(request.getParameter("shipment"));
		
		
		UserBean usr=new UserBean();
		usr.setUsername(userId);
		
		//retrieval of user cart
		ArrayList<CartBean> cart=null;
		CartDAO cartDao=new CartDAO();
		try {
			cart=cartDao.doRetrieveAll_byUser(usr);
		} catch (SQLException e) {
			// TODO Auto-generated catch bloc
			e.printStackTrace();
		}
		
		
		
		
		//creation of Order entity
		
		String paymentCode=generatePaymentCode();
		Date plusDays=getShipmentDate(shipment);
		
		OrderDAO cDao=new OrderDAO();
	    OrderBean oBean=new OrderBean();
		oBean.setOrderDate( new Date(new java.util.Date().getTime()));
		oBean.setShipmentDate(plusDays);
		oBean.setPaymentCode(paymentCode);
		oBean.setShipmentPrice(5);
		oBean.setTotalPrice(totPrice);
		oBean.setUsername(userId);
		
		//order is added
		try {
			cDao.doSave(oBean);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		//reference is created
		
		ReferenceDAO rDao=new ReferenceDAO();
		ReferenceBean ref=new ReferenceBean();
		
		int orderCode=1;
		try {
			orderCode = cDao.doGetMaxCode();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		//reference is added to db
		for( CartBean c : cart) {
			
			ref.setOrderCode(orderCode);
			ref.setProductCode(c.getProductCode());
			ref.setQuantity(c.getQuantity());
			
			try {
				rDao.doSave(ref);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			//cart is now sdeleted
			try {
				cartDao.doDelete(c);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		response.sendRedirect("cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	/*
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
	*/
	private String generatePaymentCode() {
		char[] characters= {'a','b','c','d','e','f','g','h','i','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9'};
		char[] paymentCode=new char[16];
		Random rng=new Random();
		for(int i=0;i<paymentCode.length;i++) {
			paymentCode[i]=characters[rng.nextInt(characters.length)];
		}
		
		return paymentCode.toString();
		
	}
	
	private Date getShipmentDate(int shipment) {
		Date shipmentDate=new Date(new java.util.Date().getTime());
		LocalDate ld=shipmentDate.toLocalDate();
		LocalDate plusDays=ld.plusDays(shipment);
		return Date.valueOf(plusDays);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
