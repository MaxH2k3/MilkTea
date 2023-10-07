/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.util;

/**
 *
 * @author DELL
 */
public class MyAppConstants {
    
    public class LoginFeatures {
        public static final String INVALID_PAGE = "invalid";
        public static final String LOGIN_CONTROLLER = "loginServlet";
        public static final String LOGIN_PAGE = "loginPage";
        public static final String LOGOUT_CONTROLLER = "logoutServlet";
    }
    
    public class RegisterFeature {
        public static final String REGISTER_PAGE = "registerPage";
        public static final String REGISTER_CONTROLLER = "registerServlet";
    }
    
    public class ShopFeature {
        public static final String USER_PAGE = "userHome";
        public static final String HOME_PAGE = "homePage";
        public static final String CONTACT_PAGE = "contactPage";
    }
    
    public class SearchFeature {
        public static final String SEARCH_CONTROLLER = "searchServlet";
    }
    
    public class CRUDFeatureProduct {
        public static final String CREATE_CONTROLLER = "createServlet";
        public static final String UPDATE_CONTROLLER = "updateServlet";
        public static final String DELETE_CONTROLLER = "deleteServlet";
        public static final String CREATE_PAGE = "createPage";
        public static final String UPDATE_PAGE = "updatePage";
    }
    
    public class OrderFeature {
        public static final String VIEW_ORDER_CONTROLLER = "viewOrder";
        public static final String ADD_ORDER_CONTROLLER = "addOrder";
        public static final String VIEW_ORDER_PAGE = "viewPage";
        public static final String HISTORY_ORDER_CONTROLLER = "historyOrder";
        public static final String HISTORY_ORDER_PAGE = "historyOrderPage";
        public static final String CHECKOUT_CONTROLLER = "checkout";
        public static final String REMOVE_ITEMS_CONTROLLER = "removeOrder";
        public static final String UPDATE_ITEMS_CONTROLLER = "updateOrder";
    }
    
    public class AdminFeature {
        public static final String ADMIN_PAGE = "adminHome";
        public static final String VIEW_PRODUCT_DETAILS = "viewProductPage";
        public static final String VIEW_ORDER_DETAILS = "viewOrderDetails";
        public static final String VIEW_ORDER_STATUS = "viewOrderStatus";
        public static final String VIEW_ACCOUNT_DETAILS = "viewUser";
        public static final String SEARCH_ACCOUNT_CONTROLLER = "searchUser";
        public static final String DELETE_ACCOUNT_CONTROLLER = "deleteUser";
        public static final String REVERT_ACCOUNT_CONTROLLER = "revertUser";
    }
}
