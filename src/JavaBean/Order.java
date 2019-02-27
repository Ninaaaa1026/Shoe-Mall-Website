package JavaBean;

public class Order {
	String orderNumber;
	String orderStatus;
	String deliveryState;
	double orderMoney;
	double productWeight;
	double freight;
	String paymentWay;
	String consignee;
	String address;
	String telephone;
	String date;
	String paymentStatus;
	String name;
	double paidAmount;
	String deliveryMode;
	String memo;

	public Order(){}
	public String getOrderNumber() {
		return  orderNumber;
	}
	public void setOrderNumber(String orderNumber) {
		this. orderNumber=  orderNumber;
	}
	public String getOrderStatus() {
		return  orderStatus;
	}
	public void setOrderStatus(String  orderStatus) {
		this. orderStatus=  orderStatus;
	}
	public String getDeliveryState() {
		return  deliveryState;
	}
	public void setDeliveryState(String  deliveryState) {
		this. deliveryState=  deliveryState;
	}
	public double getOrderMoney() {
		return  orderMoney;
	}
	public void setOrderMoney(double  orderMoney) {
		this. orderMoney=  orderMoney;
	}
	public double getProductWeight() {
		return  productWeight;
	}
	public void setProductWeight(double  productWeight) {
		this. productWeight=  productWeight;
	}
	public double getFreight() {
		return  freight;
	}
	public void setFreight(double  freight) {
		this.freight=  freight;
	}
	public String getPaymentWay() {
		return  paymentWay;
	}
	public void setPaymentWay(String paymentWay) {
		this. paymentWay=  paymentWay;
	}
	public String getConsignee() {
		return  consignee;
	}
	public void setConsignee(String consignee) {
		this. consignee=  consignee;
	}
	public String getAddress() {
		return  address;
	}
	public void setAddress(String address) {
		this. address=  address;
	}
	public String getTelephone() {
		return  telephone;
	}
	public void setTelephone(String telephone) {
		this. telephone=  telephone;
	}
	public String getPaymentStatus() {
		return  paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this. paymentStatus= paymentStatus;
	}
	public String getDate() {
		return  date;
	}
	public void setDate(String date) {
		this. date= date;
	}
	public String getName() {
		return  name;
	}
	public void setName(String name) {
		this.name= name;
	}
	public double getPaidAmount() {
		return  paidAmount;
	}
	public void setPaidAmount(double paidAmount) {
		this.paidAmount= paidAmount;
	}
	public String getDeliveryMode() {
		return  deliveryMode;
	}
	public void setDeliveryMode(String deliveryMode) {
		this. deliveryMode= deliveryMode;
	}
	public String getMemo() {
		return  memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
}
