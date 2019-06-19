package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import DAOPackage.ProductDAO;
import JavaBeans.ProductBean;



/**
 * Servlet implementation class HomeSuggestions
 */
@WebServlet("/HomeSuggestions")
public class HomeSuggestions extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeSuggestions() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ProductDAO prod=new ProductDAO();
		ArrayList<ProductBean> all=null;
		try {
			all=prod.doRetrieveAll();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String json=getJSONSuggestions(all);
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String getJSONSuggestions(ArrayList<ProductBean> prod) {
		Random index=new Random();
		JSONArray arr=new JSONArray();
		while(prod.size()>8) {
			prod.remove(index.nextInt(prod.size()-1));
		}
		
		for(ProductBean b : prod) {
			JSONObject obj=new JSONObject();
			double price;
			String title, imgPath;
			price=b.getPrice();
			title=b.getTitle();
			imgPath=b.getImgPath();
			obj.put("price", price);
			obj.put("title", title);
			obj.put("imgPath", imgPath);
			arr.put(obj);
		}
		
		return arr.toString();
	}

}
