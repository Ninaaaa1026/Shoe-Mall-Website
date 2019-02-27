package Servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.Customer;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/Customer")
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		if (action != null && action.equals("list")){
			req.setAttribute("Customers", this.list());
			req.getRequestDispatcher("customerList.jsp").forward(req, res);
			return;
		}
		
		//
		if (action != null && action.equals("login")){
			String loginName = req.getParameter("loginName");
			String password  = req.getParameter("password");
			String formerUrl=req.getSession().getAttribute("formerUrl").toString();
			if (loginName != null && password != null){
				if (!loginName.equals("") && !password.equals("")){
					try {
						if (login(loginName, password)){
							req.getSession().setAttribute("ISLOGIN", "1");
							req.getSession().setAttribute("LoginName",loginName);
							req.getSession().setAttribute("LoginId",getId(loginName, password));
							if(formerUrl=="cart")
								formerUrl="Cart?action=searchName&customerName="+loginName;
							if(formerUrl=="customerOrder")
								formerUrl="Sales?action=sales&customerName="+loginName;
							res.sendRedirect(formerUrl);
						}
						else{
							res.getWriter().print("<script>alert(\"LoginName Or Password is Wrong!\");location.href=\"customerLogin.html\";</script>");
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
		}
		
		if (action != null && action.equals("exit")){
			req.getSession().setAttribute("ISLOGIN","0");
			req.getSession().setAttribute("LoginName","");
			req.getSession().setAttribute("LoginId","0");
			res.sendRedirect("shoemall.jsp");
		}
		
		
		if (action != null && action.equals("reg")){
			JavaBean.Customer item = this.getCustomer(req);
			if (item != null){
				try {
					this.Register(item);
					res.getWriter().print("<script>alert(\"Register Successfully,Log In Now!\");location.href=\"customerLogin.html\";</script>");
				} catch (Exception e) {
					res.getWriter().print("<script>alert(\"Customer Exist.\");location.href=\"register.html\";</script>");
				}
				
			}
		}
		
		if (action != null && action.equals("edit")){
			try {
				
				int id = Integer.parseInt(req.getParameter("CustomerId"));
				req.setAttribute("Customer", new Customer().findById(id));
				req.getRequestDispatcher("/customerEdit.jsp").forward(req, res);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (action != null && action.equals("del")){
			try {
				int id = Integer.parseInt(req.getParameter("CustomerId"));
				new Customer().remove(id);
				res.sendRedirect("Customer?action=list");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if (action != null && action.equals("save")){
			JavaBean.Customer item = this.getCustomer(req);
			if (item != null){
				BussinessLogical.Customer svc = new BussinessLogical.Customer();
				try {
					svc.save(item);
					res.sendRedirect("Customer?action=list");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	private Boolean login(String loginName, String password) throws Exception {
		Customer svc = new Customer();
		return svc.login(loginName, password);
	}

	private int getId(String loginName, String password) throws Exception {
		Customer svc = new Customer();
		return svc.getId(loginName, password);
	}
	
	private void Register(JavaBean.Customer item) throws Exception{
		BussinessLogical.Customer svc = new BussinessLogical.Customer();
		if (!svc.isExist(item.getLoginName())){
			svc.add(item);
		}
		else {
			throw new Exception("Customer Exist.");
		}
	}
	
	private List<JavaBean.Customer> list(){
    	Customer svc = new Customer();
		try {
			return svc.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
    }
	
	private JavaBean.Customer getCustomer(HttpServletRequest req) throws UnsupportedEncodingException{
		String loginName = new String(req.getParameter("loginName").getBytes( "ISO-8859-1"), "UTF-8");
		String password  = req.getParameter("password");
		String fullName = new String(req.getParameter("fullName").getBytes( "ISO-8859-1"), "UTF-8");;
		String gender  = new String(req.getParameter("gender").getBytes( "ISO-8859-1"), "UTF-8");;
		String birthDate  = req.getParameter("birthDate");
		
		JavaBean.Customer item = new JavaBean.Customer();		
		item.setLoginName(loginName);
		item.setPassword(password);
		item.setFullName(fullName);
		item.setGender(gender);
		item.setBirthDate(birthDate);
		
		return item;
    }
}	
	
