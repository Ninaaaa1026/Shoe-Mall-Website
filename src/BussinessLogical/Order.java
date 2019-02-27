package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class Order {
	private IConnectionProvider connectionProvider = null;
    private String sourceName = "shoemall";
    private DbHelper dbHelper;
    public Order(){
		try {
	        connectionProvider = new JdbcProvider(
	                "com.mysql.jdbc.Driver",
	                "jdbc:mysql://127.0.0.1:3306/",
	                "root","123456");
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    }
		dbHelper = new DbHelper(connectionProvider, sourceName);
    }
    
	public int add(JavaBean.Order item) throws SQLException {
		return dbHelper.insertAndReturnKey(
				"INSERT INTO Ordersheet(orderNumber,orderStatus,deliveryState,orderMoney,productWeight,freight,paymentWay,consignee,address,telephone,date,paymentStatus,name,paidAmount,memo) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
				item.getOrderNumber(),
				item.getOrderStatus(),
				item.getDeliveryState(),
				item.getOrderMoney(),
				item.getProductWeight(),
				item.getFreight(),
				item.getPaymentWay(),
				item.getConsignee(),
				item.getAddress(),
				item.getTelephone(),
				item.getDate(),
				item.getPaymentStatus(),
				item.getName(),
				item.getPaidAmount(),
				item.getMemo());
	}
	
	public int save(JavaBean.Order item) throws SQLException {
		return dbHelper.updatePrepareSQL(
				"UPDATE Ordersheet SET orderStatus=?,deliveryState=?,productWeight=?,orderMoney=?,freight=?,paymentWay=?,consignee=?,address=?,telephone=?,date=?,paymentStatus=?,name=?,paidAmount=?,memo=? WHERE orderNumber=?",			
				item.getOrderStatus(),
				item.getDeliveryState(),
				item.getProductWeight(),
				item.getOrderMoney(),
				item.getFreight(),
				item.getPaymentWay(),
				item.getConsignee(),
				item.getAddress(),
				item.getTelephone(),
				item.getDate(),
				item.getPaymentStatus(),
				item.getName(),
				item.getPaidAmount(),
				item.getMemo(),
				item.getOrderNumber());
		}
	
	public List<JavaBean.Order> findByDate(String date) throws Exception{
		String sql = "SELECT * FROM Ordersheet WHERE date=?";
		ResultSet rs = dbHelper.query(sql, date);
		List<JavaBean.Order> items = new ArrayList<JavaBean.Order>();
		while(rs.next()){
			JavaBean.Order item = new JavaBean.Order();
			item.setOrderNumber(rs.getString(1));
			item.setDeliveryState(rs.getString(3));
			item.setOrderStatus(rs.getString(2));
			item.setOrderMoney(rs.getDouble(4));
			item.setProductWeight(rs.getDouble(5));
			item.setFreight(rs.getDouble(6));
			item.setPaymentWay(rs.getString(7));
			item.setConsignee(rs.getString(8));
			item.setAddress(rs.getString(9));
			item.setTelephone(rs.getString(10));
			item.setDate(rs.getString(11));
			item.setPaymentStatus(rs.getString(12));
			item.setName(rs.getString(13));
			item.setPaidAmount(rs.getDouble(14));
			item.setMemo(rs.getString(15));
			items.add(item);
		}
			return items;
	}
	
	public List<JavaBean.Order> sortByDate(String date) throws Exception{
		String sql = "SELECT top "+date+" * FROM Ordersheet order by date desc";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Order> items = new ArrayList<JavaBean.Order>();
		while(rs.next()){
			JavaBean.Order item = new JavaBean.Order();
			item.setOrderNumber(rs.getString(1));
			item.setDeliveryState(rs.getString(3));
			item.setOrderStatus(rs.getString(2));
			item.setOrderMoney(rs.getDouble(4));
			item.setProductWeight(rs.getDouble(5));
			item.setFreight(rs.getDouble(6));
			item.setPaymentWay(rs.getString(7));
			item.setConsignee(rs.getString(8));
			item.setAddress(rs.getString(9));
			item.setTelephone(rs.getString(10));
			item.setDate(rs.getString(11));
			item.setPaymentStatus(rs.getString(12));
			item.setName(rs.getString(13));
			item.setPaidAmount(rs.getDouble(14));
			item.setMemo(rs.getString(15));
			items.add(item);
		}
			return items;
	}
	
	public JavaBean.Order findByOrderNumber(String orderNumber) throws Exception{
		String sql = "SELECT * FROM Ordersheet WHERE orderNumber=?";
		ResultSet rs = dbHelper.findById(sql, orderNumber);
		if (rs.next()){
			JavaBean.Order item = new JavaBean.Order();
			item.setOrderNumber(rs.getString(1));
			item.setDeliveryState(rs.getString(3));
			item.setOrderStatus(rs.getString(2));
			item.setOrderMoney(rs.getDouble(4));
			item.setProductWeight(rs.getDouble(5));
			item.setFreight(rs.getDouble(6));
			item.setPaymentWay(rs.getString(7));
			item.setConsignee(rs.getString(8));
			item.setAddress(rs.getString(9));
			item.setTelephone(rs.getString(10));
			item.setDate(rs.getString(11));
			item.setPaymentStatus(rs.getString(12));
			item.setName(rs.getString(13));
			item.setPaidAmount(rs.getDouble(14));
			item.setMemo(rs.getString(15));
			return item;
		}
		else return null;
	}

	public List<JavaBean.Order> findByName(String name) throws Exception{
		String sql = "SELECT * FROM Ordersheet WHERE name=?";
		ResultSet rs = dbHelper.query(sql,name);
		List<JavaBean.Order> items = new ArrayList<JavaBean.Order>();
		while (rs.next()){
			JavaBean.Order item = new JavaBean.Order();
			item.setOrderNumber(rs.getString(1));
			item.setDeliveryState(rs.getString(3));
			item.setOrderStatus(rs.getString(2));
			item.setOrderMoney(rs.getDouble(4));
			item.setProductWeight(rs.getDouble(5));
			item.setFreight(rs.getDouble(6));
			item.setPaymentWay(rs.getString(7));
			item.setConsignee(rs.getString(8));
			item.setAddress(rs.getString(9));
			item.setTelephone(rs.getString(10));
			item.setDate(rs.getString(11));
			item.setPaymentStatus(rs.getString(12));
			item.setName(rs.getString(13));
			item.setPaidAmount(rs.getDouble(14));
			item.setMemo(rs.getString(15));
			
			items.add(item);
		}
		
		return items;
	}

	
	public List<JavaBean.Order> findAll() throws Exception{
		String sql = "SELECT * FROM Ordersheet";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Order> items = new ArrayList<JavaBean.Order>();
		while (rs.next()){
			JavaBean.Order item = new JavaBean.Order();
			item.setOrderNumber(rs.getString(1));
			item.setDeliveryState(rs.getString(3));
			item.setOrderStatus(rs.getString(2));
			item.setOrderMoney(rs.getDouble(4));
			item.setProductWeight(rs.getDouble(5));
			item.setFreight(rs.getDouble(6));
			item.setPaymentWay(rs.getString(7));
			item.setConsignee(rs.getString(8));
			item.setAddress(rs.getString(9));
			item.setTelephone(rs.getString(10));
			item.setDate(rs.getString(11));
			item.setPaymentStatus(rs.getString(12));
			item.setName(rs.getString(13));
			item.setPaidAmount(rs.getDouble(14));
			item.setMemo(rs.getString(15));
			
			items.add(item);
		}
		
		return items;
	}
	
	public void remove(String id) throws Exception{
		String sql = "DELETE FROM Ordersheet WHERE orderNumber=?";
		dbHelper.updatePrepareSQL(sql, id);
	}
	
	public Boolean isExist(String orderNumber) throws Exception {
		String sql = "SELECT * FROM Ordersheet WHERE orderNumber="+orderNumber;
		ResultSet rs = dbHelper.query(sql);
		if (rs.next())
			return true;		
		else return false;
	}
}
