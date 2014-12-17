package com.hdsx.jxzhpt.utile;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;


import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

public class AnyChartUtil {
	private static Configuration cfg;
	static
	{
		String templatePath=getTemplatePath();
		//String templatePath="C:\\Program Files\\Apache Software Foundation\\Tomcat 6.0\\webapps\\lndlys\\widget\\anyChart\\dataXml";
		cfg = new Configuration();
		try {
			cfg.setDirectoryForTemplateLoading(new File(templatePath));
			cfg.setObjectWrapper(new DefaultObjectWrapper());
			cfg.setDefaultEncoding("UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static String getAnyChartXml(String fileName,Map<String, Object> parameter)
    {
      return  getAnyChartXml(fileName, parameter, null);
    }
	public static String getAnyChartXml(String fileName,Map<String, Object> parameter,Map<String,String> replaces)
    {
		String xmlStr = null;
		StringWriter out = null;
		try {
		    Template temp = cfg.getTemplate(fileName);
		    Map<String,Object> root = new HashMap<String,Object>();
		    if(parameter!=null)
		    {
		    	root.putAll(parameter);
		    }
		    out=new StringWriter();
			temp.process(root, out);
			out.flush();
			xmlStr=out.toString();
			xmlStr=xmlStr.replaceAll("@","%");
			if(replaces!=null)
			{
               Set<String> keyset=replaces.keySet();
               for (String key : keyset) {
				xmlStr.replace(key,replaces.get(key));
			}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally
		{
		 if(out!=null){try {out.close();} catch (IOException e) {}}
		}
			return xmlStr;
    }
    public static String getTemplatePath()
    {
       String path=InitServlet.rootPath;
      /* String path="";
       path=path.replaceAll("\\\\\\\\","/");
       path=path.replaceAll("%20"," ");*/
       return path;
    }
}
