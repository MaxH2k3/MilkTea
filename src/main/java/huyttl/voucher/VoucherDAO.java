/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.voucher;

import huyttl.user.UserDTO;
import huyttl.util.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author DELL
 */
public class VoucherDAO {

    public int checkVoucher(String idVoucher) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        int result = -1;
        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL Statement String
                String sql = "SELECT Discount "
                        + "FROM VOUCHER "
                        + "WHERE (idVoucher like '" + idVoucher + "') AND (DateEnd >= GETDATE()) AND (AMOUNT > 0)";
                //3. Create Statement to set SQL
                preStm = con.prepareStatement(sql);

                //4. Execute Query
                rs = preStm.executeQuery();
                //5. Process
                if (rs.next()) {
                    result = rs.getInt("Discount");
                }
            } //end if connection is existed
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
        return result;
    }
    
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        VoucherDAO dao = new VoucherDAO();
        System.out.println(dao.checkVoucher("oke123"));
    }
}
