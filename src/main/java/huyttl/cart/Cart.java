/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.cart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author MIMI
 */
public class Cart {
    private Map<Integer, Integer> items;

    public Map<Integer, Integer> getItems() {
        return items;
    }

    public void setItems(HashMap<Integer, Integer> items) {
        this.items = items;
    }
    
    public void addToCart(int key) {
        if(items == null) {
            items = new HashMap<>();
        }
        int quantity = 1;
        if(items.containsKey(key)) {
            quantity = items.get(key) + 1;
        }
        
        items.put(key, quantity);
    }
    public boolean removeFromCart(int key) {
        if(items == null) {
            return false;
        }
        if(items.containsKey(key)) {
            items.remove(key);
            if(items.isEmpty()) {
                items = null;
            }
            return true;
        }
        return false;
    }
    
    public boolean updateCart(int key, int quantity) {
        if(items == null) {
            return false;
        }
        
        items.put(key, quantity);
        
        return true;
    }

    @Override
    public String toString() {
        return "Cart{" + "items=" + items + '}';
    }
    
    
}
