package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class Sales {
	private IConnectionProvider connectionProvider = null;
	private String sourceName = "shoemall";
	private DbHelper dbHelper;

	public Sales() {
		try {
			connectionProvider = new JdbcProvider("com.mysql.jdbc.Driver",
					"jdbc:mysql://127.0.0.1:3306/", "root", "123456");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		dbHelper = new DbHelper(connectionProvider, sourceName);
	}

	public int add(String customerName,String orderNumber) throws SQLException {
		return dbHelper
				.insertAndReturnKey(
						"INSERT INTO sale(orderNumber,loginName,productId,productName,brand,size,price,count)"
			+ " select ordersheet.orderNumber,cart.loginName,cart.productId,cart.productName,cart.brand,cart.size,cart.price,cart.count"
			+ " from ordersheet,cart where ordersheet.orderNumber=? and cart.loginName=?",
			orderNumber,customerName);
	}

	public List<JavaBean.Sales> findByOrderNumber(String OrderNumber)
			throws Exception {
		String sql = "SELECT * FROM Sale WHERE orderNumber=?";
		ResultSet rs = dbHelper.query(sql, OrderNumber);
		List<JavaBean.Sales> items = new ArrayList<JavaBean.Sales>();
		while (rs.next()) {
			JavaBean.Sales item = new JavaBean.Sales();
			item.setNo(rs.getInt(1));
			item.setOrderNumber(rs.getString(2));
			item.setLoginName(rs.getString(3));
			item.setProductId(rs.getString(4));
			item.setProductName(rs.getString(5));
			item.setBrand(rs.getString(6));
			item.setSize(rs.getInt(7));
			item.setPrice(rs.getDouble(8));
			item.setCount(rs.getInt(9));
			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Sales> findByName(String loginName) throws Exception {
		String sql = "SELECT * FROM Sale WHERE loginName=?";
		ResultSet rs = dbHelper.query(sql, loginName);
		List<JavaBean.Sales> items = new ArrayList<JavaBean.Sales>();
		while (rs.next()) {
			JavaBean.Sales item = new JavaBean.Sales();
			item.setNo(rs.getInt(1));
			item.setOrderNumber(rs.getString(2));
			item.setLoginName(rs.getString(3));
			item.setProductId(rs.getString(4));
			item.setProductName(rs.getString(5));
			item.setBrand(rs.getString(6));
			item.setSize(rs.getInt(7));
			item.setPrice(rs.getDouble(8));
			item.setCount(rs.getInt(9));
			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Sales> findByNo(int no) throws Exception {
		String sql = "SELECT * FROM Sale WHERE no=?";
		ResultSet rs = dbHelper.query(sql, no);
		List<JavaBean.Sales> items = new ArrayList<JavaBean.Sales>();
		while (rs.next()) {
			JavaBean.Sales item = new JavaBean.Sales();
			item.setNo(rs.getInt(1));
			item.setOrderNumber(rs.getString(2));
			item.setLoginName(rs.getString(3));
			item.setProductId(rs.getString(4));
			item.setProductName(rs.getString(5));
			item.setBrand(rs.getString(6));
			item.setSize(rs.getInt(7));
			item.setPrice(rs.getDouble(8));
			item.setCount(rs.getInt(9));

			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Sales> findAll() throws Exception {
		String sql = "SELECT * FROM Sale";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Sales> items = new ArrayList<JavaBean.Sales>();
		while (rs.next()) {
			JavaBean.Sales item = new JavaBean.Sales();
			item.setNo(rs.getInt(1));
			item.setOrderNumber(rs.getString(2));
			item.setLoginName(rs.getString(3));
			item.setProductId(rs.getString(4));
			item.setProductName(rs.getString(5));
			item.setBrand(rs.getString(6));
			item.setSize(rs.getInt(7));
			item.setPrice(rs.getDouble(8));
			item.setCount(rs.getInt(9));

			items.add(item);
		}
		return items;
	}

	public void remove(int no) throws Exception {
		String sql = "DELETE FROM Sale WHERE no=?";
		dbHelper.updatePrepareSQL(sql, no);
	}
}
