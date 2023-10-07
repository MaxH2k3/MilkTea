/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.order;

import huyttl.order_details.OrderDetailsDAO;
import huyttl.order_details.OrderDetailsDTO;
import huyttl.product.ProductDTO;
import huyttl.util.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MIMI
 */
public class OrderDAO {

    private final String ORDER_TABLE_NAME = " " + "TBLORDERS" + " ";
    private final String ORDER_DETAILS_TABLE_NAME = " " + "TBLORDERDETAILS" + " ";
    private final String PRODUCT_TABLE_NAME = " " + "TBLPRODUCTS" + " ";

    public boolean add(ArrayList<OrderDetailsDTO> orderDetailsList, int userId, double total) throws Exception {
        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;

        boolean status = false;
        try {
            OrderDAO dao = new OrderDAO();
            con = DBHelper.makeConnection();
            if (con != null) {
                con.setAutoCommit(false);
                //// create a order in DB
                int orderId;
                String sql_1 = "INSERT INTO " + ORDER_TABLE_NAME
                        + "(userId, orderDate, status, total) "
                        + "VALUES(?, getdate(), 0, ?)";

                //prepare sql stm
                preStm = con.prepareStatement(sql_1, PreparedStatement.RETURN_GENERATED_KEYS);

                //set value for ?s
                preStm.setInt(1, userId);
                preStm.setDouble(2, total); // 

                //exc
                preStm.executeUpdate();

                rs = preStm.getGeneratedKeys(); // getId auto increase
                //check rs
                if (rs.next()) {
                    orderId = rs.getInt(1); // success
                } else {
                    con.rollback();
                    return status;
                }

                // create order details of this order
                String sql_2 = "INSERT INTO " + ORDER_DETAILS_TABLE_NAME
                        + "(productId, quantity, price, orderId, paymentId) "
                        + "VALUES(?, ?, ?, ?, 1)";

                preStm = con.prepareStatement(sql_2);

                for (OrderDetailsDTO orderDetails : orderDetailsList) {
                    preStm.setInt(1, orderDetails.getProductId());
                    preStm.setInt(2, orderDetails.getQuantity());
                    preStm.setDouble(3, orderDetails.getPrice());
                    preStm.setInt(4, orderId);

                    if (preStm.executeUpdate() == 0) {
                        con.rollback();
                    }
                }
                con.commit();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (preStm != null) {
                preStm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return true;
    }

    public ArrayList<OrderDTO> getOrdersByUserId(int userId) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        ArrayList<OrderDTO> list = new ArrayList<>();

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "SELECT * FROM \n"
                        + "tblOrders \n"
                        + "WHERE userID = ?";

                stm = con.prepareStatement(sql);

                stm.setInt(1, userId);

                rs = stm.executeQuery();

                while (rs.next()) {
                    //
                    int orderId = rs.getInt("orderID");
                    Timestamp orderDate = rs.getTimestamp("orderDate");
                    double total = rs.getDouble("total");
                    int status = rs.getInt("status");
                    //
                    OrderDTO order = new OrderDTO(orderId, orderDate, total, status);

                    list.add(order);
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

    public ArrayList<OrderDTO> getOrders() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        ArrayList<OrderDTO> list = new ArrayList<>();

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "  SELECT orderID, userName, orderDate, tblOrders.status, total\n"
                        + "  FROM tblOrders JOIN tblUsers \n"
                        + "  ON tblOrders.userID = tblUsers.userID";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();

                while (rs.next()) {
                    int orderId = rs.getInt("orderID");
                    Timestamp orderDate = rs.getTimestamp("orderDate");
                    double total = rs.getDouble("total");
                    String userName = rs.getString("userName");
                    int status = rs.getInt("status");

                    OrderDTO order = new OrderDTO(orderId, orderDate, total, userName, status);
                    list.add(order);
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

    public Boolean updateStatusOrder(int status, int orderId) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "UPDATE [dbo].[tblOrders]\n"
                        + "   SET [status] = ?\n"
                        + " WHERE orderId = ?";

                stm = con.prepareStatement(sql);
                stm.setInt(1, status);
                stm.setInt(2, orderId);

                int effectRow = stm.executeUpdate();

                if (effectRow > 0) {
                    result = true;
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

        return result;
    }

    public Boolean deleteOrder(int userId, int orderId) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        boolean result = false;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                con.setAutoCommit(false);

                String sql_1 = "  DELETE FROM [dbo].[tblOrderDetails]\n"
                        + "      WHERE orderID = ?";

                stm = con.prepareStatement(sql_1);

                stm.setInt(1, orderId);

                if (stm.executeUpdate() > 0) {
                    result = true;
                } else {
                    con.rollback();
                    return result;
                }

                String sql_2 = "DELETE FROM [dbo].[tblOrders]\n"
                        + "      WHERE userID = ? and orderID = ?";

                stm = con.prepareStatement(sql_2);
                stm.setInt(1, userId);
                stm.setInt(2, orderId);

                if (stm.executeUpdate() > 0) {
                    result = true;
                } else {
                    con.rollback();
                    result = false;
                }

                con.commit();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return result;
    }

    public ArrayList<Integer> getOrderWaiting() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Integer> list = new ArrayList<Integer>();

        try {
            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "SELECT COUNT(orderID) FROM tblOrders WHERE status = 0 AND YEAR(orderDate) = YEAR(GETDATE())\n"
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

    public ArrayList<Integer> getOrderAccept() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Integer> list = new ArrayList<Integer>();

        try {
            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "SELECT COUNT(orderID) FROM tblOrders WHERE status = 2 AND YEAR(orderDate) = YEAR(GETDATE())\n"
                        + "GROUP BY MONTH(orderDate)\n"
                        + "SELECT * FROM tblOrders";

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

    public int getTotalPriceThisMonth() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int result = 0;

        try {
            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "SELECT SUM(total) FROM tblOrders WHERE status = 2 "
                        + "AND MONTH(orderDate) = MONTH(GETDATE())";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();

                while (rs.next()) {
                    result = rs.getInt(1);
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

        return result;
    }

    public ArrayList<Integer> getTotalPriceEachMonth() throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<Integer> list = new ArrayList<Integer>();

        try {
            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "SELECT MONTH(orderDate) AS [Month], SUM(total) AS [TOTAL] FROM tblOrders \n"
                        + "WHERE YEAR(orderDate) = YEAR(GETDATE())\n"
                        + "GROUP BY MONTH(orderDate)";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();

                while (rs.next()) {
                    int month = rs.getInt("Month");
                    while(month != list.size() + 1) {
                        list.add(0);
                    }
                    list.add(rs.getInt("TOTAL"));
                }
                while (list.size() != 12) {                    
                    list.add(0);
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
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getTotalPriceEachMonth());
    }
}
