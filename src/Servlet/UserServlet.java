package Servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.Product;
import BussinessLogical.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/User")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String action = req.getParameter("action");

		if (action != null && action.equals("list")){
			req.setAttribute("Users", this.list());
			req.getRequestDispatcher("userList.jsp").forward(req, res);
			return;
		}
		
		//
		if (action != null && action.equals("login")){
			String loginName = req.getParameter("loginName");
			String password  = req.getParameter("password");
			if (loginName != null && password != null){
				if (!loginName.equals("") && !password.equals("")){
					try {
						if (login(loginName, password)){
							int userId=getId(loginName, password);
							req.getSession().setAttribute("USERID",userId);
							res.sendRedirect("Product?action=list");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		if (action != null && action.equals("reg")){
			JavaBean.User item = this.getUser(req);
			if (item != null){
				try {
					this.Register(item);
					res.sendRedirect("login.html");
				} catch (Exception e) {
					res.getWriter().print("<script>alert(\"User Exist.\");location.href=\"register.html\";</script>");
				}
				
			}
		}
		
		if (action != null && action.equals("exit")){
			req.getSession().invalidate();
			res.sendRedirect("shoemall.jsp");
		}
		
		if (action != null && action.equals("edit")){
			try {				
				int id = (int)req.getSession().getAttribute("USERID");
				req.setAttribute("User", new User().findById(id));
				req.getRequestDispatcher("/userEdit.jsp").forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (action != null && action.equals("del")){
			try {
				int id = Integer.parseInt(req.getParameter("UserId"));
				new User().remove(id);
				res.sendRedirect("User?action=list");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (action != null && action.equals("save")){
			this.save(this.getUser(req));
			req.getRequestDispatcher("Product?action=list").forward(req, res);
		}
	}
	
	private void save(JavaBean.User item) {
		try {
			new User().save(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private Boolean login(String loginName, String password) throws Exception {
		User svc = new User();
		return svc.login(loginName, password);
	}
	
	private int getId(String loginName, String password) throws Exception {
		User svc = new User();
		return svc.getId(loginName, password);
	}
	
	private void Register(JavaBean.User item) throws Exception{
		BussinessLogical.User svc = new BussinessLogical.User();
		if (!svc.isExist(item.getLoginName())){
			svc.add(item);
		}
		else {
			throw new Exception("User Exist.");
		}
	}
	
	private List<JavaBean.User> list(){
    	User svc = new User();
		try {
			return svc.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
    }
	
	private JavaBean.User getUser(HttpServletRequest req){
		String loginName = req.getParameter("loginName");
		if (loginName == null || loginName.equals(""))
			return null;
		String password  = req.getParameter("password");
		if (password == null || password.equals(""))
			return null;
		
		JavaBean.User item = new JavaBean.User();
		String fullName = req.getParameter("fullName");
		String gender  = req.getParameter("gender");
		String birthDate  = req.getParameter("birthDate");
		String id = req.getParameter("UserId");
		
		item.setId(Integer.parseInt(id));		
		item.setLoginName(loginName);
		item.setPassword(password);
		item.setFullName(fullName);
		item.setGender(gender);
		item.setBirthDate(birthDate);
		
		return item;
    }
}	
	
