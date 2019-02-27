package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class Customer {
	private IConnectionProvider connectionProvider = null;
    private String sourceName = "shoemall";
    private DbHelper dbHelper;
    public Customer(){
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
    
	public int add(JavaBean.Customer item) throws SQLException {
		return dbHelper.insertAndReturnKey(
				"INSERT INTO Customer(LoginName, Password, FullName, Gender, BirthDate) VALUES(?,?,?,?,?)",
				item.getLoginName(),
				item.getPassword(),
				item.getFullName(),
				item.getGender(),
				item.getBirthDate());
	}
	
	public int save(JavaBean.Customer item) throws SQLException {
		return dbHelper.updatePrepareSQL(
				"UPDATE Customer SET LoginName=?, Password=?, FullName=?, Gender=?, BirthDate=? WHERE Id=?",
				item.getLoginName(),
				item.getPassword(),
				item.getFullName(),
				item.getGender(),
				item.getBirthDate(),
				item.getId());
	}
	
	public Boolean login(String loginName, String password) throws Exception {
		ResultSet rs = dbHelper.query("SELECT * FROM Customer WHERE LoginName = ? AND Password = ?", loginName, password);
		if (rs.next())
			return true;
		
		return false;
	}

	public int getId(String loginName, String password) throws Exception {
		ResultSet rs = dbHelper.query("SELECT * FROM Customer WHERE LoginName = ? AND Password = ?", loginName, password);
		if(rs.next())
			return rs.getInt(1);
		else return 0;
	}
	
	public Boolean isExist(String loginName) throws Exception {
		ResultSet rs = dbHelper.query("SELECT * FROM Customer WHERE LoginName = ?", loginName);
		if (rs.next())
			return true;
		
		return false;
	}
	
	public JavaBean.Customer findById(int id) throws Exception{
		String sql = "SELECT * FROM Customer WHERE id=?";
		ResultSet rs = dbHelper.findById(sql, id);
		if (rs.next()){
			return this.BuildItem(rs);
		}
		else
			return null;
	}
	
	public List<JavaBean.Customer> findAll() throws Exception{
		String sql = "SELECT * FROM Customer";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.Customer> items = new ArrayList<JavaBean.Customer>();
		while (rs.next()){
			items.add(this.BuildItem(rs));
		}
		return items;
	}
	
	public void remove(int id) throws Exception{
		String sql = "DELETE FROM Customer WHERE id=?";
		dbHelper.updatePrepareSQL(sql, id);
	}
	
	private JavaBean.Customer BuildItem(ResultSet rs) throws SQLException{
			JavaBean.Customer item = new JavaBean.Customer();
			item.setId(rs.getInt(1));
			item.setLoginName(rs.getString(2));
			item.setPassword(rs.getString(3));
			item.setFullName(rs.getString(4));
			item.setGender(rs.getString(5));
			item.setBirthDate(rs.getString(6));
			
			return item;
	}
}
