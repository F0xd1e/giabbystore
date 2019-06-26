package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAOPackage.OrderDAO;
import DAOPackage.ProductDAO;
import DAOPackage.ReferenceDAO;
import JavaBeans.OrderBean;
import JavaBeans.OrderPairing;
import JavaBeans.ProductBean;
import JavaBeans.ProductInfo;
import JavaBeans.ReferenceBean;
import JavaBeans.UserBean;

/**
 * Servlet implementation class DoRetrieveOrder
 */
@WebServlet("/DoRetrieveOrder")
public class DoRetrieveOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoRetrieveOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		UserBean user=(UserBean)request.getSession().getAttribute("userBean");
		OrderDAO oDao=new OrderDAO();
		ArrayList<OrderBean> allOrders=null;
		try {
			allOrders=oDao.doRetrieveAll_byUser(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(allOrders==null) {
			request.setAttribute("msg", "There is no order for this user.");
			request.getRequestDispatcher("/WEB-INF/jsp/orders.jsp").forward(request, response);
			return;
		}
		
		
		ArrayList<OrderPairing> pairings=getOrderProductPairings(allOrders);
		
		
		request.setAttribute("orders",pairings);
		request.getRequestDispatcher("/WEB-INF/jsp/orders.jsp").forward(request, response);
		return;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private ArrayList<OrderPairing> getOrderProductPairings(ArrayList<OrderBean> allOrders){
		ArrayList<OrderPairing> pairings=new ArrayList<>();
		for(OrderBean order : allOrders) {
			ArrayList<ProductInfo> products=getOrderProducts(order);
			OrderPairing pair=new OrderPairing(order, products);
			pairings.add(pair);
		}
		
		return pairings;
		
	}
	
	private ArrayList<ProductInfo> getOrderProducts(OrderBean order){
		
		int orderCode=order.getOrderCode();
		ReferenceDAO rDao=new ReferenceDAO();
		int orderQuantity=0;
		ArrayList<ReferenceBean> references=null;
		ProductDAO pDao=new ProductDAO();
		ProductBean prod=null;
		ProductInfo product=null;
		ArrayList<ProductInfo> products=new ArrayList<>();
		try {
			references= rDao.doRetrieveByOrderCode(orderCode);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for(ReferenceBean r:references) {
			try {
				prod=pDao.doRetrieveProductByID(r.getProductCode());
				orderQuantity=r.getQuantity();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			product=new ProductInfo(prod, orderQuantity);
			products.add(product);
		}
		return products;
	}

}
