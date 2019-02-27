package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BussinessLogical.Product;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/Product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	private JavaBean.Product getProduct(HttpServletRequest req) {
		String pId = req.getParameter("productId");
		String pName = req.getParameter("productName");
		String brand = req.getParameter("brand");
		String originalPrice = req.getParameter("originalPrice");
		String discount = req.getParameter("discount");
		String style = req.getParameter("style");
		String season = req.getParameter("season");
		String gender = req.getParameter("gender");
		String sPicture = req.getParameter("showPicture");
		String date = req.getParameter("date");
		String stock = req.getParameter("stock");
		String size35 = req.getParameter("size35");
		String size36 = req.getParameter("size36");
		String size37 = req.getParameter("size37");
		String size38 = req.getParameter("size38");
		String size39 = req.getParameter("size39");
		String size40 = req.getParameter("size40");
		String size41 = req.getParameter("size41");
		String size42 = req.getParameter("size42");

		if (originalPrice == null || originalPrice.equals(""))
			return null;

		JavaBean.Product item = new JavaBean.Product();
		if (pId == null || pId.equals(""))
			item.setProductId(null);
		else
			item.setProductId(pId);

		item.setProductName(pName);
		item.setBrand(brand);
		item.setOriginalPrice(Double.parseDouble(originalPrice));
		item.setDiscount(Double.parseDouble(discount));
		item.setStyle(style);
		item.setSeason(season);
		item.setGender(gender);
		item.setShowPicture(sPicture);
		item.setDate(date);
		item.setStock(Integer.parseInt(stock));
		item.setSize35(Integer.parseInt(size35));
		item.setSize36(Integer.parseInt(size36));
		item.setSize37(Integer.parseInt(size37));
		item.setSize38(Integer.parseInt(size38));
		item.setSize39(Integer.parseInt(size39));
		item.setSize40(Integer.parseInt(size40));
		item.setSize41(Integer.parseInt(size41));
		item.setSize42(Integer.parseInt(size42));

		return item;
	}

	private List<JavaBean.Product> list() {
		Product svc = new Product();
		try {
			return svc.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private JavaBean.Product edit(String id) {
		Product svc = new Product();
		try {
			return svc.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private void remove(String id) {
		Product svc = new Product();
		try {
			svc.remove(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private List<JavaBean.Product> findByName(String productName) {
		Product svc = new Product();
		try {
			return svc.findByName(productName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Product> findBySeason(String season) {
		Product svc = new Product();
		try {
			return svc.findBySeason(season);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Product> sortByDate() {
		Product svc = new Product();
		try {
			return svc.sortByDate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Product> findByStyle(String style) {
		Product svc = new Product();
		try {
			return svc.findByStyle(style);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Product> findByStyleAndGender(String style,
			String gender) {
		Product svc = new Product();
		try {
			return svc.findByStyleAndGender(style, gender);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Product> sortByDateAndStyle(String style) {
		Product svc = new Product();
		try {
			return svc.sortByDateAndStyle(style);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Product> findByBrand(String brand) {
		Product svc = new Product();
		try {
			return svc.findByBrand(brand);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Product> findByGender(String gender) {
		Product svc = new Product();
		try {
			return svc.findByGender(gender);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Product> findByDate(String date) {
		Product svc = new Product();
		try {
			return svc.findByDate(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Product> sortByDateAndGender(String gender) {
		Product svc = new Product();
		try {
			return svc.sortByDateAndGender(gender);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private JavaBean.Product findById(String id) {
		Product svc = new Product();
		try {
			return svc.findById(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private void save(JavaBean.Product item) {
		try {
			new Product().save(item);
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
		if (action != null && action.equals("list")) {
			req.setAttribute("Products", this.list());
			req.getRequestDispatcher("productList.jsp").forward(req, res);
		}

		if (action != null && action.equals("listStock")) {
			req.setAttribute("Products", this.list());
			req.getRequestDispatcher("stockList.jsp").forward(req, res);
		}

		if (action != null && action.equals("saleList")) {
			req.setAttribute("Products", this.list());
			req.getRequestDispatcher("salesList.jsp").forward(req, res);
		}

		// 产品添加
		if (action != null && action.equals("add")) {
			JavaBean.Product item = this.getProduct(req);
			Product svc = new Product();
			try {
				if (!svc.isExist(item.getProductId())) {
					if (item != null) {
						try {
							new Product().add(item);
							req.getRequestDispatcher("Product?action=list")
									.forward(req, res);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				} else {
					res.getWriter()
							.print("<script>alert(\"Product Exist.\");location.href=\"register.html\";</script>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 名字搜索
		if (action != null && action.equals("searchName")) {
			String productName = req.getParameter("productName");
			if (productName == "" || productName == null) {
				res.sendRedirect("shoemall.jsp");
			} 
			else {
				req.setAttribute("Products", this.findByName(productName));
				req.getRequestDispatcher("search.jsp").forward(req, res);
			}
		}

		// 季节搜索
		if (action != null && action.equals("searchSeason")) {
			String season = new String(req.getParameter("season").getBytes(
					"ISO-8859-1"), "UTF-8");
			req.setAttribute("Products", this.findBySeason(season));
			req.getRequestDispatcher("search.jsp").forward(req, res);

		}

		// 款式搜索
		if (action != null && action.equals("searchBrand")) {
			String brand = new String(req.getParameter("brand").getBytes(
					"ISO-8859-1"), "UTF-8");
			req.setAttribute("Products", this.findByBrand(brand));
			req.getRequestDispatcher("search.jsp").forward(req, res);

		}

		// 款式搜索
		if (action != null && action.equals("searchStyle")) {
			String style = new String(req.getParameter("style").getBytes(
					"ISO-8859-1"), "UTF-8");
			req.setAttribute("Products", this.findByStyle(style));
			req.getRequestDispatcher("search.jsp").forward(req, res);

		}

		if (action != null && action.equals("styleAndGender")) {
			String style = new String(req.getParameter("style").getBytes(
					"ISO-8859-1"), "UTF-8");
			String gender = new String(req.getParameter("gender").getBytes(
					"ISO-8859-1"), "UTF-8");
			req.setAttribute("Products",
					this.findByStyleAndGender(style, gender));
			req.getRequestDispatcher("search.jsp").forward(req, res);

		}

		if (action != null && action.equals("searchDate")) {
			String date = req.getParameter("date");
			req.setAttribute("Products", this.findByDate(date));
			req.getRequestDispatcher("search.jsp").forward(req, res);

		}

		if (action != null && action.equals("searchGender")) {
			String gender = new String(req.getParameter("gender").getBytes(
					"ISO-8859-1"), "UTF-8");
			req.setAttribute("Products", this.findByGender(gender));
			req.getRequestDispatcher("search.jsp").forward(req, res);

		}

		if (action != null && action.equals("sortByDate")) {
			req.setAttribute("ProductsNewG", this.sortByDateAndGender("女"));
			req.setAttribute("ProductsNewN", this.sortByDateAndGender("男"));
			req.setAttribute("ProductsNewS", this.sortByDateAndStyle("运动"));
			req.setAttribute("ProductsS", this.findByStyle("运动"));
			req.setAttribute("ProductsG", this.findByGender("女"));
			req.setAttribute("ProductsN", this.findByGender("男"));
			req.getSession().setAttribute("SortByDate", this.sortByDate());
			req.getRequestDispatcher("shoemall.jsp").forward(req, res);
		}

		// 产品编辑
		if (action != null && action.equals("edit")) {
			String id = req.getParameter("productId");
			req.setAttribute("product", this.edit(id));
			req.getRequestDispatcher("productEdit.jsp").forward(req, res);
		}

		// 产品删除
		if (action != null && action.equals("del")) {
			String id = req.getParameter("productId");
			this.remove(id);
			req.getRequestDispatcher("Product?action=list").forward(req, res);
		}

		// 编辑后保存
		if (action != null && action.equals("save")) {
			this.save(this.getProduct(req));
			req.getRequestDispatcher("Product?action=list").forward(req, res);
		}

		if (action != null && action.equals("sell")) {
			String id = req.getParameter("productId");
			req.setAttribute("Product", this.findById(id));
			req.setAttribute("ProductId", id);
			req.getRequestDispatcher("sell.jsp").forward(req, res);

		}
	}
}
