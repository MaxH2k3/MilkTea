/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.user;

import huyttl.util.Notification;
import java.util.ArrayList;

/**
 *
 * @author DELL
 */
public class UserValidator {
    private String name;
    private String phone;
    private String address;
    private String email;
    private String username;
    private String password;
    private String confirmPassword;
    private ArrayList<Notification> listChecked;

    public UserValidator(String name, String phone, String address, String email, String username, String password, String confirmPassword) {
        listChecked = new ArrayList<>();
        listChecked.add(setName(name));
        listChecked.add(setPhone(phone));
        listChecked.add(setAddress(address));
        listChecked.add(setEmail(email));
        listChecked.add(setUsername(username));
        listChecked.add(setPassword(password));
        listChecked.add(setConfirmPassword(confirmPassword));
    }
    
    private Notification setName(String name) {
        this.name = name;
        if(name == null || name.isEmpty()) {
            return new Notification("Name must not be empty!", "name", false);
        }
        return new Notification("", true);
    }
    
    private Notification setPhone(String phone) {
        this.phone = phone;
        if(phone == null || phone.isEmpty()) {
            return new Notification("Phone must not be empty!", "phone", false);
        }
        return new Notification("", true);
    }
    
    private Notification setAddress(String address) {
        this.address = address;
        if(address == null || address.isEmpty()) {
            return new Notification("Address must not be empty!", "address", false);
        }
        return new Notification("", true);
    }
    
    private Notification setEmail(String email) {
        this.email = email;
        if(email == null || email.isEmpty()) {
            return new Notification("Email must not be empty!", "email", false);
        }
        return new Notification("", true);
    }
    
    private Notification setUsername(String username) {
        this.username = username;
        if(username == null || username.isEmpty()) {
            return new Notification("Phone must not be empty!", "username", false);
        }
        return new Notification("", true);
    }
    
    private Notification setPassword(String password) {
        this.password = password;
        if(password == null || password.isEmpty()) {
            return new Notification("Password must not be empty!", "password", false);
        }
        if(password.length() < 3) {
            return new Notification("Password must be more than 3 characters", "password", false);
        }
        String pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).+$";
        if(!password.matches(pattern)) {
            return new Notification("Password must be contains lowcase&uppercase character and number", "password", false);
        }
        return new Notification("", true);
    }
    
    private Notification setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
        if(confirmPassword == null || confirmPassword.isEmpty()) {
            return new Notification("confirmPassword must not be empty!", "confirmPassword", false);
        }
        if(!confirmPassword.equals(this.password)) {
            return new Notification("ConfirmPassword must be the same password!", "confirmPassword", false);
        }
        return new Notification("", true);
    }
    
    public boolean hasError() {
        for (Notification notification : listChecked) {
            if (!notification.isResult()) {
                return true;
            }
        }
        return false;
    }
    
    public ArrayList<Notification> getListChecked() {
        return listChecked;
    }
}
