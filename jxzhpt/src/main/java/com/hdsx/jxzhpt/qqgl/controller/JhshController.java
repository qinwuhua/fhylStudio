package com.hdsx.jxzhpt.qqgl.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.xpath.operations.Bool;
import org.codehaus.jackson.annotate.JsonUnwrapped;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Scope("prototype")
@Controller
public class JhshController extends BaseActionSupport implements ModelDriven<Jhsh>{
	//回复数据集合
	private Map<String, Object> result=new HashMap<String, Object>();
	//计划审核对象
	private Jhsh jhsh=new Jhsh();
	@Override
	public Jhsh getModel() {
		return jhsh;
	}
	//分页参数
	private int page = 1;
	private int rows = 10;
	//上传文件对象参数
	private File uploadJhxd;
	private String uploadJhxdFileName;
	//数据访问对象
	@Resource(name="jhshServerImpl")
	private JhshServer jhshServer;
	/**
	 * 查询计划审核列表
	 * @throws Exception 
	 */
	public void queryJhsh() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try {
			jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(),"xzqhdm"));
			if(jhsh.getXmlx()==1){
				listData=jhshServer.queryJhshLmsj(jhsh,page,rows);
				total=jhshServer.queryJhshCountLmsj(jhsh);
			}else if(jhsh.getXmlx()==2){
				listData=jhshServer.queryJhshLmgz(jhsh,page,rows);
				total=jhshServer.queryJhshCountLmgz(jhsh);
			}else if(jhsh.getXmlx()==3){
				listData=jhshServer.queryJhshXj(jhsh,page,rows);
				total=jhshServer.queryJhshCountXj(jhsh);
			}
			result.put("total", total);
			result.put("rows", listData);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 计划下达，补充计划下达信息
	 * @throws Exception
	 */
	public void updateJhshxx() throws Exception{
		boolean b=false;
		try {
			List<Jhsh> list=new ArrayList<Jhsh>();
			if(jhsh.getXmlx()==1){
				list.add(jhsh);
				b=jhshServer.updateJhshxxLmsj(list);
			}
			result.put("result", new Boolean(b));
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 处理行政区划编码为条件语句
	 * @param bh
	 * @param name
	 * @return
	 */
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
	//get set 方法
	public Jhsh getJhsh() {
		return jhsh;
	}
	public void setJhsh(Jhsh jhsh) {
		this.jhsh = jhsh;
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
	public File getUploadJhxd() {
		return uploadJhxd;
	}
	public void setUploadJhxd(File uploadJhxd) {
		this.uploadJhxd = uploadJhxd;
	}
	public String getUploadJhxdFileName() {
		return uploadJhxdFileName;
	}
	public void setUploadJhxdFileName(String uploadJhxdFileName) {
		this.uploadJhxdFileName = uploadJhxdFileName;
	}
}
