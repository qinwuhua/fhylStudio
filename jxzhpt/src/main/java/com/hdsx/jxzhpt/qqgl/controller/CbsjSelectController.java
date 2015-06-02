package com.hdsx.jxzhpt.qqgl.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.qqgl.bean.CbsjLmsj;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
@Scope("prototype")
@Controller
public class CbsjSelectController extends BaseActionSupport{
	//回复数据集合
	private Map<String, Object> result=new HashMap<String, Object>();
	//初步设计路面升级对象
	private CbsjLmsj cbsjlmsj;
	//分页参数
	private int page = 1;
	private int rows = 10;
	//数据访问对象
	@Resource(name="cbsjServerImpl")
	private CbsjServer cbsjServer;
	
	public void queryLmsj() throws Exception{
		try {
			cbsjlmsj.setXzqhdm(xzqhBm(cbsjlmsj.getXzqhdm(),"xzqhdm"));
			List<CbsjLmsj> queryCbsjLmsj = cbsjServer.queryCbsjLmsj(cbsjlmsj, page, rows);
			result.put("total", 20);
			result.put("rows", queryCbsjLmsj);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public String xzqhBm(String bh,String name){
		String result=null;
		if(bh!=null){
			if(bh.indexOf(",")==-1){
				int i=0;
				if(bh.matches("^[0-9]*[1-9]00$")){
					i=2;
				}else if(bh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				bh=bh.substring(0,bh.length()-i);
			}
			result= bh.indexOf(",")==-1 ? " l."+name+" like '%"+bh+"%'": "l."+name+" in ("+bh+")";
		}
		return result;
	}

	public CbsjLmsj getCbsjlmsj() {
		return cbsjlmsj;
	}
	public void setCbsjlmsj(CbsjLmsj cbsjlmsj) {
		this.cbsjlmsj = cbsjlmsj;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
}
