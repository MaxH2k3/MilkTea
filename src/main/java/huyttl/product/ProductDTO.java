/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.product;

import java.io.InputStream;
import java.io.Serializable;

/**
 *
 * @author MIMI
 */
public class ProductDTO implements Serializable {

    private int productId;
    private String name;
    private int price;
    private int quantity;
    private String description;
    private String image;
    private boolean status;
    private int categoryId;
    private String dateCreate;
    private int numDateCreate;

    public ProductDTO(int productId, String name, int price, String description, String image, boolean status, int categoryId) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
        this.status = status;
        this.categoryId = categoryId;
    }

    public ProductDTO(String name, int price, String description, String image, boolean status, int categoryId) {
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
        this.status = status;
        this.categoryId = categoryId;
    }
    
    public ProductDTO(int productId, String name, int price, String description, String image, boolean status, int categoryId, String dateCreate, int numDateCreate) {
        this.productId = productId;
        this.name = name;
        this.price = price;
        this.description = description;
        this.image = image;
        this.status = status;
        this.categoryId = categoryId;
        this.dateCreate = dateCreate;
        this.numDateCreate = numDateCreate;
    }
    
    public ProductDTO(String name, String image, int price, int categoryId) {
        this.name = name;
        this.image = image;
        this.price = price;
        this.categoryId = categoryId;
    }

    public ProductDTO() {
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Object getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getNumDateCreate() {
        return numDateCreate;
    }

    public void setNumDateCreate(int numDateCreate) {
        this.numDateCreate = numDateCreate;
    }
    
    
    
}
