package BussinessLogical;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbUtils.DbHelper;
import dbUtils.IConnectionProvider;
import dbUtils.JdbcProvider;

public class User {
	private IConnectionProvider connectionProvider = null;
    private String sourceName = "shoemall";
    private DbHelper dbHelper;
    public User(){
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
    
	public int add(JavaBean.User item) throws SQLException {
		return dbHelper.insertAndReturnKey(
				"INSERT INTO User(LoginName, Password, FullName, Gender, BirthDate) VALUES(?,?,?,?,?)",
				item.getLoginName(),
				item.getPassword(),
				item.getFullName(),
				item.getGender(),
				item.getBirthDate());
	}
	
	public int save(JavaBean.User item) throws SQLException {
		return dbHelper.updatePrepareSQL(
				"UPDATE User SET LoginName=?, Password=?, FullName=?, Gender=?, BirthDate=? WHERE Id=?",
				item.getLoginName(),
				item.getPassword(),
				item.getFullName(),
				item.getGender(),
				item.getBirthDate(),
				item.getId());
	}
	
	public Boolean login(String loginName, String password) throws Exception {
		ResultSet rs = dbHelper.query("SELECT * FROM User WHERE LoginName = ? AND Password = ?", loginName, password);
		if (rs.next())
			return true;
		
		return false;
	}
	
	public int getId(String loginName, String password) throws Exception {
		ResultSet rs = dbHelper.query("SELECT Id FROM User WHERE LoginName = ? AND Password = ?", loginName, password);
		if (rs.next())
			return rs.getInt(1);
		else return -1;
	}
	
	public Boolean isExist(String loginName) throws Exception {
		ResultSet rs = dbHelper.query("SELECT * FROM User WHERE LoginName = ?", loginName);
		if (rs.next())
			return true;
		
		return false;
	}
	
	public JavaBean.User findById(int id) throws Exception{
		String sql = "SELECT * FROM User WHERE id=?";
		ResultSet rs = dbHelper.findById(sql, id);
		if (rs.next()){
			return this.BuildItem(rs);
		}
		else
			return null;
	}
	
	public List<JavaBean.User> findAll() throws Exception{
		String sql = "SELECT * FROM User";
		ResultSet rs = dbHelper.query(sql);
		List<JavaBean.User> items = new ArrayList<JavaBean.User>();
		while (rs.next()){
			items.add(this.BuildItem(rs));
		}
		return items;
	}
	
	public void remove(int id) throws Exception{
		String sql = "DELETE FROM User WHERE id=?";
		dbHelper.updatePrepareSQL(sql, id);
	}
	
	private JavaBean.User BuildItem(ResultSet rs) throws SQLException{
			JavaBean.User item = new JavaBean.User();
			item.setId(rs.getInt(1));
			item.setLoginName(rs.getString(2));
			item.setPassword(rs.getString(3));
			item.setFullName(rs.getString(4));
			item.setGender(rs.getString(5));
			item.setBirthDate(rs.getString(6));
			
			return item;
	}
}
