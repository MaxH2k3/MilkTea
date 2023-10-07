/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.user;

import huyttl.util.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author MIMI
 */
public class UserDAO implements Serializable {

    private final String TABLE_NAME = " " + "TBLUSERS" + " ";

    private UserDTO loginedUser;

    public UserDTO getLoginedUser() {
        return loginedUser;
    }

    public boolean checkLogin(String userName, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL Statement String
                String sql = "SELECT USERID, NAME, ROLEID "
                        + "FROM " + TABLE_NAME
                        + "WHERE USERNAME = ? AND PASSWORD = ?";
                //3. Create Statement to set SQL
                preStm = con.prepareStatement(sql);

                preStm.setString(1, userName);
                preStm.setString(2, password);

                //4. Execute Query
                rs = preStm.executeQuery();

                //5. Process
                if (rs.next()) {
                    int userId = rs.getInt("userID");
                    String name = rs.getString("name");
                    int roleId = rs.getInt("roleID");

                    loginedUser = new UserDTO(userId, userName, name, roleId);

                    return true;
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
        return false;
    }

    public boolean createAccount(UserDTO user) throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;

        boolean result = false;

        try {

            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "INSERT INTO [dbo].[tblUsers]\n"
                        + "           ([name]\n"
                        + "           ,[phone]\n"
                        + "           ,[address]\n"
                        + "           ,[email]\n"
                        + "           ,[roleID]\n"
                        + "           ,[password]\n"
                        + "           ,[userName]\n"
                        + "            ,[gender]\n"
                        + "            ,[status])\n"
                        + "   VALUES\n"
                        + "   (?, ?, ?, ?, ?, ?, ?, ?, 1)";

                preStm = con.prepareStatement(sql);
                preStm.setString(1, user.getName());
                preStm.setString(2, user.getPhone());
                preStm.setString(3, user.getAddress());
                preStm.setString(4, user.getEmail());
                preStm.setInt(5, user.getRoleId());
                preStm.setString(6, user.getPassword());
                preStm.setString(7, user.getUserName());
                preStm.setBoolean(8, user.isGender());

                int effectRow = preStm.executeUpdate();

                if (effectRow > 0) {
                    result = true;
                }
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

        return result;
    }

    public boolean deleteAccount(int userId) throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement preStm = null;
        boolean result = false;

        try {

            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "UPDATE [dbo].[tblUsers]\n"
                        + "   SET [status] = 0\n"
                        + " WHERE userID = ?";

                preStm = con.prepareStatement(sql);
                preStm.setInt(1, userId);

                int effectRow = preStm.executeUpdate();

                if (effectRow > 0) {
                    result = true;
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

        return result;
    }

    public boolean revertAccount(int userId) throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement preStm = null;
        boolean result = false;

        try {

            con = DBHelper.makeConnection();
            if (con != null) {

                String sql = "UPDATE [dbo].[tblUsers]\n"
                        + "   SET [status] = 1\n"
                        + " WHERE userID = ?";

                preStm = con.prepareStatement(sql);
                preStm.setInt(1, userId);

                int effectRow = preStm.executeUpdate();

                if (effectRow > 0) {
                    result = true;
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

        return result;
    }

    public ArrayList<UserDTO> getAllUser(int id)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;

        ArrayList<UserDTO> list = new ArrayList<UserDTO>();

        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL Statement String
                String sql = "SELECT * "
                        + "FROM " + TABLE_NAME;

                if (id > 0) {
                    sql += "WHERE userID = " + id;

                    preStm = con.prepareStatement(sql);
                } else {
                    preStm = con.prepareStatement(sql);
                }
                preStm = con.prepareStatement(sql);
                //3. Create Statement to set SQL

                //4. Execute Query
                rs = preStm.executeQuery();

                //5. Process
                while (rs.next()) {
                    UserDTO user;

                    int userId = rs.getInt("userID");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    int roleId = rs.getInt("roleID");
                    boolean status = rs.getBoolean("status");

                    user = new UserDTO(userId, name, phone, address, email, roleId, status);

                    list.add(user);
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
        return list;
    }

    public ArrayList<UserDTO> searchUser(String searchValue)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;

        ArrayList<UserDTO> list = new ArrayList<UserDTO>();

        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL Statement String
                String sql = "SELECT * FROM tblUsers\n"
                        + "WHERE name like ?\n"
                        + "OR phone like ?\n"
                        + "OR address like ?\n"
                        + "OR email like ?";

                preStm = con.prepareStatement(sql);
                //3. Create Statement to set SQL
                preStm.setString(1, "%" + searchValue + "%");
                preStm.setString(2, "%" + searchValue + "%");
                preStm.setString(3, "%" + searchValue + "%");
                preStm.setString(4, "%" + searchValue + "%");

                //4. Execute Query
                rs = preStm.executeQuery();

                //5. Process
                while (rs.next()) {
                    UserDTO user;

                    int userId = rs.getInt("userID");
                    String name = rs.getString("name");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    String email = rs.getString("email");
                    int roleId = rs.getInt("roleID");
                    boolean status = rs.getBoolean("status");

                    user = new UserDTO(userId, name, phone, address, email, roleId, status);

                    list.add(user);
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
        return list;
    }

    public ArrayList<Integer> getNumAccount() throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement preStm = null;
        ResultSet rs = null;
        ArrayList<Integer> list = new ArrayList<Integer>();

        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL Statement String
                String sql = "SELECT COUNT(*) FROM tblUsers GROUP BY roleID";
                //3. Create Statement to set SQL
                preStm = con.prepareStatement(sql);

                //4. Execute Query
                rs = preStm.executeQuery();

                //5. Process
                while (rs.next()) {
                    list.add(rs.getInt(1));
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
        return list;
    }

}
