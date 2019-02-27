package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class Cart {
	private IConnectionProvider connectionProvider = null;
    private String sourceName = "shoemall";
    private DbHelper dbHelper;
    
    public Cart(){
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
    
	public int add(JavaBean.Cart item) throws SQLException {
		return dbHelper.insertAndReturnKey(
				"INSERT INTO Cart(loginName,productId,productName,showPicture,brand,size,price,count) VALUES(?,?,?,?,?,?,?,?)",
				item.getLoginName(),
				item.getProductId(),
				item.getProductName(),
				item.getShowPicture(),
				item.getBrand(),
				item.getSize(),
				item.getPrice(),
				item.getCount());
	}

	public int save(JavaBean.Cart item) throws SQLException {
		return dbHelper.updatePrepareSQL(
				"UPDATE Cart SET size=?,count=? WHERE no=?",	
				item.getSize(),
				item.getCount(),	
				item.getNo());
	}
	
	public List<JavaBean.Cart> findByName(String customerName) throws Exception{
		String sql = "SELECT * FROM Cart WHERE loginName=?";
		ResultSet rs = dbHelper.query(sql,customerName);
		List<JavaBean.Cart> items = new ArrayList<JavaBean.Cart>();
		while (rs.next()){
			JavaBean.Cart item = new JavaBean.Cart();
			item.setNo(rs.getInt(1));
			item.setLoginName(rs.getString(2));
			item.setProductId(rs.getString(3));
			item.setProductName(rs.getString(4));
			item.setShowPicture(rs.getString(5));
			item.setBrand(rs.getString(6));
			item.setSize(rs.getInt(7));
			item.setPrice(rs.getDouble(8));
			item.setCount(rs.getInt(9));
			items.add(item);
		}
			return items;
	}


	public double countTotal(String customerName) throws Exception{
		String sql = "SELECT * FROM Cart WHERE loginName=?";
		ResultSet rs = dbHelper.query(sql,customerName);
		double totalMoney=0;
		while (rs.next()){
			JavaBean.Cart item = new JavaBean.Cart();
			item.setNo(rs.getInt(1));
			item.setLoginName(rs.getString(2));
			item.setProductId(rs.getString(3));
			item.setProductName(rs.getString(4));
			item.setShowPicture(rs.getString(5));
			item.setBrand(rs.getString(6));
			item.setSize(rs.getInt(7));
			item.setPrice(rs.getDouble(8));
			item.setCount(rs.getInt(9));
			totalMoney+=rs.getDouble(8)*rs.getInt(9);
		}
			return totalMoney;
	}

	
	public List<JavaBean.Cart> findByNo(int no) throws Exception{
		String sql = "SELECT * FROM Cart WHERE no=?";
		ResultSet rs = dbHelper.query(sql,no);
		List<JavaBean.Cart> items = new ArrayList<JavaBean.Cart>();
		while (rs.next()){
			JavaBean.Cart item = new JavaBean.Cart();
			item.setNo(rs.getInt(1));
			item.setLoginName(rs.getString(2));
			item.setProductId(rs.getString(3));
			item.setProductName(rs.getString(4));
			item.setShowPicture(rs.getString(5));
			item.setBrand(rs.getString(6));
			item.setSize(rs.getInt(7));
			item.setPrice(rs.getDouble(8));
			item.setCount(rs.getInt(9));

			items.add(item);
		}
			return items;
	}

	public void remove(int no) throws Exception{
		String sql = "DELETE FROM Cart WHERE no=?";
		dbHelper.updatePrepareSQL(sql, no);
	}	

	public void del(String customerName) throws Exception{
		String sql = "DELETE FROM Cart WHERE loginName=?";
		dbHelper.updatePrepareSQL(sql, customerName);
	}	
}
