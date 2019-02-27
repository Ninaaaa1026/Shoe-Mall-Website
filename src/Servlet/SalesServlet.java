package Servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.Order;
import BussinessLogical.Sales;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/Sales")
public class SalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalesServlet() {
		super();
	}

	private JavaBean.Sales getSales(HttpServletRequest req) throws UnsupportedEncodingException {
		String orderNumber = req.getParameter("orderNumber");
		String loginName = req.getParameter("loginName");
		String pId = req.getParameter("productId");
		String pName = new String(req.getParameter("productName").getBytes("ISO-8859-1"),"UTF-8");
		String brand = new String(req.getParameter("brand").getBytes("ISO-8859-1"),"UTF-8");
		String price = req.getParameter("price");
		String count = req.getParameter("count");
		String size = req.getParameter("size");
		
		JavaBean.Sales item = new JavaBean.Sales();
		item.setProductName(orderNumber);
		item.setProductName(pName);
		item.setBrand(brand);
		item.setProductId(pId);
		item.setLoginName(loginName);
		item.setPrice(Double.parseDouble(price));
		item.setCount(Integer.parseInt(count));
		item.setSize(Integer.parseInt(size));

		return item;
	}

	private void remove(int no) {
		Sales svc = new Sales();
		try {
			svc.remove(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private List<JavaBean.Sales> findByName(String customerName) {
		Sales svc = new Sales();
		try {
			return svc.findByName(customerName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Order> findOrderNumber(String customerName) {
		Order svc = new Order();
		try {
			return svc.findByName(customerName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private List<JavaBean.Sales> list() {
		Sales svc = new Sales();
		try {
			return svc.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		doPost(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if (action != null && action.equals("list")) {
			req.setAttribute("Saleses", this.list());
			req.getRequestDispatcher("salesList.jsp").forward(req, res);
		}
		
		if (action != null && action.equals("sales")) {
			String customerName = req.getParameter("customerName");
			req.setAttribute("Saleses", this.findByName(customerName));
			req.setAttribute("OrderNo", this.findOrderNumber(customerName));
			req.getRequestDispatcher("customerOrder.jsp").forward(req, res);

		}
		
		// É¾³ý
		if (action != null && action.equals("del")) {
			int no = Integer.parseInt(req.getParameter("no"));
			this.remove(no);
			res.sendRedirect("salesList.jsp");
		}
	}
}
