package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import DAOPackage.CartDAO;
import DAOPackage.ProductDAO;

import JavaBeans.CartBean;
import JavaBeans.ProductBean;
import JavaBeans.ProductInfo;
import JavaBeans.UserBean;

/**
 * Servlet implementation class DoRetrieveCart
 */
@WebServlet("/DoRetrieveCart")
public class DoRetrieveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoRetrieveCart() {
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
		
		ArrayList<ProductInfo> res=null;
		
		
		
		try {
			res=getCartList(cart);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getSession().setAttribute("cart", res);
		response.sendRedirect("cart.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private ArrayList<ProductInfo> getCartList(ArrayList<CartBean> cart) throws SQLException {
		
		ArrayList<ProductInfo> prods=new ArrayList<>();
		for(CartBean c : cart) {
			
			ProductDAO pDao=new ProductDAO();
			ProductBean prod=null;
			prod=pDao.doRetrieveProductByID(c.getProductCode());
			ProductInfo pInfo=new ProductInfo(prod, c.getQuantity());
			
			prods.add(pInfo);
		}
		
		return prods;
	}
	

}
