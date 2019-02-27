package JavaBean;

public class Sales {

	public Sales() {
	}
	int no;
	String orderNumber;
	String loginName;
	String productId;
	String productName;
	String brand;
	int size;
	double price;
	int count;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getOrderNumber() {
		return  orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this. orderNumber=  orderNumber;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginName() {
		return loginName;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String pId) {
		this.productId = pId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public double getPrice(){
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}	
	public int getCount(){
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}	
	public void setSize(int size) {
		this.size = size;
	}
	public int getSize(){
		return size;
	}
}
