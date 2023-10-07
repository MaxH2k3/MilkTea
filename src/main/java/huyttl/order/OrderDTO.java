/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.order;

import huyttl.order_details.OrderDetailsDTO;
import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author MIMI
 */
public class OrderDTO {
    private int orderId;
    private int userId;
    private Timestamp orderDate;
    private double total;
    private String userName;
    private int status;
    
    private ArrayList<OrderDetailsDTO> details;

    public OrderDTO(int orderId, int userId, Timestamp orderDate, double total) {
        this.orderId = orderId;
        this.userId = userId;
        this.orderDate = orderDate;
        this.total = total;
    }

    public OrderDTO(int orderId, Timestamp orderDate, double total, String userName, int status) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.total = total;
        this.userName = userName;
        this.status = status;
    }
    
    public OrderDTO(int orderId, Timestamp orderDate, double total) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.total = total;
    }

    public OrderDTO(int orderId, Timestamp orderDate, double total, int status) {
        this.orderId = orderId;
        this.orderDate = orderDate;
        this.total = total;
        this.status = status;
    }
    
    
    
    public OrderDTO() {
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public ArrayList<OrderDetailsDTO> getDetails() {
        return details;
    }

    public void setDetails(ArrayList<OrderDetailsDTO> details) {
        this.details = details;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }


    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    
    
    
}
