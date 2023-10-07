/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.listener;

import huyttl.util.PropertiesFileHelper;
import java.util.Properties;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;

/**
 * Web application lifecycle listener.
 *
 * @author DELL
 */
public class MyContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        String siteMapLocation = context.getInitParameter("SITEMAPS_FILE_PATH");
        Properties siteMapProperty = PropertiesFileHelper.getProperties(context, siteMapLocation);
        context.setAttribute("SITE_MAPS", siteMapProperty);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
     
    }
}
