package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import DAOPackage.ProductDAO;
import JavaBeans.ProductBean;

/**
 * Servlet implementation class DoGetCategories
 */
@WebServlet("/DoGetCategories")
public class DoGetCategories extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoGetCategories() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO pDao=new ProductDAO();
		ArrayList<ProductBean> prods=null;
		try {
			prods=pDao.doRetrieveAll(); //getting all products
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String json=toJSONCategories(prods);
		
		//System.out.println(json);
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String toJSONCategories(ArrayList<ProductBean> prods) {
		HashSet<String> categories=new HashSet<String>(); //it will contains all categories
		for(ProductBean p : prods) {
			String category=p.getTipology();
			categories.add(category); //adding all categories
		}
		
		JSONArray arr=new JSONArray();
		
		for(String s : categories) {
			arr.put(s);
		}
		return arr.toString();
	}
}
