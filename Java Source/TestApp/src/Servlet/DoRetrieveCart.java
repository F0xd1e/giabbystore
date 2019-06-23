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
		
		String res=null;
		try {
			res=cartToJSON(cart);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.getWriter().write(res);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String cartToJSON(ArrayList<CartBean> cart) throws SQLException {
		
		JSONArray arr=new JSONArray();
		JSONObject obj=null;
		for(CartBean c : cart) {
			
			ProductDAO pDao=new ProductDAO();
			ProductBean prod=null;
			prod=pDao.doRetrieveProductByID(c.getProductCode());
			
			obj=new JSONObject();
			obj.put("imgPath", prod.getImgPath());
			obj.put("price", prod.getPrice());
			obj.put("title", prod.getTitle());
			obj.put("number", c.getQuantity());
			obj.put("shipment", prod.getShipment());
			obj.put("prodId", prod.getProductCode());
			
			arr.put(obj);
		}
		
		return arr.toString();
	}
	

}
