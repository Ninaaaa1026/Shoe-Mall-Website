package Servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.Cart;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/Cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	private JavaBean.Cart getCart(HttpServletRequest req) throws UnsupportedEncodingException {
		String loginName = req.getParameter("loginName");
		String pId = req.getParameter("productId");
		String pName = new String(req.getParameter("productName").getBytes("ISO-8859-1"),"UTF-8");
		String brand = new String(req.getParameter("brand").getBytes("ISO-8859-1"),"UTF-8");
		String picture = req.getParameter("showPicture");
		String price = req.getParameter("price");
		String count = req.getParameter("count");
		String size = req.getParameter("size");
		
		JavaBean.Cart item = new JavaBean.Cart();
		item.setProductName(pName);
		item.setBrand(brand);
		item.setProductId(pId);
		item.setLoginName(loginName);
		item.setShowPicture(picture);
		item.setPrice(Double.parseDouble(price));
		item.setCount(Integer.parseInt(count));
		item.setSize(Integer.parseInt(size));

		return item;
	}
	
	private List<JavaBean.Cart> edit(int no) {
		Cart svc = new Cart();
		try {
			return svc.findByNo(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private double countTotal(String customerName) {
		Cart svc = new Cart();
		try {
			return svc.countTotal(customerName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	private void remove(int no) {
		Cart svc = new Cart();
		try {
			svc.remove(no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private List<JavaBean.Cart> findByName(String customerName) {
		Cart svc = new Cart();
		try {
			return svc.findByName(customerName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private void save(JavaBean.Cart item) {
		try {
			new Cart().save(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		
		// ²úÆ·Ìí¼Ó
		if (action != null && action.equals("add")) {
			JavaBean.Cart item = this.getCart(req);
			try {
					if (item != null) {
						try {
							new Cart().add(item);
							res.getWriter().print("<script>alert(\"Added successfully!\");location.href=\"Product?action=sell&productId="+req.getParameter("productId")+"\"</script>");
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// Ãû×ÖËÑË÷
		if (action != null && action.equals("searchName")) {
			String customerName = req.getParameter("customerName");
			req.setAttribute("Carts", this.findByName(customerName));
			req.setAttribute("Total", this.countTotal(customerName));
			req.getRequestDispatcher("cart.jsp").forward(req, res);

		}
		
		// Ãû×ÖËÑË÷
				if (action != null && action.equals("sureOrder")) {
					String customerName = req.getParameter("customerName");
					req.setAttribute("Carts", this.findByName(customerName));
					req.setAttribute("Total", this.countTotal(customerName));
					req.getRequestDispatcher("sureOrder.jsp").forward(req, res);

				}

		// ±à¼­
		if (action != null && action.equals("edit")) {
			int no = Integer.parseInt(req.getParameter("no"));
			req.setAttribute("Carts", this.edit(no));
			req.getRequestDispatcher("cart.jsp").forward(req, res);
		}

		// É¾³ý
		if (action != null && action.equals("del")) {
			int no = Integer.parseInt(req.getParameter("no"));
			String customerName = req.getParameter("customerName");
			this.remove(no);
			res.sendRedirect("Cart?action=searchName&customerName="+customerName);
		}

		// ±à¼­ºó±£´æ
		if (action != null && action.equals("save")) {
			this.save(this.getCart(req));
			req.getRequestDispatcher("Product?action=list").forward(req, res);
		}
	}
}
