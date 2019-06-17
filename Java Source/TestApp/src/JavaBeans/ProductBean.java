package JavaBeans;

public class ProductBean {

	public ProductBean() {}
	
	private String productCode, title, description, tipology, imgPath;
	private double price;
	private int availability, shipment;
	
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTipology() {
		return tipology;
	}
	public void setTipology(String tipology) {
		this.tipology = tipology;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getAvailability() {
		return availability;
	}
	public void setAvailability(int availability) {
		this.availability = availability;
	}
	public int getShipment() {
		return shipment;
	}
	public void setShipment(int shipment) {
		this.shipment = shipment;
	}
	
}
