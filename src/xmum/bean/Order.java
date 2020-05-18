package xmum.bean;

import java.util.Date;
import java.util.List;

import xmum.dao.OrderDAO;

public class Order {
	private String orderCode;
	private String address;
	private String post;
	private String receiver;
	private String mobile;
	private Date createDate;
	private Date payDate;
	private Date deliveryDate;
	private Date confirmDate;
	private User user;
	private int id;
	private List<OrderItem> orderItems;
	private float total;
	private int totalNumber;
	private String status;
	
	//use for admin,show the status of order
	public String getStatusDesc(){
		String desc ="unknow";
		switch(status){
			case OrderDAO.waitPay:
				desc="waitPay";
				break;
			case OrderDAO.waitDelivery:
				desc="waitDelivery";
				break;
			case OrderDAO.waitConfirm:
				desc="waitConfirm";
				break;
			case OrderDAO.waitReview:
				desc="waitReview";
				break;
			case OrderDAO.finish:
				desc="finish";
				break;
			case OrderDAO.delete:
				desc="delete";
				break;
			default:
				desc="unknow";
		}
		return desc;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public Date getConfirmDate() {
		return confirmDate;
	}

	public void setConfirmDate(Date confirmDate) {
		this.confirmDate = confirmDate;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	
}