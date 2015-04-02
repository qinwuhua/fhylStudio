package com.hdsx.jxzhpt.gcbb.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.gcbb.server.SjbbServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
public class SjbbController extends BaseActionSupport implements ModelDriven<SjbbMessage>{

	/**
	 * 
	 */
	private static final long serialVersionUID = -7044079854768005348L;
	private SjbbMessage sjbb=new SjbbMessage();
	@Override
	public SjbbMessage getModel() {
		return sjbb;
	}
	@Resource(name="sjbbServerImpl")
	private SjbbServer sjbbServer;
	private String flag;
	
	public void getLwjgjshzb(){
		try {
			List<SjbbMessage> list = sjbbServer.getLwjgjsgzb(sjbb);
			if("flag".equals(flag)){
				String tableName="（一）收费公路项目一览表";
				String excelHtml="";
				
			}else{
				JsonUtils.write(list, getresponse().getWriter());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getGzgcjz(){
		try {
			List<SjbbMessage> list = sjbbServer.getGzgcjz(sjbb);
			if("flag".equals(flag)){
				String tableName="";
				String excelHtml="";
				
			}else{
				JsonUtils.write(list, getresponse().getWriter());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getGdzctzjs(){
		try {
			List<SjbbMessage> list = sjbbServer.getGdzctzjs(sjbb);
			if("flag".equals(flag)){
				String tableName="";
				String excelHtml="";
				
			}else{
				JsonUtils.write(list, getresponse().getWriter());
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
}
