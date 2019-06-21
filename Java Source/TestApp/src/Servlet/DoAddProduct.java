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
 * Servlet implementation class DoAddProduct
 */
@WebServlet("/DoAddProduct")
public class DoAddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DoAddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String title, description, tipology, imgPath;
		double price;
		int availability, shipment;
		
		title=request.getParameter("title");
		description=request.getParameter("description");
		tipology=request.getParameter("tipology");
		imgPath=request.getParameter("imgPath");
		price=Double.parseDouble(request.getParameter("price"));
		
		availability=Integer.parseInt(request.getParameter("availability"));
		shipment=Integer.parseInt(request.getParameter("title"));
		
		ProductDAO pDao=new ProductDAO();
		ProductBean pBean= new ProductBean();
		
		pBean.setAvailability(availability);
		pBean.setDescription(description);
		pBean.setImgPath(imgPath);
		pBean.setPrice(price);
		
		pBean.setShipment(shipment);
		pBean.setTipology(tipology);
		pBean.setTitle(title);
		
		try {
			pDao.doSave(pBean);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("success", "Object added with success!");
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
