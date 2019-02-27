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
import BussinessLogical.Order;
import BussinessLogical.Product;
import BussinessLogical.Sales;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/Order")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	private JavaBean.Order getOrder(HttpServletRequest req) throws UnsupportedEncodingException {
		String orderNumber = req.getParameter("orderNumber");
		String orderStatus = req.getParameter("orderStatus");
		String deliveryState = req.getParameter("deliveryState");
		String orderMoney = req.getParameter("orderMoney");
		String productWeight = req.getParameter("productWeight");
		String freight = req.getParameter("freight");
		String paymentWay = req.getParameter("paymentWay");
		String consignee =req.getParameter("consignee");
		String address = req.getParameter("address");
		String telephone = req.getParameter("telephone");
		String date = req.getParameter("date");
		String paymentStatus = req.getParameter("paymentStatus");
		String customerName = req.getParameter("customerName");
		String paidAmount = req.getParameter("paidAmount");
		String memo = req.getParameter("memo");
		
		JavaBean.Order item = new JavaBean.Order();
		item.setOrderNumber(orderNumber);
		item.setDeliveryState(deliveryState);
		item.setOrderStatus(orderStatus);
		item.setProductWeight(Double.parseDouble(productWeight));
		item.setOrderMoney(Double.parseDouble(orderMoney));
		item.setFreight(Double.parseDouble(freight));
		item.setPaymentWay(paymentWay);
		item.setConsignee(consignee);
		item.setAddress(address);
		item.setTelephone(telephone);
		item.setDate(date);
		item.setPaymentStatus(paymentStatus);
		item.setName(customerName);
		item.setPaidAmount(Double.parseDouble(paidAmount));
		item.setMemo(memo);
		return item;
	}

	private JavaBean.Cart getCart(HttpServletRequest req)
			throws UnsupportedEncodingException {
		String loginName = req.getParameter("loginName");
		String pId = req.getParameter("productId");
		String pName = new String(req.getParameter("productName").getBytes( "ISO-8859-1"), "UTF-8");
		String brand = new String(req.getParameter("brand").getBytes(
				"ISO-8859-1"), "UTF-8");
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

	private List<JavaBean.Order> list() {
		Order svc = new Order();
		try {
			return svc.findAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private JavaBean.Order edit(String orderNumber) {
		Order svc = new Order();
		try {
			return svc.findByOrderNumber(orderNumber);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private void remove(String id) {
		Order svc = new Order();
		try {
			svc.remove(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private List<JavaBean.Order> sortByDate(String date) {
		Order svc = new Order();
		try {
			return svc.sortByDate(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Order> findByName(String name) {
		Order svc = new Order();
		try {
			return svc.findByName(name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	private List<JavaBean.Cart> findByNameCart(String name) {
		Cart svc = new Cart();
		try {
			return svc.findByName(name);
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

	private void save(JavaBean.Order item) {
		try {
			new Order().save(item);
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
			req.setAttribute("Orders", this.list());
			req.getRequestDispatcher("orderList.jsp").forward(req, res);
			return;
		}

		// ²úÆ·Ìí¼Ó
		if (action != null && action.equals("add")) {
			JavaBean.Order item = this.getOrder(req);
			String customerName = req.getParameter("customerName");
			String orderNumber = req.getParameter("orderNumber");
			
			Order svc = new Order();
			try {
				if (!svc.isExist(item.getOrderNumber())) {
					if (item != null) {
						try {
							new Order().add(item);
							new Sales().add(customerName, orderNumber);
							new Product().addSales(customerName);
							req.getRequestDispatcher("successOrder.jsp")
									.forward(req, res);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				} else {
					res.getWriter()
							.print("<script>alert(\"Order Exist.\");location.href=\"register.html\";</script>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (action != null && action.equals("sureOrder")) {
			JavaBean.Cart item = this.getCart(req);
			String customerName = req.getParameter("loginName");
			try {
				if (item != null) {
					try {
						new Cart().add(item);
						req.setAttribute("Carts", this.findByNameCart(customerName));
						req.setAttribute("Total", this.countTotal(customerName));
						req.getRequestDispatcher("sureOrder.jsp").forward(req,res);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (action != null && action.equals("sortByDate")) {
			String sortNo = new String(req.getParameter("sortNo").getBytes(
					"ISO-8859-1"), "UTF-8");
			req.setAttribute("SortByDate", this.sortByDate(sortNo));
			req.getRequestDispatcher("orderList.jsp").forward(req, res);
		}

		if (action != null && action.equals("searchName")) {
			String name = new String(req.getParameter("name").getBytes(
					"ISO-8859-1"), "UTF-8");
			req.setAttribute("Orders", this.findByName(name));
			req.getRequestDispatcher("customerManag.jsp").forward(req, res);
		}

		if (action != null && action.equals("edit")) {
			String id = req.getParameter("orderNo");
			req.setAttribute("Order", this.edit(id));
			req.getRequestDispatcher("orderEdit.jsp").forward(req, res);
		}

		if (action != null && action.equals("del")) {
			String id = req.getParameter("orderNo");
			this.remove(id);
			req.getRequestDispatcher("Order?action=list").forward(req, res);
		}

		if (action != null && action.equals("save")) {
			this.save(this.getOrder(req));
			req.getRequestDispatcher("Order?action=list").forward(req, res);
		}
	}
}
