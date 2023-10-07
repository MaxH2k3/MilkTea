/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.order_details;

import huyttl.order.OrderDTO;
import huyttl.product.ProductDTO;
import huyttl.util.DBHelper;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Base64;

/**
 *
 * @author netbeans
 */
public class OrderDetailsDAO {

    private final String ORDER_DETAILS_TABLE_NAME = " " + "TBLORDERDETAILS" + " ";
    private final String PRODUCT_TABLE_NAME = " " + "TBLPRODUCTS" + " ";

    public ArrayList<OrderDetailsDTO> getDetailsByOderId(int orderId) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        ArrayList<OrderDetailsDTO> list = new ArrayList<>();

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT o.orderDetailsID, o.quantity, p.name, p.price, p.image, p.categoryID\n"
                        + "  FROM tblOrderDetails o JOIN tblProducts p\n"
                        + "  ON o.productID = p.productID"
                        + " AND orderID = ?";

                stm = con.prepareStatement(sql);

                stm.setInt(1, orderId);

                rs = stm.executeQuery();

                while (rs.next()) {
                    int orderDetailsId = rs.getInt("orderDetailsID");
                    int quantity = rs.getInt("quantity");
                    String productName = rs.getString("name");
                    String image = Base64.getEncoder().encodeToString(rs.getBytes("image"));
                    int price = rs.getInt("price");
                    int categoryId = rs.getInt("categoryID");

                    OrderDetailsDTO detail = new OrderDetailsDTO(orderDetailsId, quantity, new ProductDTO(productName, image, price, categoryId));
                    list.add(detail);
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

        return list;
    }

    public ArrayList<Integer> getNumProduct() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Integer> list = new ArrayList<Integer>();

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                con.setAutoCommit(false);

                String sql = "SELECT SUM(quantity) FROM tblOrderDetails od JOIN tblOrders o\n"
                        + "ON od.orderID = o.orderID\n"
                        + "WHERE YEAR(orderDate) = YEAR(GETDATE()) AND o.status = 2\n"
                        + "GROUP BY MONTH(orderDate)";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();

                while (rs.next()) {
                    list.add(rs.getInt(1));
                }
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return list;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        OrderDetailsDAO dao = new OrderDetailsDAO();
        System.out.println(dao.getNumProduct());
    }
}
