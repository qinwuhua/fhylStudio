package com.hdsx.jxzhpt.utile;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.utile.PropertiesReader;
@Scope("prototype")
@Controller
public class InitServlet extends HttpServlet {
    public static String rootPath;
    public static String sysYear;
	@Override
	public void init() throws ServletException {
		rootPath=getServletContext().getRealPath("/widget/anyChart/dataXml");
		sysYear=PropertiesReader.getInstance().getSysYearUrl();
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -5538944554964040959L;

}
