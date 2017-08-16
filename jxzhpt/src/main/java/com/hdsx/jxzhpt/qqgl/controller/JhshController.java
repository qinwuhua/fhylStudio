package com.hdsx.jxzhpt.qqgl.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.impl.CbsjServerImpl;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Scope("prototype")
@Controller
public class JhshController extends BaseActionSupport implements ModelDriven<Jhsh>{
	//回复数据集合
	private Map<String, Object> result=new HashMap<String, Object>();
	//计划审核对象
	private Jhsh jhsh=new Jhsh();
	private Lx lx;
	@Override
	public Jhsh getModel() {
		return jhsh;
	}
	//分页参数
	private int page = 1;
	private int rows = 10;
	//上传文件对象参数
	private File uploadJhxd;
	private File uploadSgtxd;
	private String uploadJhxdFileName;
	private String uploadSgtxdFileName;
	private File fileupload;
	private String fileuploadFileName;
	//数据访问对象
	@Resource(name="jhshServerImpl")
	private JhshServer jhshServer;
	//其他参数
	private String jdbs;//阶段标示，用于表明在计划的哪一阶段
	private String filed;//自定义查询的字段
	private String filedName;//字段名称
	private String json_data;
	private String jhxdwh;
	private String bztbsj;
	
	public String getBztbsj() {
		return bztbsj;
	}

	public void setBztbsj(String bztbsj) {
		this.bztbsj = bztbsj;
	}

	public String getJhxdwh() {
		return jhxdwh;
	}

	public void setJhxdwh(String jhxdwh) {
		this.jhxdwh = jhxdwh;
	}

	public String getJson_data() {
		return json_data;
	}

	public void setJson_data(String json_data) {
		this.json_data = json_data;
	}

	public File getUploadSgtxd() {
		return uploadSgtxd;
	}

	public void setUploadSgtxd(File uploadSgtxd) {
		this.uploadSgtxd = uploadSgtxd;
	}

	public String getUploadSgtxdFileName() {
		return uploadSgtxdFileName;
	}

	public void setUploadSgtxdFileName(String uploadSgtxdFileName) {
		this.uploadSgtxdFileName = uploadSgtxdFileName;
	}

	/**
	 * 查询计划审核列表
	 * @throws Exception 
	 */
	public void queryJhsh() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try {
			String xmbm = jhsh.getXmbm();
			if(xmbm.indexOf(",")>-1){
				String[] xmnfArray = xmbm.split(",");
				for (int i = 0; i < xmnfArray.length; i++) {
					if(i==xmnfArray.length-1){
						xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
					}else if(i==0){
						xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
					}else{
						xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
					}
				}
			}else{
				xmbm = "j.xmbm like '" + xmbm + "%' ";
			}
			ylxbhHandle();
			jhsh.setXmbm(xmbm);
			jsdjHandle();
			jhsh.setXzqhdm(getcxtj("xzqhdm",jhsh.getXzqhdm()));
			if(jhsh.getXmlx()==1){
				listData=jhshServer.queryJhshLmsj(jhsh,jhsh.getPage(),jhsh.getRows());
				total=jhshServer.queryJhshCountLmsj(jhsh);
			}else if(jhsh.getXmlx()==2){
				listData=jhshServer.queryJhshLmgz(jhsh,jhsh.getPage(),jhsh.getRows());
				total=jhshServer.queryJhshCountLmgz(jhsh);
			}else if(jhsh.getXmlx()==3){
				listData=jhshServer.queryJhshXj(jhsh,jhsh.getPage(),jhsh.getRows());
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
	public String getcxtj(String id,String param){
		String tj="";
		if(param!=null&&!"".equals(param)){
			String[] s=param.split(",");
			for (int i = 0; i < s.length; i++) {
				if(i==0)
				tj+=" ("+id+" like '%"+s[i]+"%'";
				else
				tj+=" or "+id+" like '%"+s[i]+"%'";
			}
			tj+=")";
		}
		return tj;
	}
	public void queryGsdgz() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try {
			xdwhHandle();
			jsjsdjHandle();
			jsdjHandle1();
			xzdjHandle();
			tsdqHandle();
			jsxzHandle();
			zjlyHandle();
			xdztHandle();
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			if("1".equals(jhsh.getScxdnf())){
				jhsh.setScxdnf("fun_scxdnf(xmbm)");
			}else{
				jhsh.setScxdnf("substr(xmbm,0,4)");
			}
			
			listData=jhshServer.queryGsdgz(jhsh,jhsh.getPage(),jhsh.getRows());
			total=jhshServer.queryGsdgzCount(jhsh);
			result.put("total", total);
			result.put("rows", listData);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	
	public void queryGsdgz_qx() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try {
			xdwhHandle();
			jsjsdjHandle();
			jsdjHandle1();
			xzdjHandle();
			tsdqHandle();
			jsxzHandle();
			zjlyHandle();
			xdztHandle();
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJ(jhsh.getGhxlxbm(), "ghlxbm"));
			
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			listData=jhshServer.queryGsdgz_qx(jhsh,jhsh.getPage(),jhsh.getRows());
			total=jhshServer.queryGsdgz_qxCount(jhsh);
			result.put("total", total);
			result.put("rows", listData);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	private void jsdjHandle_(String string) {
		if(string.equals("jsjsdj")){
			if(jhsh.getJsjsdj()!=null && !jhsh.getJsjsdj().equals("")){
				String jsjsdj=jhsh.getJsjsdj();
				if(jsjsdj.indexOf(",")>-1){
					String [] split=jsjsdj.split(",");
					for(int i=0;i<split.length;i++){
						if(i==0){
							jsjsdj=" (  lxg.jsjsdj like '"+split[i]+"%'   ";
						}else if(i==split.length-1){
							jsjsdj+=" or   lxg.jsjsdj like '"+split[i]+"%') ";
						}else{
							jsjsdj+=" or  lxg.jsjsdj like '"+split[i]+"%' ";
						}
						if(split.length==1){
							jsjsdj+=")";
						}
					}
				}else{
					jsjsdj="   lxg.jsjsdj  like '"+jsjsdj+"'  ";
				}
				jhsh.setJsjsdj(jsjsdj);
				System.out.println("++++++++++++++"+jsjsdj);
			}

			}
		if(string.equals("xjsdj")){
			if(jhsh.getXjsdj()!=null&&!jhsh.getXjsdj().equals("")){
				String xjsdj=jhsh.getXjsdj();
				if(xjsdj.indexOf(",")>-1){
					String [] split=xjsdj.split(",");
					for(int i=0;i<split.length;i++){
						if(i==0){
							xjsdj=" (  lxg.xjsdj like '"+split[i]+"%'   ";
						}else if(i==split.length-1){
							xjsdj+=" or lxg.xjsdj like '"+split[i]+"%') ";
						}else{
							xjsdj+=" or lxg.xjsdj like '"+split[i]+"%' ";
						}
						if(split.length==1){
							xjsdj+=")";
						}
					}
					
				}else{
					xjsdj="  lxg.xjsdj like '"+xjsdj+"%'";
				}
				jhsh.setXjsdj(xjsdj);
				System.out.println("_-----------"+xjsdj);
			}
		}
		
	}

	public void queryJhshLjgsdgz(){
		Map<String, String> result = new HashMap<String, String>();
		try {
			xdwhHandle();
			jsjsdjHandle();
			jsdjHandle1();
			xzdjHandle();
			tsdqHandle();
			jsxzHandle();
			zjlyHandle();
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			if("1".equals(jhsh.getScxdnf())){
				jhsh.setScxdnf("fun_scxdnf(xmbm)");
			}else{
				jhsh.setScxdnf("substr(xmbm,0,4)");
			}
			result = jhshServer.queryJhshLjgsdgz(jhsh);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryJhshLjgsdgz_qx(){
		Map<String, String> result = new HashMap<String, String>();
		try {
			xdwhHandle();
			jsjsdjHandle();
			jsdjHandle1();
			xzdjHandle();
			tsdqHandle();
			jsxzHandle();
			zjlyHandle();
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			result = jhshServer.queryJhshLjgsdgz_qx(jhsh);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryJhsh1() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try {
			String xmbm = jhsh.getXmbm();
			if(xmbm.indexOf(",")>-1){
				String[] xmnfArray = xmbm.split(",");
				for (int i = 0; i < xmnfArray.length; i++) {
					if(i==xmnfArray.length-1){
						xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
					}else if(i==0){
						xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
					}else{
						xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
					}
				}
			}else{
				xmbm = "j.xmbm like '" + xmbm + "%' ";
			}
			ylxbhHandle();
			jhsh.setXmbm(xmbm);
			jsdjHandle();
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			if(jhsh.getXmlx()==1){
				listData=jhshServer.queryJhshLmsj1(jhsh,jhsh.getPage(),jhsh.getRows());
				total=jhshServer.queryJhshCountLmsj1(jhsh);
			}else if(jhsh.getXmlx()==2){
				listData=jhshServer.queryJhshLmgz1(jhsh,jhsh.getPage(),jhsh.getRows());
				total=jhshServer.queryJhshCountLmgz1(jhsh);
			}else if(jhsh.getXmlx()==3){
				listData=jhshServer.queryJhshXj1(jhsh,jhsh.getPage(),jhsh.getRows());
				total=jhshServer.queryJhshCountXj1(jhsh);
			}
			result.put("total", total);
			result.put("rows", listData);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void queryJhshLj(){
		Map<String, String> result = new HashMap<String, String>();
		try {
			if("1".equals(jhsh.getScxdnf())){
				jhsh.setScxdnf("fun_scxdnf(j.xmbm)");
			}else{
				jhsh.setScxdnf("substr(j.xmbm,0,4)");
			}
			if(jhsh.getXmlx()==1){
				String xmbm = jhsh.getXmbm();
				if(xmbm.indexOf(",")>-1){
					String[] xmnfArray = xmbm.split(",");
					for (int i = 0; i < xmnfArray.length; i++) {
						if(i==xmnfArray.length-1){
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
						}else if(i==0){
							xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
						}else{
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
						}
					}
				}else{
					xmbm = "j.xmbm like '" + xmbm + "%' ";
				}
				jhsh.setXmbm(xmbm);
				jhsh.setXzqhdm(getcxtj("xzqhdm",jhsh.getXzqhdm()));
				result = jhshServer.queryJhshLjLmsj(jhsh);
			}else if(jhsh.getXmlx()==2){
				String xmbm = jhsh.getXmbm();
				if(xmbm.indexOf(",")>-1){
					String[] xmnfArray = xmbm.split(",");
					for (int i = 0; i < xmnfArray.length; i++) {
						if(i==xmnfArray.length-1){
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
						}else if(i==0){
							xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
						}else{
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
						}
					}
				}else{
					xmbm = "j.xmbm like '" + xmbm + "%' ";
				}
				jhsh.setXmbm(xmbm);
				jhsh.setXzqhdm(getcxtj("xzqhdm",jhsh.getXzqhdm()));
				result = jhshServer.queryJhshLjLmgz(jhsh);
			}else if(jhsh.getXmlx()==3){
				String xmbm = jhsh.getXmbm();
				if(xmbm.indexOf(",")>-1){
					String[] xmnfArray = xmbm.split(",");
					for (int i = 0; i < xmnfArray.length; i++) {
						if(i==xmnfArray.length-1){
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
						}else if(i==0){
							xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
						}else{
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
						}
					}
				}else{
					xmbm = "j.xmbm like '" + xmbm + "%' ";
				}
				jhsh.setXmbm(xmbm);
				jhsh.setXzqhdm(getcxtj("xzqhdm",jhsh.getXzqhdm()));
				result = jhshServer.queryJhshLjXj(jhsh);
			}else if(jhsh.getXmlx()==4){
				jsdjHandle1();
				xzdjHandle();
				tsdqHandle1();
				jsxzHandle2();
				zjlyHandle();
				xdwhHandle();
				xdztHandle();
				jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
				jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
				
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				result = jhshServer.queryJhshLjYhdzx(jhsh);
			}else if(jhsh.getXmlx()==5){
				jsdjHandle1();
				xzdjHandle();
				tsdqHandle1();
				xdwhHandle();
				xdztHandle();
				jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
				jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
				
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				result = jhshServer.queryJhshLjSh(jhsh);
			}else if(jhsh.getXmlx()==6){
				String xmbm = jhsh.getXmbm();
				if(xmbm.indexOf(",")>-1){
					String[] xmnfArray = xmbm.split(",");
					for (int i = 0; i < xmnfArray.length; i++) {
						if(i==xmnfArray.length-1){
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
						}else if(i==0){
							xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
						}else{
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
						}
					}
				}else{
					xmbm = "j.xmbm like '" + xmbm + "%' ";
				}
				jhsh.setXmbm(xmbm);
				ylxbhHandle();
				jsdjHandle();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				result = jhshServer.queryJhshLjYhzx(jhsh);
			}
			
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryJhshLj_qx(){
		Map<String, String> result = new HashMap<String, String>();
		try {
			if(jhsh.getXmlx()==4){
				jsdjHandle1();
				xzdjHandle();
				tsdqHandle1();
				jsxzHandle();
				zjlyHandle();
				xdwhHandle();
				xdztHandle();
				jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
				jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
				
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				result = jhshServer.queryJhshLjYhdzx_qx(jhsh);
			}else if(jhsh.getXmlx()==5){
				jsdjHandle1();
				xzdjHandle();
				tsdqHandle1();
				xdwhHandle();
				xdztHandle();
				jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
				jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
				
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				result = jhshServer.queryJhshLjSh_qx(jhsh);
			}else if(jhsh.getXmlx()==6){
				String xmbm = jhsh.getXmbm();
				if(xmbm.indexOf(",")>-1){
					String[] xmnfArray = xmbm.split(",");
					for (int i = 0; i < xmnfArray.length; i++) {
						if(i==xmnfArray.length-1){
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
						}else if(i==0){
							xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
						}else{
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
						}
					}
				}else{
					xmbm = "j.xmbm like '" + xmbm + "%' ";
				}
				jhsh.setXmbm(xmbm);
				ylxbhHandle();
				jsdjHandle();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				result = jhshServer.queryJhshLjYhzx(jhsh);
			}
			
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryJhshLj1(){
		System.out.println(jhsh.getXmlx());
		Map<String, String> result = new HashMap<String, String>();
		try {
			String xmbm = jhsh.getXmbm();
			if(xmbm.indexOf(",")>-1){
				String[] xmnfArray = xmbm.split(",");
				for (int i = 0; i < xmnfArray.length; i++) {
					if(i==xmnfArray.length-1){
						xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
					}else if(i==0){
						xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
					}else{
						xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
					}
				}
			}else{
				xmbm = "j.xmbm like '" + xmbm + "%' ";
			}
			jhsh.setXmbm(xmbm);
			ylxbhHandle();
			jsdjHandle();
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			if(jhsh.getXmlx()==1){
				result = jhshServer.queryJhshLjLmsj1(jhsh);
			}else if(jhsh.getXmlx()==2){
				result = jhshServer.queryJhshLjLmgz1(jhsh);
			}else if(jhsh.getXmlx()==3){
				result = jhshServer.queryJhshLjXj1(jhsh);
			}else if(jhsh.getXmlx()==4){
				jhsh.setJsdj(jhsh.getJsdj().replaceAll("xjsdj", "jsdj"));
				result = jhshServer.queryJhshLjYhdzx1(jhsh);
			}else if(jhsh.getXmlx()==5){
				jhsh.setJsdj(jhsh.getJsdj().replaceAll("xjsdj", "jsdj"));
				result = jhshServer.queryJhshLjSh1(jhsh);
			}else if(jhsh.getXmlx()==6){
				result = jhshServer.queryJhshLjYhzx(jhsh);
			}
			
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * 查询计划审核列表 养护和水毁
	 * @throws Exception
	 */
	public void queryJhsh2() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try{
			int s = jhsh.getXmlx();//谁写的？有嘛用？
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			if("1".equals(jhsh.getScxdnf())){
				jhsh.setScxdnf("fun_scxdnf(j.xmbm)");
			}else{
				jhsh.setScxdnf("substr(j.xmbm,0,4)");
			}
			if(jhsh.getXmlx()==4){
				xdwhHandle();
				jsdjHandle1();
				xzdjHandle();
				tsdqHandle1();
				jsxzHandle2();
				zjlyHandle();
				xdztHandle();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				//jhsh.setPage(page);
				//jhsh.setRows(rows);
				listData=jhshServer.queryJhshYhdzx(jhsh);
				total=jhshServer.queryJhshYhdzxCount(jhsh);
			}else if(jhsh.getXmlx()==5){
				jsdjHandle1();
				xzdjHandle();
				tsdqHandle1();
				xdwhHandle();
				xdztHandle();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				//jhsh.setPage(page);
				//jhsh.setRows(rows);
				listData=jhshServer.queryJhshSh(jhsh);
				total=jhshServer.queryJhshShCount(jhsh);
			}else if (jhsh.getXmlx()==6) {
				String xmbm = jhsh.getXmbm();
				if(xmbm.indexOf(",")>-1){
					String[] xmnfArray = xmbm.split(",");
					for (int i = 0; i < xmnfArray.length; i++) {
						if(i==xmnfArray.length-1){
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
						}else if(i==0){
							xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
						}else{
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
						}
					}
				}else{
					xmbm = "j.xmbm like '" + xmbm + "%' ";
				}
				jhsh.setXmbm(xmbm);
				jsdjHandle();
				ylxbhHandle();
				jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(), "xzqhdm"));
				listData=jhshServer.queryJhshYhzx(jhsh,jhsh.getPage(),jhsh.getRows());
				total=jhshServer.queryJhshYhzxCount(jhsh);
			}
			result.put("rows", listData);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 查询计划审核列表 养护和水毁
	 * @throws Exception
	 */
	public void queryJhsh2_qx() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try{
			int s = jhsh.getXmlx();//谁写的？有嘛用？
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			if(jhsh.getXmlx()==4){
				xdwhHandle();
				jsdjHandle1();
				xzdjHandle();
				tsdqHandle1();
				jsxzHandle();
				zjlyHandle();
				xdztHandle();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				//jhsh.setPage(page);
				//jhsh.setRows(rows);
				listData=jhshServer.queryJhshYhdzx_qx(jhsh);
				total=jhshServer.queryJhshYhdzx_qxCount(jhsh);
			}else if(jhsh.getXmlx()==5){
				jsdjHandle1();
				xzdjHandle();
				tsdqHandle1();
				xdwhHandle();
				xdztHandle();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				//jhsh.setPage(page);
				//jhsh.setRows(rows);
				listData=jhshServer.queryJhshSh_qx(jhsh);
				total=jhshServer.queryJhshSh_qxCount(jhsh);
			}else if (jhsh.getXmlx()==6) {
				String xmbm = jhsh.getXmbm();
				if(xmbm.indexOf(",")>-1){
					String[] xmnfArray = xmbm.split(",");
					for (int i = 0; i < xmnfArray.length; i++) {
						if(i==xmnfArray.length-1){
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
						}else if(i==0){
							xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
						}else{
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
						}
					}
				}else{
					xmbm = "j.xmbm like '" + xmbm + "%' ";
				}
				jhsh.setXmbm(xmbm);
				jsdjHandle();
				ylxbhHandle();
				jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(), "xzqhdm"));
				listData=jhshServer.queryJhshYhzx(jhsh,jhsh.getPage(),jhsh.getRows());
				total=jhshServer.queryJhshYhzxCount(jhsh);
			}
			result.put("rows", listData);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	public void queryJhsh3() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try{
			String xmbm = jhsh.getXmbm();
			if(xmbm.indexOf(",")>-1){
				String[] xmnfArray = xmbm.split(",");
				for (int i = 0; i < xmnfArray.length; i++) {
					if(i==xmnfArray.length-1){
						xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
					}else if(i==0){
						xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
					}else{
						xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
					}
				}
			}else{
				xmbm = "j.xmbm like '" + xmbm + "%' ";
			}
			jhsh.setXmbm(xmbm);
			jsdjHandle();
			ylxbhHandle();
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(), "xzqhdm"));
			if(jhsh.getXmlx()==4){
				listData=jhshServer.queryJhshYhdzx1(jhsh,jhsh.getPage(),jhsh.getRows());
				total=jhshServer.queryJhshYhdzxCount1(jhsh);
			}else if(jhsh.getXmlx()==5){
				listData=jhshServer.queryJhshSh1(jhsh,jhsh.getPage(),jhsh.getRows());
				total=jhshServer.queryJhshShCount1(jhsh);
			}else if (jhsh.getXmlx()==6) {
				listData=jhshServer.queryJhshYhzx(jhsh,jhsh.getPage(),jhsh.getRows());
				total=jhshServer.queryJhshYhzxCount(jhsh);
			}
			result.put("rows", listData);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	private void ylxbhHandle() {
		String ylxbh = jhsh.getYlxbh()==null ? "" : jhsh.getYlxbh();
		if(ylxbh!=null && !ylxbh.equals("")){
			if(ylxbh.indexOf(",")>-1){
				String[] split = ylxbh.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						ylxbh = "(lxbm like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						ylxbh += " or lxbm like '%"+split[i]+"%')";
					}else{
						ylxbh += " or lxbm like '%"+split[i]+"%'";
					}
				}
			}else{
				ylxbh = " lxbm like '%"+ylxbh+"%'";
			}
			jhsh.setYlxbh(ylxbh);
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
			list.add(jhsh);
			//准备路线桩号信息
			Lx lx=new Lx();
			lx.setQdzh(jhsh.getQdzh());
			lx.setZdzh(jhsh.getZdzh());
			lx.setXmid(jhsh.getXmbm());
			lx.setSffirst("1");
			lx.setJdbs(jdbs);

			if(jhsh.getXmlx()==1){
				b=jhshServer.updateJhshxxLmsj(list);
			}else if(jhsh.getXmlx()==2){
				b=jhshServer.updateJhshxxLmgz(list);
			}else if(jhsh.getXmlx()==3){
				b=jhshServer.updateJhshxxXj(list);
			}
			/*错误if(b){
				jhshServer.updateLx(lx);
			}*/
			result.put("result", new Boolean(b));
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 养护大中修和水毁的计划下达
	 * @throws Exception
	 */
	public void updateJhshxx2(){
		System.out.println(jhsh.getXmlx());
		try{
			boolean b=true;
			//准备路线桩号信息
			Lx lx=new Lx();
			lx.setQdzh(jhsh.getQdzh());
			lx.setZdzh(jhsh.getZdzh());
			lx.setQdmc(jhsh.getQdmc());
			lx.setZdmc(jhsh.getZdmc());
			lx.setXmid(jhsh.getXmbm());
			lx.setYilc(jhsh.getYilc());
			lx.setErlc(jhsh.getErlc());
			lx.setSanlc(jhsh.getSanlc());
			lx.setSilc(jhsh.getSilc());
			lx.setDwlc(jhsh.getDwlc());
			lx.setWllc(jhsh.getWllc());
			lx.setSffirst("1");
			lx.setJdbs(jdbs);
			
			if(jhsh.getXmlx()==4){
				b = jhshServer.updateJhshxxYhdzx(jhsh);
			}else if(jhsh.getXmlx()==5){
				b = jhshServer.updateJhshxxSh(jhsh);
			}
			if(b){
				//jhshServer.updateLx(lx);
			}
			
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 养护中心的计划下达
	 * @throws Exception
	 */
	public void updateJhshYhzx() throws Exception{
		try{
			boolean b=true;
			b = jhshServer.updateJhshYhzx(jhsh);
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	/**
	 * 上传计划下达文件
	 * @throws Exception
	 */
	@SuppressWarnings("resource")
	public void uploadJhsh(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			String fileurl="E:\\江西综合平台上传文件\\jhxdwj\\";
			File file =new File(fileurl);
			if(uploadJhxd!=null){
				String fid=UUID.randomUUID().toString();
				Plan_upload uploads =new Plan_upload(fid,uploadJhxdFileName, "计划下达文件", jhsh.getXmbm(), 
						"E:\\江西综合平台上传文件/jhxdwj/"+uploadJhxdFileName, jhsh.getXdwh());
				CbsjServer cbsjServer =new CbsjServerImpl();
				uploads.setFid(fid);
				Plan_upload result = cbsjServer.queryFileByWh(uploads);
				if(result==null && cbsjServer.insertFile(uploads) && cbsjServer.insertFileJl(uploads)){
					uploadFile(file,uploadJhxdFileName);
					response.getWriter().print(uploadJhxdFileName+"上传成功！");
				}else{
					uploads.setFid(result.getId());
					cbsjServer.insertFileJl(uploads);
					response.getWriter().print(uploadJhxdFileName+"上传成功！");
				}
			}else{
				System.out.println("已存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.getWriter().print(uploadJhxdFileName+"上传失败！");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
	private void uploadFile(File file,String fileName) throws FileNotFoundException,
			IOException {
		if(!file.exists()){
			file.mkdirs();
		}
		InputStream is = new FileInputStream(uploadJhxd); 
		File saveFile =new File(file, fileName);
		OutputStream os = new FileOutputStream(saveFile);
		//设置缓存  
		byte[] buffer = new byte[1024]; 
		int length = 0;
		while((length= is.read(buffer))>0){
			os.write(buffer,0,length);
		}
		is.close();
		os.flush();
		os.close();
	}
	private void uploadFile(File file,String fileName,File f) throws FileNotFoundException,
			IOException {
		if(!file.exists()){
			file.mkdirs();
		}
		InputStream is = new FileInputStream(f); 
		File saveFile =new File(file, fileName);
		OutputStream os = new FileOutputStream(saveFile);
		//设置缓存  
		byte[] buffer = new byte[1024]; 
		int length = 0;
		while((length= is.read(buffer))>0){
			os.write(buffer,0,length);
		}
		is.close();
		os.flush();
		os.close();
	}
	//
	public void batchUploadJhxd() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean b = false;
		try {
			String fileurl="E:\\江西综合平台上传文件\\jhxdwj\\";
			File file =new File(fileurl);
			if(uploadJhxd!=null){
				CbsjServer cbsjServer = new CbsjServerImpl();
				//List<Plan_upload> queryJhXm = cbsjServer.queryJhXm(jhsh.getXdwh());
				//if(queryJhXm.size()>0){
					//for (Plan_upload itemp : queryJhXm){
						String fid=UUID.randomUUID().toString();
						Plan_upload uploads =new Plan_upload(fid,uploadJhxdFileName, "计划下达文件", "计划下达文件", 
								"E:\\江西综合平台上传文件/jhxdwj/"+uploadJhxdFileName, jhsh.getXdwh());
						uploads.setFid(fid);
						Plan_upload result = cbsjServer.queryFileByWh(uploads);
						if(result==null && cbsjServer.insertFile(uploads)){
							uploadFile(file,uploadJhxdFileName);
						}

						b = true;
					//}
				//}else{
					//response.getWriter().print("没有文号为【"+jhsh.getXdwh()+"】的项目");
				//}
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.getWriter().print(uploadJhxdFileName+"上传失败！");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}finally{
			if(b){
				response.getWriter().print(uploadJhxdFileName+"上传成功！");
			}else {
				response.getWriter().print(uploadJhxdFileName+"上传失败！");
			}
		}
	}
	
	//
	public void batchUploadJhwj() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean b = false;
		try {
			if(jhsh.getXmlx()==1){
				String fileurl="E:\\江西综合平台上传文件\\jhqxwj\\";
				File file =new File(fileurl);
				if(uploadJhxd!=null){
					CbsjServer cbsjServer = new CbsjServerImpl();
					String fid=UUID.randomUUID().toString();
					Plan_upload uploads =new Plan_upload(fid,uploadJhxdFileName, "计划取消文件", "计划取消文件", 
							"E:\\江西综合平台上传文件/jhqxwj/"+uploadJhxdFileName, jhsh.getXdwh());
					uploads.setFid(fid);
					Plan_upload result = cbsjServer.queryFileByWh(uploads);
					if(result==null && cbsjServer.insertFile(uploads)){
						uploadFile(file,uploadJhxdFileName,uploadJhxd);
					}

					b = true;
				}
			}else{
				
				String fileurl="E:\\江西综合平台上传文件\\sgtqxwj\\";
				File file =new File(fileurl);
				if(uploadSgtxd!=null){
					CbsjServer cbsjServer = new CbsjServerImpl();
					String fid=UUID.randomUUID().toString();
					Plan_upload uploads =new Plan_upload(fid,uploadSgtxdFileName, "施工图取消文件", "施工图取消文件", 
							"E:\\江西综合平台上传文件/sgtqxwj/"+uploadSgtxdFileName, jhsh.getXdwh());
					uploads.setFid(fid);
					Plan_upload result = cbsjServer.queryFileByWh(uploads);
					if(result==null && cbsjServer.insertFile(uploads)){
						uploadFile(file,uploadSgtxdFileName,uploadSgtxd);
					}

					b = true;
				
			}
			
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				if(jhsh.getXmlx()==1){
					response.getWriter().print(uploadJhxdFileName+"上传失败！");	
				}else{
					response.getWriter().print(uploadSgtxdFileName+"上传失败！");
				}
				
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}finally{
			if(b){
				if(jhsh.getXmlx()==1){
					response.getWriter().print(uploadJhxdFileName+"上传成功！");	
				}else{
					response.getWriter().print(uploadSgtxdFileName+"上传成功！");
				}
			}else {
				if(jhsh.getXmlx()==1){
					response.getWriter().print(uploadJhxdFileName+"上传失败！");	
				}else{
					response.getWriter().print(uploadSgtxdFileName+"上传失败！");
				}
			}
		}
	}
	
	public void batchUploadJhsh() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		boolean b = false;
		try {
			String fileurl="E:\\江西综合平台上传文件\\jhxdwj\\";
			File file =new File(fileurl);
			if(uploadJhxd!=null){
				CbsjServer cbsjServer = new CbsjServerImpl();
				List<Plan_upload> queryJhXm = cbsjServer.queryJhXm(jhsh.getXdwh());
				if(queryJhXm.size()>0){
					for (Plan_upload itemp : queryJhXm){
						String fid=UUID.randomUUID().toString();
						Plan_upload uploads =new Plan_upload(fid,uploadJhxdFileName, "计划下达文件", itemp.getParentid(), 
								"E:\\江西综合平台上传文件/jhxdwj/"+uploadJhxdFileName, jhsh.getXdwh());
						uploads.setFid(fid);
						Plan_upload result = cbsjServer.queryFileByWh(uploads);
						if(result==null && cbsjServer.insertFile(uploads) && cbsjServer.insertFileJl(uploads)){
							uploadFile(file,uploadJhxdFileName);
						}else{
							uploads.setFid(result.getId());
							cbsjServer.insertFileJl(uploads);
						}
						b = true;
					}
				}else{
					response.getWriter().print("没有文号为【"+jhsh.getXdwh()+"】的项目");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.getWriter().print(uploadJhxdFileName+"上传失败！");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}finally{
			if(b){
				response.getWriter().print(uploadJhxdFileName+"上传成功！");
			}else {
				response.getWriter().print(uploadJhxdFileName+"上传失败！");
			}
		}
	}
	/**
	 * 根据项目编码查询计划审核信息
	 * @throws Exception
	 */
	public void queryJhshxxByXmbm2() throws Exception{
		try{
			Jhsh obj=null;
			if(jhsh.getXmlx()==4){
				obj = jhshServer.queryJhshxxYhdzxByXmbm(jhsh);
			}else if(jhsh.getXmlx()==5){
				obj = jhshServer.queryJhshxxShByXmbm(jhsh);
			}else if(jhsh.getXmlx()==6){
				obj = jhshServer.queryJhshxxYhzxByXmbm(jhsh);
			}
			JsonUtils.write(obj, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据路线编码和起止点桩号，查询技术等级以及里程
	 * @throws Exception 
	 */
	public void queryJsdjAndLcByStartAndEnd() throws Exception{
		try{
			Lx result = jhshServer.queryJsdjAndLcByStartAndEnd(lx);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	public void queryylmlx() throws Exception{
		try{
			String s = jhshServer.queryylmlx(lx);
			jhsh.setYlmlx(s);
			JsonUtils.write(jhsh, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码查询立项审核信息
	 * @throws Exception
	 */
	public void queryLxshByXmbm() throws Exception{
		try {
			Lxsh obj=null;
			if(jhsh.getXmlx()==1)
				obj=jhshServer.queryLxshLmsjByXmbm(jhsh.getXmbm());
			else if(jhsh.getXmlx()==2)
				obj=jhshServer.queryLxshLmgzByXmbm(jhsh.getXmbm());
			else if(jhsh.getXmlx()==3)
				obj=jhshServer.queryLxshXjByXmbm(jhsh.getXmbm());
			JsonUtils.write(obj, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码查询立项审核信息
	 * @throws Exception
	 */
	public void queryLxshqxByXmbm() throws Exception{
		try {
			Lxsh obj=null;
			if(jhsh.getXmlx()==1)
				obj=jhshServer.queryLxshLmsjqxByXmbm(jhsh.getXmbm());
			else if(jhsh.getXmlx()==2)
				obj=jhshServer.queryLxshLmgzqxByXmbm(jhsh.getXmbm());
			else if(jhsh.getXmlx()==3)
				obj=jhshServer.queryLxshXjqxByXmbm(jhsh.getXmbm());
			JsonUtils.write(obj, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	/**
	 * 根据项目编码查询计划审核信息
	 * @throws Exception
	 */
	public void queryJhshxxByXmbm() throws Exception{
		try {
			Jhsh obj=new Jhsh();
			if(jhsh.getXmlx()==1){
				obj=jhshServer.queryJhshxxLmsjByXmbm(jhsh.getXmbm());
			}else if(jhsh.getXmlx()==2){
				obj=jhshServer.queryJhshxxLmgzByXmbm(jhsh.getXmbm());
			}else if(jhsh.getXmlx()==3){
				obj=jhshServer.queryJhshxxXjByXmbm(jhsh.getXmbm());
			}
			JsonUtils.write(obj, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void queryJhshxxqxByXmbm() throws Exception{
		try {
			Jhsh obj=new Jhsh();
			if(jhsh.getXmlx()==1){
				obj=jhshServer.queryJhshxxLmsjqxByXmbm(jhsh);
			}else if(jhsh.getXmlx()==2){
				obj=jhshServer.queryJhshxxLmgzqxByXmbm(jhsh);
			}else if(jhsh.getXmlx()==3){
				obj=jhshServer.queryJhshxxXjqxByXmbm(jhsh);
			}else if(jhsh.getXmlx()==4){
				obj = jhshServer.queryJhshxxYhdzxqxByXmbm(jhsh);
			}else if(jhsh.getXmlx()==5){
				obj = jhshServer.queryJhshxxShqxByXmbm(jhsh);
			}
			JsonUtils.write(obj, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	/**
	 * 导出计划审核信息
	 */
	public void exportJhshxx(){
		//设置表头
		ExcelTitleCell [] title=null;
		if(jhsh.getXmlx()!=2)
		title=new ExcelTitleCell[16];
		else
			title=new ExcelTitleCell[15];
		title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
		title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
		title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
		title[3]=new ExcelTitleCell("起点桩号",false, new ExcelCoordinate(0, (short)3), null,20);
		title[4]=new ExcelTitleCell("讫点桩号",false, new ExcelCoordinate(0, (short)4), null,20);
		title[5]=new ExcelTitleCell("开工时间",false, new ExcelCoordinate(0, (short)5), null,20);
		title[6]=new ExcelTitleCell("完工时间",false, new ExcelCoordinate(0, (short)6), null,20);
		title[7]=new ExcelTitleCell("工期（月）",false, new ExcelCoordinate(0, (short)7), null,20);
		title[8]=new ExcelTitleCell("工可批复文号",false, new ExcelCoordinate(0, (short)8), null,20);
		title[9]=new ExcelTitleCell("设计批复文号",true, new ExcelCoordinate(0, (short)9), null,20);
		title[10]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)10), null,20);
		title[11]=new ExcelTitleCell("计划下达时间",false, new ExcelCoordinate(0, (short)11), null,20);
		title[12]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)12), null,20);
		title[13]=new ExcelTitleCell("部补助资金",false, new ExcelCoordinate(0, (short)13), null,20);
		title[14]=new ExcelTitleCell("省补助资金",false, new ExcelCoordinate(0, (short)14), null,20);
		if(jhsh.getXmlx()!=2)
		title[15]=new ExcelTitleCell("行政等级",false, new ExcelCoordinate(0, (short)15), null,20);
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "qdzh");//起点桩号
		attribute.put("4", "zdzh");//止点桩号
		attribute.put("5", "kgsj");//开工时间
		attribute.put("6", "wgsj");//完工时间
		attribute.put("7", "gq");//工期（月）
		attribute.put("8", "gkpfwh");//工可批复文号
		attribute.put("9", "sjpfwh");//设计批复文号
		attribute.put("10", "xdwh");//计划下达文号
		attribute.put("11", "xdsj");//计划下达时间
		attribute.put("12", "pfztz");//批复总投资
		attribute.put("13", "bbzzj");//部补助资金
		attribute.put("14", "sbzzj");//省补助资金
		String xmbm = jhsh.getXmbm();
		if(xmbm.indexOf(",")>-1){
			String[] xmnfArray = xmbm.split(",");
			for (int i = 0; i < xmnfArray.length; i++) {
				if(i==xmnfArray.length-1){
					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
				}else if(i==0){
					xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
				}else{
					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
				}
			}
		}else{
			xmbm = "j.xmbm like '" + xmbm + "%' ";
		}
		jhsh.setXmbm(xmbm);
		jsdjHandle();
		ylxbhHandle();
		jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
		jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
		
		jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
		List<Object> excelData=new ArrayList<Object>();
		String titleName="";
		String fileName="";
		if(jhsh.getXmlx()==1){
			excelData.addAll(jhshServer.queryJhshLmsj(jhsh, 0, 0));
			titleName="改建工程项目";
			fileName="改建工程项目-计划审核";
		}
		else if(jhsh.getXmlx()==2){
			excelData.addAll(jhshServer.queryJhshLmgz(jhsh, 0, 0));
			titleName="路面改造工程项目";
			fileName="路面改造工程项目-计划审核";
		}
		else if(jhsh.getXmlx()==3){
			excelData.addAll(jhshServer.queryJhshXj(jhsh, 0, 0));
			titleName="新建工程项目";
			fileName="新建工程项目-计划审核";
		}
		ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, fileName, getresponse());
	}
	
	public void exportJhshxxgsd(){
		//设置表头
				ExcelTitleCell [] title=null;
				title=new ExcelTitleCell[24];
				title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
				title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
				title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
				title[3]=new ExcelTitleCell("原路线编码",false, new ExcelCoordinate(0, (short)3), null,20);
				title[4]=new ExcelTitleCell("原路线名称",false, new ExcelCoordinate(0, (short)4), null,20);
				title[5]=new ExcelTitleCell("原起点桩号",false, new ExcelCoordinate(0, (short)5), null,20);
				title[6]=new ExcelTitleCell("原止点桩号",false, new ExcelCoordinate(0, (short)6), null,20);
				title[7]=new ExcelTitleCell("规划路线编码",false, new ExcelCoordinate(0, (short)7), null,20);
				title[8]=new ExcelTitleCell("规划路线名称",false, new ExcelCoordinate(0, (short)8), null,20);
				title[9]=new ExcelTitleCell("规划起点桩号",false, new ExcelCoordinate(0, (short)9), null,20);
				title[10]=new ExcelTitleCell("规划止点桩号",false, new ExcelCoordinate(0, (short)10), null,20);
				title[11]=new ExcelTitleCell("共线路线编码",false, new ExcelCoordinate(0, (short)11), null,20);
				title[12]=new ExcelTitleCell("共线起点桩号",false, new ExcelCoordinate(0, (short)12), null,20);
				title[13]=new ExcelTitleCell("共线止点桩号",false, new ExcelCoordinate(0, (short)13), null,20);
				
				title[14]=new ExcelTitleCell("开工时间",false, new ExcelCoordinate(0, (short)14), null,20);
				title[15]=new ExcelTitleCell("完工时间",false, new ExcelCoordinate(0, (short)15), null,20);
				title[16]=new ExcelTitleCell("工期（月）",false, new ExcelCoordinate(0, (short)16), null,20);
				title[17]=new ExcelTitleCell("工可批复文号",false, new ExcelCoordinate(0, (short)17), null,20);
				title[18]=new ExcelTitleCell("设计批复文号",true, new ExcelCoordinate(0, (short)18), null,20);
				title[19]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)19), null,20);
				title[20]=new ExcelTitleCell("计划下达时间",false, new ExcelCoordinate(0, (short)20), null,20);
				title[21]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)21), null,20);
				title[22]=new ExcelTitleCell("部补助资金",false, new ExcelCoordinate(0, (short)22), null,20);
				title[23]=new ExcelTitleCell("省补助资金",false, new ExcelCoordinate(0, (short)23), null,20);
				//设置列与字段对应
				Map<String, String> attribute=new HashMap<String, String>();
				attribute.put("0", "xmmc");//项目名称
				attribute.put("1", "xmbm");//项目编码
				attribute.put("2", "xzqh");//行政区划
				attribute.put("3", "lxbm");//起点桩号
				attribute.put("4", "lxmc");//起点桩号
				attribute.put("5", "qdzh");//起点桩号
				attribute.put("6", "zdzh");//止点桩号
				attribute.put("7", "ghlxbm");//起点桩号
				attribute.put("8", "ghlxmc");//起点桩号
				attribute.put("9", "ghqdzh");//起点桩号
				attribute.put("10", "ghzdzh");//止点桩号
				attribute.put("11", "gxlxbm");//起点桩号
				attribute.put("12", "gxqdzh");//起点桩号
				attribute.put("13", "gxzdzh");//止点桩号
				attribute.put("14", "kgsj");//开工时间
				attribute.put("15", "wgsj");//完工时间
				attribute.put("16", "gq");//工期（月）
				attribute.put("17", "gkpfwh");//工可批复文号
				attribute.put("18", "sjpfwh");//设计批复文号
				attribute.put("19", "xdwh");//计划下达文号
				attribute.put("20", "xdsj");//计划下达时间
				attribute.put("21", "pfztz");//批复总投资
				attribute.put("22", "bbzzj");//部补助资金
				attribute.put("23", "sbzzj");//省补助资金
				String xmbm = jhsh.getXmbm();
				if(!xmbm.equals("")&&xmbm!=null){
					if(xmbm.indexOf(",")>-1){
						String[] xmnfArray = xmbm.split(",");
						for (int i = 0; i < xmnfArray.length; i++) {
							if(i==xmnfArray.length-1){
								xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
							}else if(i==0){
								xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
							}else{
								xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
							}
						}
					}else{
						xmbm = "j.xmbm like '" + xmbm + "%' ";
					}
				}
				
				jhsh.setXmbm(xmbm);
				jsdjHandle();
				jsjsdjHandle();
				ylxbhHandle();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
				jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
				
				List<Object> excelData=new ArrayList<Object>();
				if(jhsh.getXmlx1()!=null)
					if(jhsh.getXmlx1().length()>0){
						String[] tsdqs=jhsh.getXmlx1().split(",");
						String tsdq="";
						for (int i = 0; i < tsdqs.length; i++) {
							if("全部".equals(tsdqs[i])){
								tsdq="";
								break;
							}
							if(i==0)
								tsdq+=" and (j.xmlx1 like '%"+tsdqs[i]+"%'";
							else
								tsdq+=" or j.xmlx1 like '%"+tsdqs[i]+"%'";
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						jhsh.setXmlx1(tsdq);
					}
				String titleName="";
				String fileName="";
				excelData.addAll(jhshServer.queryGsdgz_dc(jhsh, 0, 0));
				titleName="国省道改造";
				fileName="计划下达表格（2015-44号）";
				ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
				ExcelExportUtil.excelWrite(excel, fileName, getresponse());
	}
	
	
	
	public void exportJhshYhdzx(){
		//设置表头、列与字段对应
		String fileTitle="<title=项目名称,fieid=xmmc>,<title=项目编码,fieid=xmbm>,<title=行政区号,fieid=xzqh>,<title=开工时间,fieid=kgsj>," +
				"<title=完工时间,fieid=wgsj>,<title=工期（月）,fieid=gq>,<title=下达文号,fieid=xdwh>,<title=下达时间,fieid=xdsj>," +
				"<title=总投资,fieid=ztz>,<title=省以上补助资金,fieid=sysbbzj>,<title=以确定部车购税,fieid=yqdbcgs>,<title=原路线编码,fieid=ylxbh>," +
				"<title=起点名称,fieid=qdmc>,<title=止点名称,fieid=zdmc>,<title=起点桩号,fieid=qdzh>,<title=止点桩号,fieid=zdzh>," +
				"<title=规划路线编码,fieid=ghlxbm>,<title=规划路线名称,fieid=ghlxmc>,<title=规划起点桩号,fieid=ghqdzh>,<title=规划止点桩号,fieid=ghzdzh>,<title=共线路线编码,fieid=gxlxbm>,<title=共线起点桩号,fieid=gxqdzh>,<title=共线止点桩号,fieid=gxzdzh>,"
				+"<title=里程,fieid=lc>,<title=面层路面类型,fieid=mclmlx>,<title=面层材料类型,fieid=mclx>,<title=面层数量,fieid=mcsl>," +
				"<title=面层金额,fieid=mcje>,<title=基层材料类型,fieid=jclx>,<title=基层数量,fieid=jcsl>,<title=基层金额,fieid=jcje>," +
				"<title=下封层数量,fieid=xfcsl>,<title=下封层金额,fieid=xfcje>,<title=标线数量,fieid=bxsl>,<title=标线金额,fieid=bxje>," +
				"<title=灌封长度,fieid=gfcd>,<title=灌封金额,fieid=gfje>,<title=老路处理,fieid=llcl>,";
//		String xmbm = jhsh.getXmbm();
//		if(xmbm.indexOf(",")>-1){
//			String[] xmnfArray = xmbm.split(",");
//			for (int i = 0; i < xmnfArray.length; i++) {
//				if(i==xmnfArray.length-1){
//					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
//				}else if(i==0){
//					xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
//				}else{
//					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
//				}
//			}
//		}else{
//			xmbm = "j.xmbm like '" + xmbm + "%' ";
//		}
//		jhsh.setXmbm(xmbm);
//		jsdjHandle();
//		ylxbhHandle();
		jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
		List<Object> excelData=new ArrayList<Object>();
		String fileName="";
		if(jhsh.getXmlx()==4){
			jsdjHandle1();
			xzdjHandle();
			tsdqHandle();
			jsxzHandle();
			zjlyHandle();
			jhsh.setPage(0);
			jhsh.setRows(0);
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			excelData.addAll(jhshServer.queryJhshYhdzx_dc(jhsh));
			fileName="计划下达表格（2015-49号）";
		}
		ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,getresponse());
	}
	
	public void exportJhshYhzx(){
		//设置表头、列与字段对应
		String fileTitle="<title=项目编码,fieid=xmbm>,<title=项目名称,fieid=xmmc>,<title=行政区划,fieid=xzqh>,<title=管养单位,fieid=gydw>,<title=原道班名称,fieid=ydbmc>,<title=所在路线桩号,fieid=lxzh>,<title=计划开工时间,fieid=jhkgsj>,<title=计划完工时间,fieid=jhwgsj>";
		String xmbm = jhsh.getXmbm();
		if(xmbm.indexOf(",")>-1){
			String[] xmnfArray = xmbm.split(",");
			for (int i = 0; i < xmnfArray.length; i++) {
				if(i==xmnfArray.length-1){
					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
				}else if(i==0){
					xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
				}else{
					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
				}
			}
		}else{
			xmbm = "j.xmbm like '" + xmbm + "%' ";
		}
		jhsh.setXmbm(xmbm);
		jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
		List<Object> excelData=new ArrayList<Object>();
		String fileName="";
		if(jhsh.getXmlx()==6){
			excelData.addAll(jhshServer.queryJhshYhzx(jhsh, 0, 0));
			fileName="养护中心项目-计划审核";
		}
		ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,getresponse());
	}
	
	/**
	 * 导入养护大中修计划审核信息
	 */
	@SuppressWarnings("unchecked")
	public void importExcelJhxdYhdzx(){
		String str ="xmmc,xmbm,xzqh,kgsj,wgsj,gq,xdwh,xdsj,ztz,sysbbzj,yqdbcgs,ylxbh,qdmc,zdmc,qdzh,zdzh,lc,mclmlx,mclx,mcsl,mcje,jclx,jcsl,jcje,xfcsl,xfcje,bxsl,bxje,gfcd,gfje,llcl";
		try {
			List<Jhsh> readerExcel = ExcelImportUtil.readExcel(str, 0, Jhsh.class,fileupload);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Jhsh item : readerExcel) {
				item.setXdzt(1);
				//准备路线桩号信息
				Lx lx=new Lx();
				lx.setQdmc(item.getQdmc());
				lx.setZdmc(item.getZdmc());
				lx.setQdzh(item.getQdzh());
				lx.setZdzh(item.getZdzh());
				lx.setXmid(item.getXmbm());
				lx.setLc(item.getLc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(jhshServer.updateJhshxxYhdzx(readerExcel) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导出灾毁重建Excel
	 */
	public void exportJhshSh(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[26];
		title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
		title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
		title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
		title[3]=new ExcelTitleCell("开工时间",false, new ExcelCoordinate(0, (short)3), null,20);
		title[4]=new ExcelTitleCell("完工时间",false, new ExcelCoordinate(0, (short)4), null,20);
		title[5]=new ExcelTitleCell("工期（月）",false, new ExcelCoordinate(0, (short)5), null,20);
		title[6]=new ExcelTitleCell("设计批复文号",false, new ExcelCoordinate(0, (short)6), null,20);
		title[7]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)7), null,20);
		title[8]=new ExcelTitleCell("计划下达时间",false, new ExcelCoordinate(0, (short)8), null,20);
		title[9]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)9), null,20);
		title[10]=new ExcelTitleCell("省补助资金",false, new ExcelCoordinate(0, (short)10), null,20);
		title[11]=new ExcelTitleCell("部补助资金",false, new ExcelCoordinate(0, (short)11), null,20);
		title[12]=new ExcelTitleCell("原路线编码",false, new ExcelCoordinate(0, (short)12), null,20);
		title[13]=new ExcelTitleCell("原路线名称",false, new ExcelCoordinate(0, (short)13), null,20);
		title[14]=new ExcelTitleCell("原起点桩号",false, new ExcelCoordinate(0, (short)14), null,20);
		title[15]=new ExcelTitleCell("原止点桩号",false, new ExcelCoordinate(0, (short)15), null,20);
		title[16]=new ExcelTitleCell("规划路线编码",false, new ExcelCoordinate(0, (short)16), null,20);
		title[17]=new ExcelTitleCell("规划路线名称",false, new ExcelCoordinate(0, (short)17), null,20);
		title[18]=new ExcelTitleCell("规划起点桩号",false, new ExcelCoordinate(0, (short)18), null,20);
		title[19]=new ExcelTitleCell("规划止点桩号",false, new ExcelCoordinate(0, (short)19), null,20);
		title[20]=new ExcelTitleCell("共线路线编码",false, new ExcelCoordinate(0, (short)20), null,20);
		title[21]=new ExcelTitleCell("共线起点桩号",false, new ExcelCoordinate(0, (short)21), null,20);
		title[22]=new ExcelTitleCell("共线止点桩号",false, new ExcelCoordinate(0, (short)22), null,20);
		title[23]=new ExcelTitleCell("起点名称",false, new ExcelCoordinate(0, (short)23), null,20);
		title[24]=new ExcelTitleCell("止点名称",false, new ExcelCoordinate(0, (short)24), null,20);
		title[25]=new ExcelTitleCell("里程",false, new ExcelCoordinate(0, (short)25), null,20);
				
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "kgsj");//开工时间
		attribute.put("4", "wgsj");//完工时间
		attribute.put("5", "gq");//工期（月）
		attribute.put("6", "sjpfwh");//设计批复文号
		attribute.put("7", "xdwh");//计划下达文号
		attribute.put("8", "xdsj");//计划下达时间
		attribute.put("9", "pfztz");//批复总投资
		attribute.put("10", "sbzzj");//省补助资金
		attribute.put("11", "bbzzj");//部补助资金
		attribute.put("12", "ylxbh");
		attribute.put("13", "lxmc");
		attribute.put("14", "qdzh");
		attribute.put("15", "zdzh");
		attribute.put("16", "ghlxbm");
		attribute.put("17", "ghlxmc");
		attribute.put("18", "ghqdzh");
		attribute.put("19", "ghzdzh");
		attribute.put("20", "gxlxbm");
		attribute.put("21", "gxqdzh");
		attribute.put("22", "gxzdzh");
		attribute.put("23", "qdmc");
		attribute.put("24", "zdmc");
		attribute.put("25", "lc");
//		String xmbm = jhsh.getXmbm();
//		if(xmbm.indexOf(",")>-1){
//			String[] xmnfArray = xmbm.split(",");
//			for (int i = 0; i < xmnfArray.length; i++) {
//				if(i==xmnfArray.length-1){
//					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
//				}else if(i==0){
//					xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
//				}else{
//					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
//				}
//			}
//		}else{
//			xmbm = "j.xmbm like '" + xmbm + "%' ";
//		}
//		jhsh.setXmbm(xmbm);
//		jsdjHandle();
//		ylxbhHandle();
//		jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
		jsdjHandle1();
		xzdjHandle();
		tsdqHandle();
		jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
		jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
		
		jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
		List<Object> excelData=new ArrayList<Object>();
		String titleName="";
		String fileName="";
		jhsh.setPage(0);
		jhsh.setRows(0);
		excelData.addAll(jhshServer.queryJhshSh_dc(jhsh));
		titleName="灾毁重建项目";
		fileName="计划下达表格（2015-47号）";
		ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, fileName, getresponse());
	}
	/**
	 * 导入水毁计划审核
	 */
	@SuppressWarnings("unchecked")
	public void importExcelJhxdSh(){
		ExcelEntity excel=new ExcelEntity();
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "kgsj");//开工时间
		attribute.put("4", "wgsj");//完工时间
		attribute.put("5", "gq");//工期（月）
		attribute.put("6", "sjpfwh");//设计批复文号
		attribute.put("7", "xdwh");//计划下达文号
		attribute.put("8", "xdsj");//计划下达时间
		attribute.put("9", "pfztz");//批复总投资
		attribute.put("10", "sbzzj");//省补助资金
		attribute.put("11", "bbzzj");//部补助资金
		attribute.put("12", "ylxbh");
		attribute.put("13", "qdmc");
		attribute.put("14", "zdmc");
		attribute.put("15", "qdzh");
		attribute.put("16", "zdzh");
		attribute.put("17", "lc");
		excel.setAttributes(attribute);
		try {
			List<Jhsh> readerExcel = ExcelImportUtil.readerExcel(fileupload, Jhsh.class, 1, excel);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Jhsh item : readerExcel) {
				item.setXdzt(1);
				//准备路线桩号信息
				Lx lx=new Lx();
				lx.setQdmc(item.getQdmc());
				lx.setZdmc(item.getZdmc());
				lx.setQdzh(item.getQdzh());
				lx.setZdzh(item.getZdzh());
				lx.setXmid(item.getXmbm());
				lx.setLc(item.getLc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(jhshServer.updateJhshxxSh(readerExcel) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导出资金下达Excel
	 */
	public void exportZjxd(){
		//设置表头、设置列与字段对应
		String fileTitle=null;
		if(jhsh.getXmlx()<=3 || jhsh.getXmlx()==5){
			fileTitle="<title=项目名称,fieid=xmmc>,<title=项目编码,fieid=xmbm>,<title=行政区划,fieid=xzqh>,<title=计划下达文号,fieid=xdwh>,<title=计划下达时间,fieid=xdsj>,<title=批复总投资,fieid=pfztz>,<title=部补助资金,fieid=bbzzj>,<title=省补助资金,fieid=sbzzj>,<title=下达年份,fieid=xdnf>,<title=总补助资金,fieid=xdzj>,<title=下达车购税,fieid=btzzj>,<title=下达省投资,fieid=stz>,<title=银行贷款,fieid=yhdk>,<title=国债,fieid=gz>,<title=国债债券,fieid=gzzq>,<title=省债,fieid=sz>,<title=省债债券,fieid=szzq>,<title=总投资,fieid=ztz>,<title=计划下达文号,fieid=jhxdwh>";
		}else if(jhsh.getXmlx()==4){
			fileTitle="<title=项目名称,fieid=xmmc>,<title=项目编码,fieid=xmbm>,<title=行政区划,fieid=xzqh>,<title=计划下达文号,fieid=xdwh>,<title=计划下达时间,fieid=xdsj>,<title=计划总投资,fieid=ztz>,<title=省以上补助资金,fieid=sysbbzj>,<title=已确定部车购税,fieid=yqdbcgs>,<title=下达年份,fieid=xdnf>,<title=总补助资金,fieid=xdzj>,<title=车购税资金,fieid=btzzj>,<title=省统筹,fieid=stc>,<title=厅贷款,fieid=dk>,<title=总投资,fieid=ztz>,<title=计划下达文号,fieid=jhxdwh>";
		}
		String xmbm = jhsh.getXmbm();
		if(xmbm.indexOf(",")>-1){
			String[] xmnfArray = xmbm.split(",");
			for (int i = 0; i < xmnfArray.length; i++) {
				if(i==xmnfArray.length-1){
					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
				}else if(i==0){
					xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
				}else{
					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
				}
			}
		}else{
			xmbm = "j.xmbm like '" + xmbm + "%' ";
		}
		jhsh.setXmbm(xmbm);
		jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
		jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
		jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
		
		jsdjHandle();
		ylxbhHandle();
		List<Object> excelData=new ArrayList<Object>();
		String titleName="";
		String fileName="";
		if(jhsh.getXmlx()==1){
			excelData.addAll(jhshServer.queryJhshLmsj(jhsh, 0, 0));
			titleName="改建工程项目";
			fileName="改建工程项目-计划资金下达";
		}
		else if(jhsh.getXmlx()==2){
			excelData.addAll(jhshServer.queryJhshLmgz(jhsh, 0, 0));
			titleName="路面改造工程项目";
			fileName="路面改造工程项目-计划资金下达";
		}
		else if(jhsh.getXmlx()==3){
			excelData.addAll(jhshServer.queryJhshXj(jhsh, 0, 0));
			titleName="新建工程项目";
			fileName="新建工程项目-计划资金下达";
		}
		else if(jhsh.getXmlx()==4){
			jhsh.setJsdj(jhsh.getJsdj().replaceAll("xjsdj", "jsdj"));
			jhsh.setPage(0);
			jhsh.setRows(0);
			excelData.addAll(jhshServer.queryJhshYhdzx_dc(jhsh));
			titleName="养护大中修项目";
			fileName="养护大中修项目-计划资金下达";
		}
		else if(jhsh.getXmlx()==5){
			jhsh.setJsdj(jhsh.getJsdj().replaceAll("xjsdj", "jsdj"));
			jhsh.setPage(0);
			jhsh.setRows(0);
			excelData.addAll(jhshServer.queryJhshSh_dc(jhsh));
			titleName="灾毁重建项目";
			fileName="灾毁重建项目-计划资金下达";
		}
		ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,getresponse());
	}
	public void exportZjxdgsd(){
		//设置表头、设置列与字段对应
		String fileTitle=null;
		fileTitle="<title=项目名称,fieid=xmmc>,<title=项目编码,fieid=xmbm>,<title=行政区划,fieid=xzqh>,<title=计划下达文号,fieid=xdwh>,<title=计划下达时间,fieid=xdsj>,<title=批复总投资,fieid=pfztz>,<title=部补助资金,fieid=bbzzj>,<title=省补助资金,fieid=sbzzj>,<title=下达年份,fieid=xdnf>,<title=总补助资金,fieid=xdzj>,<title=下达车购税,fieid=btzzj>,<title=下达省投资,fieid=stz>,<title=银行贷款,fieid=yhdk>,<title=国债,fieid=gz>,<title=国债债券,fieid=gzzq>,<title=省债,fieid=sz>,<title=省债债券,fieid=szzq>,<title=总投资,fieid=ztz>,<title=计划下达文号,fieid=jhxdwh>";
		

		xzdjHandle();
		jsjsdjHandle();
		jsdjHandle1();
		jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
		jsxzHandle();
		zjlyHandle();
		xdztHandle();
		tsdqHandle();
		
//		String xmbm = jhsh.getXmbm();
//		if(xmbm.indexOf(",")>-1){
//			String[] xmnfArray = xmbm.split(",");
//			for (int i = 0; i < xmnfArray.length; i++) {
//				if(i==xmnfArray.length-1){
//					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
//				}else if(i==0){
//					xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
//				}else{
//					xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
//				}
//			}
//		}else{
//			xmbm = "j.xmbm like '" + xmbm + "%' ";
//		}
//		jhsh.setXmbm(xmbm);
//		jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
//		jsdjHandle();
//		ylxbhHandle();
//		if(jhsh.getXmlx1()!=null)
//			if(jhsh.getXmlx1().length()>0){
//				String[] tsdqs=jhsh.getXmlx1().split(",");
//				String tsdq="";
//				for (int i = 0; i < tsdqs.length; i++) {
//					if("全部".equals(tsdqs[i])){
//						tsdq="";
//						break;
//					}
//					if(i==0)
//						tsdq+=" and (j.xmlx1 like '%"+tsdqs[i]+"%'";
//					else
//						tsdq+=" or j.xmlx1 like '%"+tsdqs[i]+"%'";
//				}
//				if(tsdq==""){
//					tsdq="";
//				}else{
//					tsdq+=")";
//				}
//				jhsh.setXmlx1(tsdq);
//			}
		List<Object> excelData=new ArrayList<Object>();
		String titleName="";
		String fileName="";
		jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
		jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
		
		excelData.addAll(jhshServer.queryGsdgz_dc(jhsh, 0, 0));
		titleName="国省道改造";
		fileName="国省道改造-计划资金下达";
		ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,getresponse());
	}
	
	/**
	 * 导入计划审核信息
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void importExcelJhxd() throws Exception{
		ExcelEntity excel=new ExcelEntity();
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "qdzh");//起点桩号
		attribute.put("4", "zdzh");//止点桩号
		attribute.put("5", "kgsj");//开工时间
		attribute.put("6", "wgsj");//完工时间
		attribute.put("7", "gq");//工期（月）
		attribute.put("8", "gkpfwh");//工可批复文号
		attribute.put("9", "sjpfwh");//设计批复文号
		attribute.put("10", "xdwh");//计划下达文号
		attribute.put("11", "xdsj");//计划下达时间
		attribute.put("12", "pfztz");//批复总投资
		attribute.put("13", "bbzzj");//部补助资金
		attribute.put("14", "sbzzj");//省补助资金
		if(jhsh.getXmlx()!=2){
			attribute.put("15", "gldj");//行政等级
		}
		excel.setAttributes(attribute);
		try {
			boolean b=false;
			List<Jhsh> readerExcel = ExcelImportUtil.readerExcel(fileupload, Jhsh.class, 1, excel);
			for (Jhsh item : readerExcel) {
				item.setXdzt(1);
			}
			if(jhsh.getXmlx()==1){
				b=jhshServer.updateJhshxxLmsj(readerExcel);
			}else if(jhsh.getXmlx()==2){
				b=jhshServer.updateJhshxxLmgz(readerExcel);
			}else if(jhsh.getXmlx()==3){
				b=jhshServer.updateJhshxxXj(readerExcel);
			}
			if(b){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改路线信息
	 * @param lx 路线信息
	 * @return 执行结果
	 */
	public void updateLx(){
		try{
			result.put("result", new Boolean(jhshServer.updateLx(lx)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 添加路线
	 * @throws Exception
	 */
	public void insertLx() throws Exception{
		try {
			lx.setSffirst("0");
			//Lx queryHaveLx = lx.getXmid().substring(10, 11).equals("5") ? null : jhshServer.queryHaveLx(lx);
			//if(queryHaveLx==null){
				boolean b = jhshServer.insertLx(lx);
				result.put("result", new Boolean(b).toString());
			/*}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}*/
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 删除路线
	 * @throws Exception
	 */
	public void deleteLx() throws Exception{
		try {
			lx.setSffirst("0");
			boolean b = jhshServer.deleteLx(lx);
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码等查询路线列表
	 * @throws Exception
	 */
	public void selectlxList() throws Exception{
		try {
			JsonUtils.write(jhshServer.selectlxList(lx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void selectlxbgList() throws Exception{
		try {
			JsonUtils.write(jhshServer.selectlxbgList(lx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 查询历史数据信息
	 */
	public void queryLsxx(){
		try{
			JsonUtils.write(jhshServer.queryLsxx(jhsh), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void querywnxx(){
		try{
			JsonUtils.write(jhshServer.querywnxx(jhsh), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询历史数据信息
	 */
	public void queryLsxx1(){
		try{
			JsonUtils.write(jhshServer.queryLsxx1(jhsh), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 新查询五年项目库历史数据信息
	 */
	public void querywnLsxx(){
		try{
			JsonUtils.write(jhshServer.querywnLsxx(jhsh), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 新查询立项项目库历史数据信息
	 */
	public void querylxLsxx(){
		try{
			JsonUtils.write(jhshServer.querylxLsxx(jhsh), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 新查询立项项目库历史数据信息
	 */
	public void querywnxmxx(){
		try{
			JsonUtils.write(jhshServer.querywnxmxx(jhsh), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 查询历史数据信息
	 */
	public void queryLsxx2(){
		try{
			JsonUtils.write(jhshServer.queryLsxx2(lx), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void queryLsxx2new(){
		try{
			String xzqh=lx.getXzqh();
			//lx.setXzqh(getcxtj("l.xzqhdm",xzqh));
			//lx.setXzqhdm(getcxtj("t.xlxbm",xzqh));
			lx.setXzqhdm(getcxtj("xzqhdm2",xzqh));
			lx.setXdnf(getcxtj("xdnf",lx.getXdnf()));
			lx.setTsdq(getcxtj("tsdq",lx.getTsdq()));
			lx.setJsxz(getcxtj("jsxz",lx.getXmlx()));
			lx.setXmknf(getcxtj("xmknf",lx.getXmknf()));
			/*if(!"".equals(lx.getXmknf())&&!"".equals(lx.getXdnf()))
				lx.setXdnf("("+lx.getXdnf()+"  or  "+lx.getXmknf()+")");
			else
				lx.setXdnf(lx.getXdnf()+" "+lx.getXmknf());*/
			
			lx.setSjlx(getcxtj("sjlx",lx.getSjlx()));
			JsonUtils.write(jhshServer.queryLsxx2new(lx), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void queryKxxyjByXmbm() throws Exception{
		try {
			Kxxyj kxxyj=new Kxxyj();
			if(jhsh.getXmlx()==1){
				kxxyj = jhshServer.queryLmsjKxxyjByXmbm(jhsh);
			}else if(jhsh.getXmlx()==2){
				kxxyj = jhshServer.queryLmgzKxxyjByXmbm(jhsh);
			}else if(jhsh.getXmlx()==3){
				kxxyj = jhshServer.queryXjKxxyjByXmbm(jhsh);
			}
			else if(jhsh.getXmlx()==5){
				kxxyj = jhshServer.queryShKxxyjByXmbm(jhsh);
			}
			JsonUtils.write(kxxyj, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void queryKxxyjqxByXmbm() throws Exception{
		try {
			Kxxyj kxxyj=new Kxxyj();
			if(jhsh.getXmlx()==1){
				kxxyj = jhshServer.queryLmsjKxxyjqxByXmbm(jhsh);
			}else if(jhsh.getXmlx()==2){
				kxxyj = jhshServer.queryLmgzKxxyjqxByXmbm(jhsh);
			}else if(jhsh.getXmlx()==3){
				kxxyj = jhshServer.queryXjKxxyjqxByXmbm(jhsh);
			}
			/*else if(jhsh.getXmlx()==5){
				kxxyj = jhshServer.queryShKxxyjqxByXmbm(jhsh);
			}*/
			JsonUtils.write(kxxyj, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void zdyQuery(){
		try {
			List<Map<String, String>> resultlist = new ArrayList<Map<String,String>>();
			jsdjHandle();
			ylxbhHandle();
			int total = 0;
			if(jhsh.getXmlx()==1){
				resultlist = jhshServer.zdyQueryLmsj(filed,jhsh,jhsh.getPage(),jhsh.getRows());
				total = jhshServer.zdyQueryLmsjTotal(filed,jhsh);
			}else if(jhsh.getXmlx()==2){
				resultlist = jhshServer.zdyQueryLmgz(filed, jhsh,jhsh.getPage(),jhsh.getRows());
				total = jhshServer.zdyQueryLmgzTotal(filed,jhsh);
			}else if(jhsh.getXmlx()==3){
				resultlist = jhshServer.zdyQueryXj(filed, jhsh,jhsh.getPage(),jhsh.getRows());
				total = jhshServer.zdyQueryXjTotal(filed,jhsh);
			}else if(jhsh.getXmlx()==4){
				resultlist = jhshServer.zdyQueryYhdzx(filed, jhsh,jhsh.getPage(),jhsh.getRows());
				total = jhshServer.zdyQueryYhdzxTotal(filed,jhsh);
			}else if(jhsh.getXmlx()==5){
				resultlist = jhshServer.zdyQuerySh(filed, jhsh,jhsh.getPage(),jhsh.getRows());
				total = jhshServer.zdyQueryShTotal(filed,jhsh);
			}
			result.put("rows", resultlist);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void zdyExportExcel(){
		try{
			String fileName="";
			jsdjHandle();
			ylxbhHandle();
			List<Map<String, String>> resultlist = new ArrayList<Map<String,String>>();
			if(jhsh.getXmlx()==1){
				resultlist = jhshServer.zdyQueryLmsj(filed,jhsh,0,0);
				fileName="改建自定义查询";
			}else if(jhsh.getXmlx()==2){
				resultlist = jhshServer.zdyQueryLmgz(filed, jhsh,0,0);
				fileName="路面改造自定义查询";
			}else if(jhsh.getXmlx()==3){
				resultlist = jhshServer.zdyQueryXj(filed, jhsh,0,0);
				fileName="新建自定义查询";
			}else if(jhsh.getXmlx()==4){
				resultlist = jhshServer.zdyQueryYhdzx(filed, jhsh,0,0);
				fileName="养护大中修自定义查询";
			}else if(jhsh.getXmlx()==5){
				resultlist = jhshServer.zdyQuerySh(filed, jhsh,0,0);
				fileName="灾毁重建自定义查询";
			}
			System.out.println("总数："+resultlist.size());
			ExcelExportUtil.excelWriter(filed, filedName, fileName, resultlist, getresponse());
		}catch(Exception e){
			e.printStackTrace();
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
	public String xzqhBm2(String bh,String name){
		String result="";
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
			String[] s = bh.split(",");
			for (int i = 0; i < s.length; i++) {
				if(i==0)
					result+=" (j."+name+" like '%"+s[i]+"%'";
				else
					result+=" or j."+name+" like '%"+s[i]+"%'";
			}
			result+=")";
			//System.out.println(result);
			//result= bh.indexOf(",")==-1 ? " x."+name+" like '%"+bh+"%'": "x."+name+" in ("+bh+")";
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
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	public Lx getLx() {
		return lx;
	}
	public void setLx(Lx lx) {
		this.lx = lx;
	}
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
	public String getFiled() {
		return filed;
	}
	public void setFiled(String filed) {
		this.filed = filed;
	}
	public String getFiledName() {
		return filedName;
	}
	public void setFiledName(String filedName) {
		this.filedName = filedName;
	}
	
	public void queryGsdgzxd() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try {
			xdwhHandle();
			xzdjHandle();
			jsjsdjHandle();
			jsdjHandle1();
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			jsxzHandle();
			zjlyHandle();
			xdztHandle();
			tsdqHandle();
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			listData=jhshServer.queryGsdgzxd(jhsh,jhsh.getPage(),jhsh.getRows());
			total=jhshServer.queryGsdgzxdCount(jhsh);
			result.put("total", total);
			result.put("rows", listData);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void queryjhxdsh() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try {
			xdwhHandle();
			xzdjHandle();
			//jsjsdjHandle();
			jsdjHandle1();
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			//jsxzHandle();
			//zjlyHandle();
			xdztHandle();
			tsdqHandle();
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			listData=jhshServer.queryshxd(jhsh,jhsh.getPage(),jhsh.getRows());
			total=jhshServer.queryshxdCount(jhsh);
			result.put("total", total);
			result.put("rows", listData);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void queryjhxdyh() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try {
			xdwhHandle();
			xzdjHandle();
			jsjsdjHandle();
			jsdjHandle1();
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			jsxzHandle();
			zjlyHandle();
			xdztHandle();
			tsdqHandle();
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			listData=jhshServer.queryjhxdyh(jhsh,jhsh.getPage(),jhsh.getRows());
			total=jhshServer.queryjhxdyhCount(jhsh);
			result.put("total", total);
			result.put("rows", listData);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	
	
	public void queryGsdgzxdbz() throws Exception{
		List<Jhsh> listData=null;
		try {
			
			xzdjHandle();
			jsjsdjHandle();
			jsdjHandle1();
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			jsxzHandle();
			zjlyHandle();
			xdztHandle();
			tsdqHandle();
			xdwhHandle();
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			listData=jhshServer.queryGsdgzxdbz(jhsh);

			JsonUtils.write(listData, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void queryGsdgzxd_qxbz() throws Exception{
		List<Jhsh> listData=null;
		try {
			
			/*xzdjHandle();
			jsjsdjHandle();
			jsdjHandle1();
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			jsxzHandle();
			zjlyHandle();
			xdztHandle();
			tsdqHandle();
			xdwhHandle();*/
			listData=jhshServer.queryGsdgzxd_qxbz(jhsh);

			JsonUtils.write(listData, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void queryjhxdshbz() throws Exception{
		List<Jhsh> listData=null;
		try {
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			if(jhsh.getXmlx()==5){//灾毁恢复
				xdwhHandle();
				xzdjHandle();
				//jsjsdjHandle();
				jsdjHandle1();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				//jsxzHandle();
				//zjlyHandle();
				xdztHandle();
				tsdqHandle();
				
				listData=jhshServer.queryshxdbz(jhsh);
			}
			if(jhsh.getXmlx()==4){//养护大中修
				xdwhHandle();
				xzdjHandle();
				jsjsdjHandle();
				jsdjHandle1();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				jsxzHandle();
				zjlyHandle();
				xdztHandle();
				tsdqHandle();
				listData=jhshServer.queryyhxdbz(jhsh);
			}
			
			JsonUtils.write(listData, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void queryjhxdsh_qxbz() throws Exception{
		List<Jhsh> listData=null;
		try {
			if(jhsh.getXmlx()==5){//灾毁恢复
				
				listData=jhshServer.queryshxd_qxbz(jhsh);
			}
			if(jhsh.getXmlx()==4){//养护大中修
				
				listData=jhshServer.queryyhxd_qxbz(jhsh);
			}
			
			JsonUtils.write(listData, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	public void queryJhshLjgsdxd(){
		Map<String, String> result = new HashMap<String, String>();
		try {
			xdwhHandle();
			xzdjHandle();
			jsjsdjHandle();
			jsdjHandle1();
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			jsxzHandle();
			zjlyHandle();
			xdztHandle();
			tsdqHandle();
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			result = jhshServer.queryJhshLjgsdxd(jhsh);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryJhbzLj(){
		Map<String, String> result = new HashMap<String, String>();
		try {
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			if(jhsh.getXmlx()==5){
				xdwhHandle();
				xzdjHandle();
				jsdjHandle1();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				xdztHandle();
				tsdqHandle();
				result = jhshServer.queryJhbzshLj(jhsh);
			}
			if(jhsh.getXmlx()==4){
				xdwhHandle();
				xzdjHandle();
				jsjsdjHandle();
				jsdjHandle1();
				jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
				jsxzHandle();
				zjlyHandle();
				xdztHandle();
				tsdqHandle();
				result = jhshServer.queryJhbzyhLj(jhsh);
			}
			
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	private void zjlyHandle(){
		if(jhsh.getZjly()!=null)
			if(jhsh.getZjly().length()>0){
				String[] tsdqs=jhsh.getZjly().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+=" and (j."+tsdqs[i]+">0";
					else
						tsdq+=" or j."+tsdqs[i]+">0";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				jhsh.setZjly(tsdq);
			}
	}
	private void tsdqHandle(){
		if(jhsh.getTsdq()!=null)
			if(jhsh.getTsdq().length()>0){
				String[] tsdqs=jhsh.getTsdq().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+=" and (j.tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+=" or j.tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				jhsh.setTsdq(tsdq);
			}
	}
	private void tsdqHandle1(){
		if(jhsh.getTsdq()!=null)
			if(jhsh.getTsdq().length()>0){
				String[] tsdqs=jhsh.getTsdq().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+=" and (lxg.tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+=" or lxg.tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				jhsh.setTsdq(tsdq);
			}
	}
	private void tsdqHandle2(){
		if(jhsh.getTsdq()!=null)
			if(jhsh.getTsdq().length()>0){
				String[] tsdqs=jhsh.getTsdq().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+=" and (x.tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+=" or x.tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				jhsh.setTsdq(tsdq);
			}
	}
	
	private void xdztHandle(){
		if(jhsh.getXdzttj()!=null)
			if(jhsh.getXdzttj().length()>0){
				String[] tsdqs=jhsh.getXdzttj().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+=" and (j.xdzttj like '%"+tsdqs[i]+"%'";
					else
						tsdq+=" or j.xdzttj like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				jhsh.setXdzttj(tsdq);
			}
	}
	private void jsxzHandle(){
		if(jhsh.getXmlx1()!=null)
			if(jhsh.getXmlx1().length()>0){
				String[] tsdqs=jhsh.getXmlx1().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+=" and (j.xmlx1 like '%"+tsdqs[i]+"%'";
					else
						tsdq+=" or j.xmlx1 like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				jhsh.setXmlx1(tsdq);
			}
	}
	
	private void jsxzHandle2(){
		if(jhsh.getXmlx1()!=null)
			if(jhsh.getXmlx1().length()>0){
				String[] tsdqs=jhsh.getXmlx1().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+=" and (j.jsxz like '%"+tsdqs[i]+"%'";
					else
						tsdq+=" or j.jsxz like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				jhsh.setXmlx1(tsdq);
			}
	}
	
	private void xzdjHandle() {
		String ylxbh = jhsh.getXzdj()==null ? "" : jhsh.getXzdj();
		if(ylxbh!=null && !ylxbh.equals("")){
			if(ylxbh.indexOf(",")>-1){
				String[] split = ylxbh.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						ylxbh = "(ghlxbmtj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						ylxbh += " or ghlxbmtj like '%"+split[i]+"%')";
					}else{
						ylxbh += " or ghlxbmtj like '%"+split[i]+"%'";
					}
				}
			}else{
				ylxbh = " ghlxbmtj like '%"+ylxbh+"%'";
			}
			jhsh.setXzdj(ylxbh);
		}
	}
	
	private void jsdjHandle() {
		if(jhsh.getJsdj()!=null && !jhsh.getJsdj().equals("")){
			String xjsdj = jhsh.getJsdj();
			if(xjsdj.indexOf(",")>-1){
				String[] split = xjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						xjsdj = "(l.xjsdj like '"+split[i]+"%'";
					}else if(i==split.length-1){
						xjsdj += " or l.xjsdj like '"+split[i]+"%')";
					}else{
						xjsdj += " or l.xjsdj like '"+split[i]+"%'";
					}
					if(split.length==1){
						xjsdj +=")";
					}
				}
			}else{
				xjsdj = "l.xjsdj like '"+xjsdj+"%'";
			}
			jhsh.setJsdj(xjsdj);
		}
	}
	//and (jhxdwh like '%'||#{jhsh.jhxdwh}||'%' or xdwh like '%'||#{jhsh.jhxdwh}||'%')
	private void xdwhHandle(){
		if(jhsh.getJhxdwh()!=null)
			if(jhsh.getJhxdwh().length()>0){
				String[] tsdqs=jhsh.getJhxdwh().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+=" and (j.jhxdwh like '%"+tsdqs[i]+"%'";
					else
						tsdq+=" or j.jhxdwh like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				jhsh.setJhxdwh(tsdq);
			}
	}
	
	private void jsdjHandle1() {
		if(jhsh.getJsdj()!=null && !jhsh.getJsdj().equals("")){
			String xjsdj = jhsh.getJsdj();
			if(xjsdj.indexOf(",")>-1){
				String[] split = xjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						xjsdj = "(xjsdjtj like '"+split[i]+"%'";
					}else if(i==split.length-1){
						xjsdj += " or xjsdjtj like '"+split[i]+"%')";
					}else{
						xjsdj += " or xjsdjtj like '"+split[i]+"%'";
					}
					if(split.length==1){
						xjsdj +=")";
					}
				}
			}else{
				xjsdj = "xjsdjtj like '"+xjsdj+"%'";
			}
			jhsh.setJsdj(xjsdj);
		}
	}
	private void jsjsdjHandle() {
		if(jhsh.getJsjsdj()!=null && !jhsh.getJsjsdj().equals("")){
			String xjsdj = jhsh.getJsjsdj();
			if(xjsdj.indexOf(",")>-1){
				String[] split = xjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						xjsdj = "(jsjsdjtj like '"+split[i]+"%'";
					}else if(i==split.length-1){
						xjsdj += " or jsjsdjtj like '"+split[i]+"%')";
					}else{
						xjsdj += " or jsjsdjtj like '"+split[i]+"%'";
					}
					if(split.length==1){
						xjsdj +=")";
					}
				}
			}else{
				xjsdj = "jsjsdjtj like '"+xjsdj+"%'";
			}
			jhsh.setJsjsdj(xjsdj);
		}
	}
	
	public void planxdAll(){
		
		try {
			JSONArray ja = JSONArray.fromObject(json_data);
			List<Jhsh> list = (List<Jhsh>) JSONArray.toList(ja, new Jhsh(),new JsonConfig());
			for (Jhsh jhsh : list) {
				System.out.println(jhsh.getXmlx()+"     "+jhsh.getXmmc());
			}
			boolean bl = jhshServer.planxdAll(list);
			ResponseUtils.write(getresponse(), bl + "");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void planxdAll_qx(){
		
		try {
			JSONArray ja = JSONArray.fromObject(json_data);
			List<Jhsh> list = (List<Jhsh>) JSONArray.toList(ja, new Jhsh(),new JsonConfig());
			for (Jhsh jhsh : list) {
				System.out.println(jhsh.getXmlx()+"     "+jhsh.getXmmc());
			}
			boolean bl = jhshServer.planxdAll_qx(list);
			ResponseUtils.write(getresponse(), bl + "");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void planxdhzadd(){
		JSONArray ja = JSONArray.fromObject(json_data);
		List<Jhsh> list=(List<Jhsh>)JSONArray.toList(ja, new Jhsh(),new JsonConfig());
		
		boolean bl=jhshServer.planxdhzadd(list);
		ResponseUtils.write(getresponse(), bl+"");
	}
	
	public void getbzhzb(){
		try {
			if(jhsh.getXmlx()==4){
				List<Map<String, String>> list=jhshServer.getbzyhhzb();
				JsonUtils.write(list, getresponse().getWriter());
			}
			
		} catch (Exception e) {
			
		}
	}
	public void plansb(){
		boolean bl=false;
		if(jhsh.getXmlx()==1){
			bl=jhshServer.plansbgj(jhsh);
		}
		if(jhsh.getXmlx()==2){
			bl=jhshServer.plansblm(jhsh);
		}
		if(jhsh.getXmlx()==3){
			bl=jhshServer.plansbxj(jhsh);
		}
		if(jhsh.getXmlx()==4){
			bl=jhshServer.plansbyh(jhsh);
		}
		if(jhsh.getXmlx()==5){
			bl=jhshServer.plansbsh(jhsh);
		}
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void thwshjh(){
		boolean bl=false;
		bl=jhshServer.thwshjh(jhsh);
		ResponseUtils.write(getresponse(), bl+"");
	}
	public void plansh(){
		boolean bl=false;
		if(jhsh.getXmlx()==1){
			bl=jhshServer.planshgj(jhsh);
		}
		if(jhsh.getXmlx()==2){
			bl=jhshServer.planshlm(jhsh);
		}
		if(jhsh.getXmlx()==3){
			bl=jhshServer.planshxj(jhsh);
		}
		if(jhsh.getXmlx()==4){
			bl=jhshServer.planshyh(jhsh);
		}
		if(jhsh.getXmlx()==5){
			bl=jhshServer.planshsh(jhsh);
		}
		ResponseUtils.write(getresponse(), bl+"");
	}
	//qwh导出国省道excel
	public void exportJhshxxgsdexcel(){
		String xmbm = jhsh.getXmbm();
		if(!xmbm.equals("")&&xmbm!=null){
			if(xmbm.indexOf(",")>-1){
				String[] xmnfArray = xmbm.split(",");
				for (int i = 0; i < xmnfArray.length; i++) {
					if(i==xmnfArray.length-1){
						xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
					}else if(i==0){
						xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
					}else{
						xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
					}
				}
			}else{
				xmbm = "j.xmbm like '" + xmbm + "%' ";
			}
		}
		xdwhHandle();
		jhsh.setXmbm(xmbm);
		tsdqHandle();
		jsdjHandle();
		jsjsdjHandle();
		ylxbhHandle();
		jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
		if(jhsh.getXmlx1()!=null)
			if(jhsh.getXmlx1().length()>0){
				String[] tsdqs=jhsh.getXmlx1().split(",");
				String tsdq="";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+=" and (j.xmlx1 like '%"+tsdqs[i]+"%'";
					else
						tsdq+=" or j.xmlx1 like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				jhsh.setXmlx1(tsdq);
			}
		jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
		jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
		
		List<Excel_list> l = jhshServer.queryGsdgz_dc(jhsh);
		int k=1;
		for (Excel_list e : l) {
			if("1".equals(e.getV_50())) {
				e.setV_0(""+k);k++;
			}
		}
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("公路建设计划（国省道改造项目）");//设置第一行
		eldata.setSheetName("国省道改造");//设置sheeet名
		eldata.setFileName("公路建设计划（国省道改造项目）");//设置文件名
		
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,2,0,0));
		et.add(new Excel_tilte("设区市",1,2,1,1));
		et.add(new Excel_tilte("项目名称",1,2,2,2));
		et.add(new Excel_tilte("建设性质",1,2,3,3));
		et.add(new Excel_tilte("建 设 规 模（ 公 里 ）/（ 延 米 ）",1,1,4,10));
		et.add(new Excel_tilte("建设年限",1,1,11,12));
		et.add(new Excel_tilte("总投资",1,2,13,13));
		et.add(new Excel_tilte("中央投资",1,2,14,14));
		et.add(new Excel_tilte("累计完成投资（万元）中央投资",1,1,15,16));
		et.add(new Excel_tilte("建设计划（万元）",1,1,17,22));
		et.add(new Excel_tilte("前期工作情况",1,1,23,24));
		et.add(new Excel_tilte("合计",2,2,4,4));
		et.add(new Excel_tilte("一级公路",2,2,5,5));
		et.add(new Excel_tilte("二级公路",2,2,6,6));
		et.add(new Excel_tilte("三级公路",2,2,7,7));
		et.add(new Excel_tilte("四级公路",2,2,8,8));
		et.add(new Excel_tilte("大桥",2,2,9,9));
		et.add(new Excel_tilte("隧道",2,2,10,10));
		et.add(new Excel_tilte("开工年",2,2,11,11));
		et.add(new Excel_tilte("完工年",2,2,12,12));
		et.add(new Excel_tilte("合计",2,2,15,15));
		et.add(new Excel_tilte("内：中央车购税",2,2,16,16));
		et.add(new Excel_tilte("合计",2,2,17,17));
		et.add(new Excel_tilte("中央投资车购税",2,2,18,18));
		et.add(new Excel_tilte("地方自筹",2,2,19,19));
		et.add(new Excel_tilte("国内厅贷款",2,2,20,20));
		et.add(new Excel_tilte("主要建设内容",2,2,21,21));
		et.add(new Excel_tilte("新增能力",2,2,22,22));
		et.add(new Excel_tilte("工可批复文号",2,2,23,23));
		et.add(new Excel_tilte("设计批复文号",2,2,24,24));
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	//wdd导出灾毁恢复excel  start
		public void exportJhshShExcel(){
			String xmbm = jhsh.getXmnf();
			if(!xmbm.equals("")&&xmbm!=null){
				if(xmbm.indexOf(",")>-1){
					String[] xmnfArray = xmbm.split(",");
					for (int i = 0; i < xmnfArray.length; i++) {
						if(i==xmnfArray.length-1){
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%') ";
						}else if(i==0){
							xmbm = "(j.xmbm like '" + xmnfArray[i] + "%' ";
						}else{
							xmbm += " or j.xmbm like '" + xmnfArray[i] + "%' ";
						}
					}
				}else{
					xmbm = "j.xmbm like '" + xmbm + "%' ";
				}
			}
			xdwhHandle();
			jhsh.setXmbm(xmbm);
			jsdjHandle();
			jsjsdjHandle();
			ylxbhHandle();
			xdztHandle();
			tsdqHandle1();
			jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
			if(jhsh.getXmlx1()!=null)
				if(jhsh.getXmlx1().length()>0){
					String[] tsdqs=jhsh.getXmlx1().split(",");
					String tsdq="";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+=" and (j.xmlx1 like '%"+tsdqs[i]+"%'";
						else
							tsdq+=" or j.xmlx1 like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					jhsh.setXmlx1(tsdq);
				}
			
			jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
			jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
			
			List<Excel_list> l = jhshServer.queryZhhf_dc(jhsh);
			//l.add(new Excel_list());
			int k=1;
			for (Excel_list e : l) {
				if("1".equals(e.getV_50())) {
					e.setV_0(""+k);
					k++;
				}
			}
			
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("公路建设计划（灾毁恢复重建项目）");//设置第一行
			eldata.setSheetName("灾毁恢复重建");//设置sheeet名
			eldata.setFileName("公路建设计划（灾毁恢复重建项目）");//设置文件名
			
			eldata.setEl(l);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,2,0,0));
			et.add(new Excel_tilte("设区市",1,2,1,1));
			et.add(new Excel_tilte("项目名称",1,2,2,2));
			et.add(new Excel_tilte("建设性质",1,2,3,3));
			et.add(new Excel_tilte("建 设 规 模（ 公 里 ）/（ 延 米 ）",1,1,4,7));
			et.add(new Excel_tilte("主要恢复重建工程量",1,2,8,8));
			et.add(new Excel_tilte("建设年限",1,1,9,10));
			et.add(new Excel_tilte("总投资",1,2,11,11));
			et.add(new Excel_tilte("中央投资(万元)",1,2,12,12));
			et.add(new Excel_tilte("2015年建设计划（万元）",1,1,13,16));
			et.add(new Excel_tilte("前期工作批复文号",1,2,17,17));
			et.add(new Excel_tilte("合计",2,2,4,4));
			et.add(new Excel_tilte("一级公路",2,2,5,5));
			et.add(new Excel_tilte("二级公路",2,2,6,6));
			et.add(new Excel_tilte("三级公路",2,2,7,7));
			et.add(new Excel_tilte("开工年",2,2,9,9));
			et.add(new Excel_tilte("完工年",2,2,10,10));
			et.add(new Excel_tilte("合计",2,2,13,13));
			et.add(new Excel_tilte("中央投资车购税",2,2,14,14));
			et.add(new Excel_tilte("地方自筹",2,2,15,15));
			et.add(new Excel_tilte("主要建设内容",2,2,16,16));
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			try {
				Excel_export.excel_export(eldata,response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}  //wdd导出灾毁恢复excel  end
	
		//wdd导出养护大中修汇总表excel  start
				public void exportJhshYhdzxExcel(){
					xdwhHandle();
					xzdjHandle();
					jsjsdjHandle();
					jsdjHandle1();
					jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
					jsxzHandle();
					zjlyHandle();
					xdztHandle();
					tsdqHandle();
					jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
					jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
					
					List<Excel_list> l = jhshServer.queryYhdzx_dc(jhsh);
					for (int i = 0; i < l.size(); i++) {
						if(i!=0)
						l.get(i).setV_0(i+"");
					}
					//System.out.println(l+"111");
					ExcelData eldata=new ExcelData();//创建一个类
					eldata.setTitleName("公路建设计划（养护大中修）");//设置第一行
					eldata.setSheetName("汇总表");//设置sheeet名
					eldata.setFileName("公路建设计划（养护大中修）汇总表");//设置文件名
					
					eldata.setEl(l);//将实体list放入类中
					System.out.println(eldata+"实体list");
					List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
					et.add(new Excel_tilte("序号",1,3,0,0));
					et.add(new Excel_tilte("设区市",1,3,1,1));
					et.add(new Excel_tilte("里程（公里）",1,1,2,13));
					et.add(new Excel_tilte("本次计划下达资金（万元）",1,1,14,25));
					et.add(new Excel_tilte("总计",2,3,2,2));
					et.add(new Excel_tilte("重建",2,3,3,3));
					et.add(new Excel_tilte("改造",2,3,4,4));
					et.add(new Excel_tilte("预防性养护",2,3,5,5));
					et.add(new Excel_tilte("国道",2,2,6,9));
					et.add(new Excel_tilte("省道",2,2,10,13));
					et.add(new Excel_tilte("总计",2,3,14,14));
					et.add(new Excel_tilte("重建",2,3,15,15));
					et.add(new Excel_tilte("改造",2,3,16,16));
					et.add(new Excel_tilte("预防性养护",2,3,17,17));
					et.add(new Excel_tilte("国道",2,2,18,21));
					et.add(new Excel_tilte("省道",2,2,22,25));
					et.add(new Excel_tilte("小计",3,3,6,6));
					et.add(new Excel_tilte("重建",3,3,7,7));
					et.add(new Excel_tilte("改造",3,3,8,8));
					et.add(new Excel_tilte("预防性养护",3,3,9,9));
					et.add(new Excel_tilte("小计",3,3,10,10));
					et.add(new Excel_tilte("重建",3,3,11,11));
					et.add(new Excel_tilte("改造",3,3,12,12));
					et.add(new Excel_tilte("预防性养护",3,3,13,13));
					et.add(new Excel_tilte("小计",3,3,18,18));
					et.add(new Excel_tilte("重建",3,3,19,19));
					et.add(new Excel_tilte("改造",3,3,20,20));
					et.add(new Excel_tilte("预防性养护",3,3,21,21));
					et.add(new Excel_tilte("小计",3,3,22,22));
					et.add(new Excel_tilte("重建",3,3,23,23));
					et.add(new Excel_tilte("改造",3,3,24,24));
					et.add(new Excel_tilte("预防性养护",3,3,25,25));
					System.out.println(et+"list表头");		
					eldata.setEt(et);//将表头内容设置到类里面
					System.out.println(eldata+"实体listlast");
					HttpServletResponse response= getresponse();//获得一个HttpServletResponse
					try {
						Excel_export.excel_export(eldata,response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}  //wdd导出养护大中修汇总表excel  end
				public void exportJhshYhdzxExcel1(){
					xdwhHandle();
					jsdjHandle1();
					xzdjHandle();
					tsdqHandle1();
					jsxzHandle2();
					zjlyHandle();
					xdztHandle();
					jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
					jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
					jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
					
					List<Excel_list> l = jhshServer.queryYhdzx_dc1(jhsh);
					for (int i = 0; i < l.size(); i++) {
						if(i!=0)
						l.get(i).setV_0(i+"");
					}
					//System.out.println(l+"111");
					ExcelData eldata=new ExcelData();//创建一个类
					eldata.setTitleName("全省普通国省道第一批养护大中修工程建议计划汇总表");//设置第一行
					eldata.setSheetName("汇总表");//设置sheeet名
					eldata.setFileName("全省普通国省道第一批养护大中修工程建议计划汇总表");//设置文件名
					
					eldata.setEl(l);//将实体list放入类中
					System.out.println(eldata+"实体list");
					List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
					et.add(new Excel_tilte("序号",1,3,0,0));
					et.add(new Excel_tilte("设区市",1,3,1,1));
					et.add(new Excel_tilte("本次建议计划建设里程（公里）",1,1,2,13));
					et.add(new Excel_tilte("本次建议计划资金（万元）",1,1,14,25));
					et.add(new Excel_tilte("总计",2,3,2,2));
					et.add(new Excel_tilte("大修",2,3,3,3));
					et.add(new Excel_tilte("中修",2,3,4,4));
					et.add(new Excel_tilte("预防性",2,3,5,5));
					et.add(new Excel_tilte("国道",2,2,6,9));
					et.add(new Excel_tilte("省道",2,2,10,13));
					et.add(new Excel_tilte("总计",2,3,14,14));
					et.add(new Excel_tilte("大修",2,3,15,15));
					et.add(new Excel_tilte("中修",2,3,16,16));
					et.add(new Excel_tilte("预防性",2,3,17,17));
					et.add(new Excel_tilte("国道",2,2,18,21));
					et.add(new Excel_tilte("省道",2,2,22,25));
					et.add(new Excel_tilte("小计",3,3,6,6));
					et.add(new Excel_tilte("大修",3,3,7,7));
					et.add(new Excel_tilte("中修",3,3,8,8));
					et.add(new Excel_tilte("预防性",3,3,9,9));
					et.add(new Excel_tilte("小计",3,3,10,10));
					et.add(new Excel_tilte("大修",3,3,11,11));
					et.add(new Excel_tilte("中修",3,3,12,12));
					et.add(new Excel_tilte("预防性",3,3,13,13));
					et.add(new Excel_tilte("小计",3,3,18,18));
					et.add(new Excel_tilte("大修",3,3,19,19));
					et.add(new Excel_tilte("中修",3,3,20,20));
					et.add(new Excel_tilte("预防性",3,3,21,21));
					et.add(new Excel_tilte("小计",3,3,22,22));
					et.add(new Excel_tilte("大修",3,3,23,23));
					et.add(new Excel_tilte("中修",3,3,24,24));
					et.add(new Excel_tilte("预防性",3,3,25,25));
					System.out.println(et+"list表头");		
					eldata.setEt(et);//将表头内容设置到类里面
					System.out.println(eldata+"实体listlast");
					HttpServletResponse response= getresponse();//获得一个HttpServletResponse
					try {
						Excel_export.excel_export(eldata,response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}  //wdd导出养护大中修汇总表excel  end
				
				
				//wdd导出养护大中修明细表excel  start
				public void exportJhshYhdzxDetailExcel(){
					xdwhHandle();
					xzdjHandle();
					jsjsdjHandle();
					jsdjHandle1();
					jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
					jsxzHandle();
					zjlyHandle();
					xdztHandle();
					tsdqHandle();
					jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
					jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
					
					List<Excel_list> l = jhshServer.queryYhdzxDetail_dc(jhsh);
					for (int i = 0; i < l.size(); i++) {
						l.get(i).setV_0((i+1)+"");
					}
					ExcelData eldata=new ExcelData();//创建一个类
					eldata.setTitleName("公路建设计划（养护大中修）");//设置第一行
					eldata.setSheetName("明细表");//设置sheeet名
					eldata.setFileName("公路建设计划（养护大中修）明细表");//设置文件名
					
					eldata.setEl(l);//将实体list放入类中
					List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
					et.add(new Excel_tilte("序号",1,2,0,0));
					et.add(new Excel_tilte("原路线编码",1,2,1,1));
					et.add(new Excel_tilte("新路线编码",1,2,2,2));
					et.add(new Excel_tilte("路线名称",1,2,3,3));
					et.add(new Excel_tilte("起点桩号",1,2,4,4));
					et.add(new Excel_tilte("讫点桩号",1,2,5,5));
					et.add(new Excel_tilte("长度（公里）",1,2,6,6));
					et.add(new Excel_tilte("等级",1,2,7,7));
					et.add(new Excel_tilte("路面宽度（米）",1,2,8,8));
					et.add(new Excel_tilte("工程分类",1,2,9,9));
					et.add(new Excel_tilte("建设方案",1,2,10,10));
					et.add(new Excel_tilte("总投资（万元）",1,2,11,11));
					et.add(new Excel_tilte("",1,1,12,12));
					et.add(new Excel_tilte("已安排的省级以上补助资金（万元）",1,2,13,13));
					et.add(new Excel_tilte("本次下达计划补助资金（万元）",1,1,14,17));
					et.add(new Excel_tilte("施工图批复文号",1,2,18,18));
					et.add(new Excel_tilte("管养单位",1,2,19,19));
					et.add(new Excel_tilte("备注",1,2,20,20));
					et.add(new Excel_tilte("其中：省级以上补助资金（万元）",2,2,12,12));
					et.add(new Excel_tilte("小计",2,2,14,14));
					et.add(new Excel_tilte("拟争取部车购税补助资金",2,2,15,15));
					et.add(new Excel_tilte("燃油税",2,2,16,16));
					et.add(new Excel_tilte("银行贷款",2,2,17,17));
					et.add(new Excel_tilte("1",3,3,0,0));
					et.add(new Excel_tilte("2",3,3,1,1));
					et.add(new Excel_tilte("3",3,3,2,2));
					et.add(new Excel_tilte("4",3,3,3,3));
					et.add(new Excel_tilte("5",3,3,4,4));
					et.add(new Excel_tilte("6",3,3,5,5));
					et.add(new Excel_tilte("7",3,3,6,6));
					et.add(new Excel_tilte("8",3,3,7,7));
					et.add(new Excel_tilte("9",3,3,8,8));
					et.add(new Excel_tilte("10",3,3,9,9));
					et.add(new Excel_tilte("11",3,3,10,10));
					et.add(new Excel_tilte("12",3,3,11,11));
					et.add(new Excel_tilte("13",3,3,12,12));
					et.add(new Excel_tilte("14",3,3,13,13));
					et.add(new Excel_tilte("15",3,3,14,14));
					et.add(new Excel_tilte("16",3,3,15,15));
					et.add(new Excel_tilte("17",3,3,16,16));
					et.add(new Excel_tilte("18",3,3,17,17));
					et.add(new Excel_tilte("19",3,3,18,18));
					et.add(new Excel_tilte("20",3,3,19,19));
					et.add(new Excel_tilte("21",3,3,20,20));
					eldata.setEt(et);//将表头内容设置到类里面
					HttpServletResponse response= getresponse();//获得一个HttpServletResponse
					try {
						Excel_export.excel_export(eldata,response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}  //wdd导出养护大中修明细表excel  end
				
				//wdd导出养护大中修明细表excel  start
				public void exportJhshYhdzxDetailExcel1(){
					xdwhHandle();
					jsdjHandle1();
					xzdjHandle();
					tsdqHandle2();
					jsxzHandle2();
					zjlyHandle();
					xdztHandle();
					jhsh.setXzqhdm(xzqhBm2(jhsh.getXzqhdm(),"xzqhdm2"));
					jhsh.setGhlxbh(MyUtil.getQueryTJ(jhsh.getGhlxbh(), "lxbm"));
					jhsh.setGhxlxbm(MyUtil.getQueryTJiN(jhsh.getGhxlxbm(), "ghlxbm"));
					
					if("1".equals(jhsh.getScxdnf())){
						jhsh.setScxdnf("fun_scxdnf(j.xmbm)");
					}else{
						jhsh.setScxdnf("substr(j.xmbm,0,4)");
					}
					
					List<Excel_list> l = jhshServer.queryYhdzxDetail_dc1(jhsh);
					int k=1;
					for (int i = 0; i < l.size(); i++) {
						if("1".equals(l.get(i).getV_50())) {
							l.get(i).setV_0(k+"");
							k++;
						}
						
					}
					ExcelData eldata=new ExcelData();//创建一个类
					eldata.setTitleName("普通国省道养护大中修工程计划明细表");//设置第一行
					eldata.setSheetName("明细表");//设置sheeet名
					eldata.setFileName("普通国省道养护大中修工程计划明细表");//设置文件名
					
					eldata.setEl(l);//将实体list放入类中
					List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
					et.add(new Excel_tilte("序号",1,2,0,0));
					et.add(new Excel_tilte("地市",1,2,1,1));
					et.add(new Excel_tilte("路线编码",1,2,2,2));
					et.add(new Excel_tilte("原路线编码",1,2,3,3));
					et.add(new Excel_tilte("工程项目名称",1,2,4,4));
					et.add(new Excel_tilte("路网规划前",1,1,5,6));
					et.add(new Excel_tilte("最新年报桩号",1,1,7,8));
					et.add(new Excel_tilte("实施里程（公里）",1,2,9,9));
					et.add(new Excel_tilte("技术等级",1,2,10,10));
					et.add(new Excel_tilte("路面宽度",1,2,11,11));
					et.add(new Excel_tilte("原路面类型",1,2,12,12));
					et.add(new Excel_tilte("原路面结构",1,2,13,13));
					et.add(new Excel_tilte("建设性质",1,2,14,14));
					et.add(new Excel_tilte("施工图批复的技术处治方案",1,2,15,15));
					et.add(new Excel_tilte("总投资（万元）",1,2,16,16));
					et.add(new Excel_tilte("省级补助资金(万元)",1,1,17,18));
					et.add(new Excel_tilte("施工图批复文号",1,2,19,19));
					et.add(new Excel_tilte("管养单位",1,2,20,20));
					et.add(new Excel_tilte("计划下达文号",1,2,21,21));
					et.add(new Excel_tilte("项目编码",1,2,22,22));
					et.add(new Excel_tilte("备注",1,2,23,23));
					et.add(new Excel_tilte("特殊地区",1,2,24,24));
					et.add(new Excel_tilte("起点桩号",2,2,5,5));
					et.add(new Excel_tilte("讫点桩号",2,2,6,6));
					et.add(new Excel_tilte("起点桩号",2,2,7,7));
					et.add(new Excel_tilte("讫点桩号",2,2,8,8));
					et.add(new Excel_tilte("燃油税",2,2,17,17));
					et.add(new Excel_tilte("贷款",2,2,18,18));
					
					/*et.add(new Excel_tilte("1",3,3,0,0));
					et.add(new Excel_tilte("2",3,3,1,1));
					et.add(new Excel_tilte("3",3,3,2,2));
					et.add(new Excel_tilte("4",3,3,3,3));
					et.add(new Excel_tilte("5",3,3,4,4));
					et.add(new Excel_tilte("6",3,3,5,5));
					et.add(new Excel_tilte("7",3,3,6,6));
					et.add(new Excel_tilte("8",3,3,7,7));
					et.add(new Excel_tilte("9",3,3,8,8));
					et.add(new Excel_tilte("10",3,3,9,9));
					et.add(new Excel_tilte("11",3,3,10,10));
					et.add(new Excel_tilte("12",3,3,11,11));
					et.add(new Excel_tilte("13",3,3,12,12));
					et.add(new Excel_tilte("14",3,3,13,13));
					et.add(new Excel_tilte("15",3,3,14,14));
					et.add(new Excel_tilte("16",3,3,15,15));
					et.add(new Excel_tilte("17",3,3,16,16));
					et.add(new Excel_tilte("18",3,3,17,17));
					et.add(new Excel_tilte("19",3,3,18,18));
					et.add(new Excel_tilte("20",3,3,19,19));*/
					eldata.setEt(et);//将表头内容设置到类里面
					HttpServletResponse response= getresponse();//获得一个HttpServletResponse
					try {
						Excel_export.excel_export(eldata,response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}  //wdd导出养护大中修明细表excel  end
				
				
				
	//水毁抢修
	public void queryChildGydw(){
		try {
			List<Jhsh> list = jhshServer.queryChildGydw(jhsh);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//
	public void queryZjByGydwdm(){
		try {
			List<Jhsh> list = jhshServer.queryZjByGydwdm(jhsh);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//
	public void insertOrUpdateShqx(){
		try {
			String[] gydwdm = jhsh.getGydwdm().split(",");
			String[] parent = jhsh.getParent().split(",");
			String[] xdnf = jhsh.getXdnf().split(",");
			String[] cgs = jhsh.getBtzzj().split(",");
			String[] rys = jhsh.getRys().split(",");
			String[] ttc = jhsh.getTtc().split(",");
			String[] dfzc = jhsh.getDfzc().split(",");
			String[] ztz = jhsh.getZtz().split(",");
			String[] jhxdwh = jhsh.getJhxdwh().split(",");
			
			List<Jhsh> save = new ArrayList<Jhsh>();
			List<Jhsh> update = new ArrayList<Jhsh>();
			for (int i = 0; i < gydwdm.length; i++) {
				Jhsh xm = new Jhsh();
				xm.setGydwdm(gydwdm[i]);
				xm.setParent(parent[i]);
				xm.setXdnf(xdnf[i]);
				xm.setBtzzj(cgs[i]);
				xm.setRys(rys[i]);
				xm.setTtc(ttc[i]);
				xm.setDfzc(dfzc[i]);
				xm.setZtz(ztz[i]);
				xm.setJhxdwh(jhxdwh[i]);
				if (jhshServer.queryShqxByOne(xm) == null) {
					save.add(xm);
				} else {
					update.add(xm);
				}
			}
			System.out.println("保存个数：" + save.size());
			System.out.println("修改个数：" + update.size());
			int a = 0;
			if (save.size() > 0) {
				a = jhshServer.insertShqx(save);
			}
			if (update.size() > 0) {
				a = jhshServer.updateShqx(update);
			}
			ResponseUtils.write(getresponse(), (a>0)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//
	public void queryXmlistshqx(){
		jhsh.setGydw(MyUtil.getQueryTJ(jhsh.getGydw(), "gydwdm"));
		
		List<Jhsh> list=jhshServer.queryXmlistshqx(jhsh);
		int count=jhshServer.queryXmlistshqxCount(jhsh);
		EasyUIPage<Jhsh> e=new EasyUIPage<Jhsh>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	
				
}
