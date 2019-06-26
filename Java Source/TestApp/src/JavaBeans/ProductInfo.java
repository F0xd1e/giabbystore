package JavaBeans;

public class ProductInfo {
	private ProductBean product;
	private int quantity;
	
	public ProductInfo(ProductBean product,int quantity) {
		this.product=product;
		this.quantity=quantity;
	}
	
	public ProductBean getProduct() {
		return product;
	}
	public int getQuantity() {
		return quantity;
	}
	
}
