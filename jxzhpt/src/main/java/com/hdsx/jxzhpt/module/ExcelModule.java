package com.hdsx.jxzhpt.module;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import com.hdsx.webutil.struts.BaseActionSupport;
/**
 * @author 
 * excel模板导出
 */
@Controller
public class ExcelModule extends BaseActionSupport{
	
	private String moduleName;
	public void getModule(){
		String filename="";
		try {
			filename = new String(moduleName.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e2) {}
		if(filename==null || "".equals(filename)){
			return;
		}
		try {
			HttpServletResponse response = getresponse();
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(filename.getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = new BufferedOutputStream(response.getOutputStream());
			InputStream fi = ExcelModule.class.getClassLoader().getResourceAsStream("/excelModule/"+filename+".xls");
			byte[] buffer = new byte[fi.available()];
            fi.read(buffer);
            fi.close();
            out.write(buffer);
            out.flush();
            out.close();
		} catch (Exception e) {
			HttpServletResponse response = getresponse();
			try {
				response.getWriter().write("该名称模板不存在！");
			} catch (IOException e1) {
			}
		}
	}
	public String getModuleName() {
		return moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
}
