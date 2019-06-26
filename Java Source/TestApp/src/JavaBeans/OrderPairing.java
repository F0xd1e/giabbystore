package JavaBeans;

import java.util.ArrayList;

public class OrderPairing {
	private OrderBean order;
	private ArrayList<ProductInfo> products;
	
	public OrderPairing(OrderBean order,ArrayList<ProductInfo> products) {
		this.order=order;
		this.products=products;
	}

	public OrderBean getOrder() {
		return order;
	}

	public ArrayList<ProductInfo> getProducts() {
		return products;
	}
	
	

}
