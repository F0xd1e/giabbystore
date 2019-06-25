package JavaBeans;

import java.util.ArrayList;

public class OrderPairing {
	private OrderBean order;
	private ArrayList<ProductBean> products;
	
	public OrderPairing(OrderBean order,ArrayList<ProductBean> products) {
		this.order=order;
		this.products=products;
	}

	public OrderBean getOrder() {
		return order;
	}

	public ArrayList<ProductBean> getProducts() {
		return products;
	}
	
	

}
