package com.hdsx.jxzhpt.utile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Properties;

public class PropertiesReader {
	private String pfile="upload.properties";
	private File m_file = null;
	private String param1;
	private String param2;
	private Properties prop=null;
	private static PropertiesReader pr=new PropertiesReader();
	private PropertiesReader() {
		 prop = new Properties();
        InputStream in = Object.class.getResourceAsStream("/upload.properties");
        try {
        	prop.load(new FileInputStream(getFile()));
           
        } catch (IOException e) {
            e.printStackTrace();
        } catch (URISyntaxException e) {
			e.printStackTrace();
		}
    }
	
	public String getFileUrl(){
		
        param1 = prop.getProperty("uploadFilePath").trim();
        return param1;
	}
	
	public String getSysYearUrl(){
        param2 = prop.getProperty("sysZrsh").trim();
        return param2;
	}
    private File getFile() throws URISyntaxException {
		URI fileUri = this.getClass().getClassLoader().getResource(pfile).toURI();
		m_file = new File(fileUri);
		return m_file;
	}
    public synchronized static PropertiesReader getInstance() {
		return pr;
	}
   

    
}
