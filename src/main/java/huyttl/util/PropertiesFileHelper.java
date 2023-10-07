/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package huyttl.util;

import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class PropertiesFileHelper {
    public static Properties getProperties(ServletContext context, String fileRelativePath) {
        InputStream input = context.getResourceAsStream(fileRelativePath);
        Properties prop = null;
        try {
            prop = new Properties();
            prop.load(input);
        } catch (IOException e) {
            Logger.getLogger(PropertiesFileHelper.class.getName()).log(Level.SEVERE, null, e);
        }
        return prop;
    }
}
