package xmum.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import xmum.bean.Order;
import xmum.bean.OrderItem;
import xmum.bean.Product;
import xmum.bean.User;
import xmum.util.DatabaseUtil;
 
public class OrderItemDAO {
 
    public int getTotal() {
        int total = 0;
        try (Connection c = DatabaseUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select count(*) from OrderItem";
 
            ResultSet rs = s.executeQuery(sql);
            while (rs.next()) {
                total = rs.getInt(1);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return total;
    }
 
    public void add(OrderItem bean) {



        String sql = "insert into OrderItem values(null,?,?,?,?)";
        try (Connection c = DatabaseUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);) {
 
            ps.setInt(1, bean.getProduct().getId());

            //when user add the item to the cart,
            // the order item is created,but there is no order,set the oid=-1;
            if(null==bean.getOrder())
            	ps.setInt(2, -1);
            else
            	ps.setInt(2, bean.getOrder().getId());  
            
            ps.setInt(3, bean.getUser().getId());
            ps.setInt(4, bean.getNumber());
            ps.execute();
 
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
                bean.setId(id);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
    }
 
    public void update(OrderItem bean) {

        String sql = "update OrderItem set pid= ?, oid=?, uid=?,number=?  where id = ?";
        try (Connection c = DatabaseUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {

            ps.setInt(1, bean.getProduct().getId());

            //when user add the item to the cart,
            // the order item is created,but there is no order,set the oid=-1;
            if(null==bean.getOrder())
            	ps.setInt(2, -1);
            else
            	ps.setInt(2, bean.getOrder().getId());            	
            ps.setInt(3, bean.getUser().getId());
            ps.setInt(4, bean.getNumber());
            

            ps.setInt(5, bean.getId());
            ps.execute();
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
 
    }
 
    public void delete(int id) {
 
        try (Connection c = DatabaseUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "delete from OrderItem where id = " + id;
 
            s.execute(sql);
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
    }
 
    public OrderItem get(int id) {
        OrderItem bean = new OrderItem();
 
        try (Connection c = DatabaseUtil.getConnection(); Statement s = c.createStatement();) {
 
            String sql = "select * from OrderItem where id = " + id;
 
            ResultSet rs = s.executeQuery(sql);
 
            if (rs.next()) {
                int pid = rs.getInt("pid");
                int oid = rs.getInt("oid");
                int uid = rs.getInt("uid");
                int number = rs.getInt("number");
                Product product = new ProductDAO().get(pid);
                User user = new UserDAO().get(uid);
                bean.setProduct(product);
                bean.setUser(user);
                bean.setNumber(number);
                
                if(-1!=oid){
                    Order order= new OrderDAO().get(oid);
                    bean.setOrder(order);               	
                }
                
                bean.setId(id);
            }
 
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return bean;
    }

    public OrderItem getPid(int id) {
        OrderItem bean = new OrderItem();

        try (Connection c = DatabaseUtil.getConnection(); Statement s = c.createStatement();) {

            String sql = "select * from OrderItem where oid = " + id;

            ResultSet rs = s.executeQuery(sql);

            if (rs.next()) {
                int pid = rs.getInt("pid");
                int oid = rs.getInt("oid");
                int uid = rs.getInt("uid");
                int number = rs.getInt("number");
                Product product = new ProductDAO().get(pid);
                User user = new UserDAO().get(uid);
                bean.setProduct(product);
                bean.setUser(user);
                bean.setNumber(number);

                if(-1!=oid){
                    Order order= new OrderDAO().get(oid);
                    bean.setOrder(order);
                }

                bean.setId(id);
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }
        return bean;
    }

    //inquire the item in the cart
    public List<OrderItem> listByUser(int uid) {
        return listByUser(uid, 0, Short.MAX_VALUE);
    }
 
    public List<OrderItem> listByUser(int uid, int start, int count) {
        List<OrderItem> beans = new ArrayList<OrderItem>();
 
        String sql = "select * from OrderItem where uid = ? and oid=-1 order by id desc limit ?,? ";
 
        try (Connection c = DatabaseUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
 
            ps.setInt(1, uid);
            ps.setInt(2, start);
            ps.setInt(3, count);
 
            ResultSet rs = ps.executeQuery();
 
            while (rs.next()) {
                OrderItem bean = new OrderItem();
                int id = rs.getInt(1);

                int pid = rs.getInt("pid");
                int oid = rs.getInt("oid");
                int number = rs.getInt("number");

                Product product = new ProductDAO().get(pid);

                User user = new UserDAO().get(uid);
                bean.setProduct(product);

                bean.setUser(user);
                bean.setNumber(number);
                bean.setId(id);                
                beans.add(bean);
            }
        } catch (SQLException e) {
 
            e.printStackTrace();
        }
        return beans;
    }
    public List<OrderItem> listByOrder(int oid) {
    	return listByOrder(oid, 0, Short.MAX_VALUE);
    }
    
    public List<OrderItem> listByOrder(int oid, int start, int count) {
    	List<OrderItem> beans = new ArrayList<OrderItem>();
    	
    	String sql = "select * from OrderItem where oid = ? order by id desc limit ?,? ";
    	
    	try (Connection c = DatabaseUtil.getConnection(); PreparedStatement ps = c.prepareStatement(sql);) {
    		
    		ps.setInt(1, oid);
    		ps.setInt(2, start);
    		ps.setInt(3, count);
    		
    		ResultSet rs = ps.executeQuery();
    		
    		while (rs.next()) {
    			OrderItem bean = new OrderItem();
    			int id = rs.getInt(1);
    			
    			int pid = rs.getInt("pid");
    			int uid = rs.getInt("uid");
    			int number = rs.getInt("number");
    			
    			
    			Product product = new ProductDAO().get(pid);
    			if(-1!=oid){
    				Order order= new OrderDAO().get(oid);
    				bean.setOrder(order);               	
    			}
    			
    			User user = new UserDAO().get(uid);
    			bean.setProduct(product);
    			
    			bean.setUser(user);
    			bean.setNumber(number);
    			bean.setId(id);                
    			beans.add(bean);
    		}
    	} catch (SQLException e) {
    		
    		e.printStackTrace();
    	}
    	return beans;
    }

	public void fill(List<Order> os) {
		for (Order o : os) {
			List<OrderItem> ois=listByOrder(o.getId());
			float total = 0;
			int totalNumber = 0;
			for (OrderItem oi : ois) {
				 total+=oi.getNumber()*oi.getProduct().getPromotePrice();
				 totalNumber+=oi.getNumber();
			}
			o.setTotal(total);
			o.setOrderItems(ois);
			o.setTotalNumber(totalNumber);
		}
	}
    //fill the order with items and calculate the price of items
	public void fill(Order o) {
		List<OrderItem> ois=listByOrder(o.getId());
		float total = 0;
		for (OrderItem oi : ois) {
			 total+=oi.getNumber()*oi.getProduct().getPromotePrice();
		}
		o.setTotal(total);
		o.setOrderItems(ois);
	}


	public int getSaleCount(int pid) {
		 int total = 0;
	        try (Connection c = DatabaseUtil.getConnection(); Statement s = c.createStatement();) {
	 
	            String sql = "select sum(number) from OrderItem where oid!=-1 and pid = " + pid;
	 
	            ResultSet rs = s.executeQuery(sql);
	            while (rs.next()) {
	                total = rs.getInt(1);
	            }
	        } catch (SQLException e) {
	 
	            e.printStackTrace();
	        }
	        return total;
	}
	
}
