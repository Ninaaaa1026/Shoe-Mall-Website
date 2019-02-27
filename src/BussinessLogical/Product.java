package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class Product {
	private IConnectionProvider connectionProvider = null;
	private String sourceName = "shoemall";
	private DbHelper dbHelper;
	private DbHelper dbHelper1;
	private DbHelper dbHelper2;
	private DbHelper dbHelper3;

	public Product() {
		try {
			connectionProvider = new JdbcProvider("com.mysql.jdbc.Driver",
					"jdbc:mysql://127.0.0.1:3306/", "root", "123456");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		dbHelper = new DbHelper(connectionProvider, sourceName);
		dbHelper1 = new DbHelper(connectionProvider, sourceName);
		dbHelper2 = new DbHelper(connectionProvider, sourceName);
		dbHelper3 = new DbHelper(connectionProvider, sourceName);
	}

	public int add(JavaBean.Product item) throws SQLException {
		return dbHelper
				.insertAndReturnKey(
						"INSERT INTO Product(productId,brand,productName,discount,originalPrice,style,season,gender,showPicture,date,stock,size35,size36,size37,size38,size39,size40,size41,size42,sales) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
						item.getProductId(), item.getBrand(),
						item.getProductName(), item.getOriginalPrice(),
						item.getDiscount(), item.getStyle(), item.getSeason(),
						item.getGender(), item.getShowPicture(),
						item.getDate(), item.getStock(), item.getSize35(),
						item.getSize36(), item.getSize37(), item.getSize38(),
						item.getSize39(), item.getSize40(), item.getSize41(),
						item.getSize42(), item.getSales());
	}

	public int save(JavaBean.Product item) throws SQLException {
		return dbHelper
				.updatePrepareSQL(
						"UPDATE Product SET productId=?,brand=?,productName=?,discount=?,originalPrice=?,style=?,season=?,gender=?,showPicture=?,date=?,stock=?,size35=?,size36=?,size37=?,size38=?,size39=?,size40=?,size41=?,size42=?,sales=? WHERE ProductId=?",
						item.getBrand(), item.getProductName(),
						item.getOriginalPrice(), item.getDiscount(),
						item.getStyle(), item.getSeason(), item.getGender(),
						item.getShowPicture(), item.getDate(), item.getStock(),
						item.getSize35(), item.getSize36(), item.getSize37(),
						item.getSize38(), item.getSize39(), item.getSize40(),
						item.getSize41(), item.getSize42(), item.getSales(),
						item.getProductId());
	}

	public List<JavaBean.Product> findByName(String productName)
			throws Exception {
		String sql = "SELECT * FROM Product WHERE productName like '%"
				+ productName + "%'";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setProductName(rs.getString(2));
			item.setBrand(rs.getString(3));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));
			items.add(item);
		}
		return items;
	}

	public void addSales(String loginName) throws Exception {		
		String sql = "SELECT * FROM Cart WHERE loginName='" + loginName + "'";
		ResultSet rs = dbHelper.query(sql);
		while (rs.next()) {
			String sql1 = "SELECT sales,size" + rs.getInt(7)
					+ ",stock FROM Product WHERE productId='" + rs.getString(3)+"'";
			ResultSet rs1 = dbHelper1.query(sql1);
			if (rs1.next()) {
				int sales = rs1.getInt(1) +rs.getInt(9);
				int size = rs1.getInt(2) - rs.getInt(9);
				int count = rs1.getInt(3) - rs.getInt(9);
				dbHelper2.updatePrepareSQL(
						"UPDATE Product SET sales=?,stock=?,size"
								+ rs.getInt(7) + "=? WHERE productId='"
								+ rs.getString(3) + "'", sales, count, size);
				dbHelper3.updatePrepareSQL("DELETE FROM Cart WHERE no=?", rs.getInt(1));
			}
		}
	}

	public List<JavaBean.Product> findByStyle(String style) throws Exception {
		String sql = "SELECT * FROM Product WHERE style=?";
		ResultSet rs = dbHelper.query(sql, style);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setBrand(rs.getString(3));
			item.setProductName(rs.getString(2));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));
			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Product> findByDate(String date) throws Exception {
		String sql = "SELECT * FROM Product WHERE date like '" + date + "%'";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setBrand(rs.getString(3));
			item.setProductName(rs.getString(2));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));
			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Product> sortByDate() throws Exception {
		String sql = "select * from Product order by date desc";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setBrand(rs.getString(3));
			item.setProductName(rs.getString(2));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));
			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Product> sortByDateAndGender(String gender)
			throws Exception {
		String sql = "select * from Product where gender=? order by date desc";
		ResultSet rs = dbHelper.query(sql, gender);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setBrand(rs.getString(3));
			item.setProductName(rs.getString(2));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));
			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Product> sortByDateAndStyle(String style)
			throws Exception {
		String sql = "select * from Product where style=? order by date desc";
		ResultSet rs = dbHelper.query(sql, style);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setBrand(rs.getString(3));
			item.setProductName(rs.getString(2));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));
			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Product> findByGender(String gender) throws Exception {
		String sql = "SELECT * FROM Product WHERE gender=?";
		ResultSet rs = dbHelper.query(sql, gender);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setBrand(rs.getString(3));
			item.setProductName(rs.getString(2));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));
			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Product> findBySeason(String season) throws Exception {
		String sql = "SELECT * FROM Product WHERE season=?";
		ResultSet rs = dbHelper.query(sql, season);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setBrand(rs.getString(3));
			item.setProductName(rs.getString(2));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));
			items.add(item);
		}
		return items;
	}

	public JavaBean.Product findById(String id) throws Exception {
		String sql = "SELECT * FROM Product WHERE ProductId=?";
		ResultSet rs = dbHelper.findById(sql, id);
		if (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setBrand(rs.getString(3));
			item.setProductName(rs.getString(2));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));
			return item;
		} else
			return null;
	}

	public List<JavaBean.Product> findByBrand(String brand) throws Exception {
		String sql = "SELECT * FROM Product WHERE brand=?";
		ResultSet rs = dbHelper.query(sql, brand);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setProductName(rs.getString(2));
			item.setBrand(rs.getString(3));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));

			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Product> findByStyleAndGender(String style,
			String gender) throws Exception {
		String sql = "SELECT * FROM Product WHERE style=? and gender=?";
		ResultSet rs = dbHelper.query(sql, style, gender);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setProductName(rs.getString(2));
			item.setBrand(rs.getString(3));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));

			items.add(item);
		}
		return items;
	}

	public List<JavaBean.Product> findAll() throws Exception {
		String sql = "SELECT * FROM Product";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Product> items = new ArrayList<JavaBean.Product>();
		while (rs.next()) {
			JavaBean.Product item = new JavaBean.Product();
			item.setProductId(rs.getString(1));
			item.setBrand(rs.getString(3));
			item.setProductName(rs.getString(2));
			item.setDiscount(rs.getDouble(5));
			item.setOriginalPrice(rs.getDouble(4));
			item.setStyle(rs.getString(6));
			item.setSeason(rs.getString(7));
			item.setGender(rs.getString(8));
			item.setShowPicture(rs.getString(9));
			item.setDate(rs.getString(10));
			item.setStock(rs.getInt(11));
			item.setSize35(rs.getInt(12));
			item.setSize36(rs.getInt(13));
			item.setSize37(rs.getInt(14));
			item.setSize38(rs.getInt(15));
			item.setSize39(rs.getInt(16));
			item.setSize40(rs.getInt(17));
			item.setSize41(rs.getInt(18));
			item.setSize42(rs.getInt(19));
			item.setSales(rs.getInt(20));

			items.add(item);
		}

		return items;
	}

	public void remove(String id) throws Exception {
		String sql = "DELETE FROM Product WHERE ProductId=?";
		dbHelper.updatePrepareSQL(sql, id);
	}

	public Boolean isExist(String productId) throws Exception {
		ResultSet rs = dbHelper.query(
				"SELECT * FROM Product WHERE productId = ?", productId);
		if (rs.next())
			return true;

		return false;
	}
}
