package org.adl.util;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;



public class ConfigFile {
	
	private static ConfigFile theConfig = null;

    //private Properties prop = null;
	private ResourceBundle prop = null;

    private ConfigFile() throws Exception {
        try {
            //prop = new Properties();
            //prop.load(new FileInputStream("config.properties"));
            //prop.load(ConfigFile.class.getClassLoader().getSystemResourceAsStream("config.properties"));
            prop = PropertyResourceBundle.getBundle("config",new Locale("", ""));
        } catch (Exception ie) {
            throw ie;
        }
    }
    
   /* private ConfigFile(String fileName) throws Exception {
        try {
            //prop = new Properties();
            //prop.load(new FileInputStream("config.properties"));
            //prop.load(ConfigFile.class.getClassLoader().getSystemResourceAsStream("config.properties"));
            prop = PropertyResourceBundle.getBundle(fileName,new Locale("", ""));
        } catch (Exception ie) {
            throw ie;
        }
    }*/

    private static ConfigFile getInstance() throws Exception {
        if (theConfig == null) {
            theConfig = new ConfigFile();
        }
        return theConfig;
    }

    public static String getString(String ciName) throws Exception {
        return getInstance().prop.getString(ciName);
    }

/*    public static String getString( String fileName,String ciName ) throws Exception {
        return getInstance().prop.getString(ciName);
    }
    */
    
    public static int getInt(String ciName) throws Exception {
        if (getString(ciName) == null) {
            throw new Exception("找不到配置项"+ciName+"。");
        } else {
            return Integer.parseInt(getString(ciName));
        }
    }

    public static Date getDate(String ciName) throws Exception {
        if (getString(ciName) == null) {
            throw new Exception("找不到配置项"+ciName+"。");
        } else {
            return DateFormat.getInstance().parse(getString(ciName));
        }
    }
    
}
