/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.order_details;

import huyttl.product.ProductDTO;

/**
 *
 * @author MIMI
 */
public class OrderDetailsDTO {
    private int orderDetailsId;
    private int productId;
    private int quantity;
    private double price;
    private int orderId;
    private int paymentId;
    private ProductDTO product;

    public OrderDetailsDTO(int orderDetailsId, int productId, int quantity, double price, int orderId, int paymentId) {
        this.orderDetailsId = orderDetailsId;
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.orderId = orderId;
        this.paymentId = paymentId;
    }

    public OrderDetailsDTO(int productId, int quantity, double price, int paymentId) {
        this.productId = productId;
        this.quantity = quantity;
        this.price = price;
        this.paymentId = paymentId;
    }
    
    public OrderDetailsDTO(int orderDetailsId, int quantity, ProductDTO product) {
        this.orderDetailsId = orderDetailsId;
        this.quantity = quantity;
        this.price = price;
        this.product = product;
    }
        
    public OrderDetailsDTO() {
    }

    public int getOrderDetailsId() {
        return orderDetailsId;
    }

    public void setOrderDetailsId(int orderDetailsId) {
        this.orderDetailsId = orderDetailsId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
    }
    
}
