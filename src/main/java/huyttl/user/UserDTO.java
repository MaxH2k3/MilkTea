/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.user;

import java.io.Serializable;

/**
 *
 * @author MIMI
 */
public class UserDTO implements Serializable {
    private int userId;
    private String userName;
    private String password;
    private String name;
    private String phone;
    private String address;
    private String email;
    private int roleId;
    private boolean status;
    private boolean gender;

    public UserDTO(int userId, String userName, String password, String name, String phone, String address, String email, int roleId) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.roleId = roleId;
    }

    public UserDTO(int userId, String userName, String password, String name, String phone, String address, String email, int roleId, boolean status) {
        this.userId = userId;
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.roleId = roleId;
        this.status = status;
    }

    public UserDTO(int userId, String userName, String name, int roleId) {
        this.userId = userId;
        this.userName = userName;
        this.name = name;
        this.roleId = roleId;
    }

    public UserDTO(String userName, String password, String name, String phone, String address, String email, int roleId, boolean gender) {
        this.userName = userName;
        this.password = password;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.roleId = roleId;
        this.gender = gender;
    }

    public UserDTO(int userId, String name, String phone, String address, String email, int roleId, boolean status) {
        this.userId = userId;
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.email = email;
        this.roleId = roleId;
        this.status = status;
    }
    
    /**
     * @return the userId
     */
    public int getUserId() {
        return userId;
    }

    /**
     * @param userId the userId to set
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the roleId
     */
    public int getRoleId() {
        return roleId;
    }

    /**
     * @param roleId the roleId to set
     */
    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    /**
     * @return the status
     */
    public boolean isStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(boolean status) {
        this.status = status;
    }

    /**
     * @return the gender
     */
    public boolean isGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(boolean gender) {
        this.gender = gender;
    }


    

    
}
