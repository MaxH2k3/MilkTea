/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.product;

import huyttl.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;

/**
 *
 * @author MIMI
 */
public class ProductDAO implements Serializable {

    private final String TABLE_NAME = " " + "TBLPRODUCTS" + " ";

    public ArrayList<ProductDTO> searchProduct(String searchValue, String minPrice, String maxPrice, String sort, String[] categories) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        ArrayList<ProductDTO> products = new ArrayList<>();

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT productId, name, price, description, image, "
                        + "status, categoryId, dateCreate, DATEDIFF(month, dateCreate, GETDATE()) AS numDateCreate "
                        + "FROM TBLPRODUCTS "
                        + "WHERE (NAME LIKE ? OR description LIKE ? ) "
                        + "AND price between ? and ? ";

                if (categories != null) {
                    for (int i = 0; i < categories.length; i++) {
                        if (categories[0].equals("")) {
                            break;
                        }
                        if (i == 0) {
                            sql += "AND (categoryID = " + categories[i] + " ";
                        } else {
                            sql += "OR categoryID = " + categories[i] + " ";
                        }
                        if(i == categories.length - 1) {
                            sql += ")";
                        }
                    }
                    
                }

                sql = this.getTypeOfSorting(sql, sort);
                System.out.println(sql);
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + searchValue + "%");
                stm.setString(2, "%" + searchValue + "%");
                stm.setString(3, minPrice);
                stm.setString(4, maxPrice);

                rs = stm.executeQuery();

                while (rs.next()) {
                    ProductDTO product = this.collectDataFromResultSet(rs);

                    products.add(product);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return products;
    }

    public ProductDTO getProductById(int productId) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        ProductDTO product = new ProductDTO();

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT productId, name, price, description, image, "
                        + "status, categoryId, dateCreate, DATEDIFF(month, dateCreate, GETDATE()) AS numDateCreate "
                        + "FROM " + TABLE_NAME
                        + "WHERE PRODUCTID = ?";

                stm = con.prepareStatement(sql);

                stm.setLong(1, productId);

                rs = stm.executeQuery();

                if (rs.next()) {
                    product = this.collectDataFromResultSet(rs);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return product;
    }

    public boolean delete(String productId) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement preStm = null;
        int rs = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE " + TABLE_NAME
                        + "SET STATUS = 0 "
                        + "WHERE PRODUCTID = ? ";

                preStm = con.prepareStatement(sql);

                preStm.setString(1, productId);

                rs = preStm.executeUpdate();
                if (rs != 0) {
                    return true;
                }
            }
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean store(ProductDTO product, byte[] image) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement preStm = null;
        int rs;
        
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO " + TABLE_NAME
                        + "(name, price, description, image, status, categoryId, dateCreate) "
                        + "VALUES(?, ?, ?, CONVERT(varbinary(max), ?, 65001), ?, ?, GETDATE())";

                String name = product.getName();
                double price = product.getPrice();
                String desc = product.getDescription();
                boolean status = product.isStatus();
                long categoryId = product.getCategoryId();

                //prepare sql stm
                preStm = con.prepareStatement(sql);

                //set value for ?s
                preStm.setString(1, name);
                preStm.setDouble(2, price);
                preStm.setString(3, desc);
                preStm.setBytes(4, image);
                preStm.setBoolean(5, status);
                preStm.setLong(6, categoryId);
                

                //exc
                rs = preStm.executeUpdate();

                //check rs
                if (rs != 0) {
                    return true;
                }
            }
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    public boolean update(ProductDTO product, byte[] image) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement preStm = null;
        int rs = 0;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE " + TABLE_NAME
                        + "SET name = ?, description = ?, price = ?, image = CONVERT(varbinary(max), ?, 65001), status = ?, categoryId = ? "
                        + "WHERE productId = ?";

                //prepare sql stm
                preStm = con.prepareStatement(sql);

                //set value for ?s
                preStm.setString(1, product.getName());
                preStm.setString(2, product.getDescription());
                preStm.setDouble(3, product.getPrice());
                preStm.setBytes(4, image);
                preStm.setBoolean(5, product.isStatus());
                preStm.setLong(6, product.getCategoryId());
                preStm.setLong(7, product.getProductId());

                //exc
                rs = preStm.executeUpdate();

                //check rs
                if (rs != 0) {
                    return true;
                }
            }
        } finally {
            if (preStm != null) {
                preStm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }

    private String getTypeOfSorting(String sql, String sort) {
        if (sort.equals("1")) {
            return sql + " ORDER BY name";
        } else if (sort.equals("2")) {
            return sql + " ORDER BY name DESC";
        } else if (sort.equals("3")) {
            return sql + " ORDER BY price DESC";
        } else if (sort.equals("4")) {
            return sql + " ORDER BY price";
        }
        return sql;

    }

    private ProductDTO collectDataFromResultSet(ResultSet rs) throws SQLException {
        int productId = rs.getInt("productId");
        String name = rs.getString("name");
        int price = rs.getInt("price");
        String description = rs.getString("description");
        String image = Base64.getEncoder().encodeToString(rs.getBytes("image"));
        boolean status = rs.getBoolean("status");
        int categoryId = rs.getInt("categoryId");
        String dateCreate = rs.getString("dateCreate");
        int numDateCreate = rs.getInt("numDateCreate");

        ProductDTO product = new ProductDTO(productId, name, price, description, image, status, categoryId, dateCreate, numDateCreate);
        return product;
    }


}
