package JavaBeans;

public class CartBean {

	public CartBean() {}
	
	private String userCode;
	private int productCode;

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public int getProductCode() {
		return productCode;
	}

	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	
}
