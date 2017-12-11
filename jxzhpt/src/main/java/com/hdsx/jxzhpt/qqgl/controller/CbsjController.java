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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.qqgl.bean.Cbsj;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.lxsh.server.WnjhServer;
import com.hdsx.jxzhpt.qqgl.lxsh.server.impl.WnjhServerImpl;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
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
public class CbsjController extends BaseActionSupport implements ModelDriven<Cbsj>{
	//回复数据集合
	private Map<String, Object> result=new HashMap<String, Object>();
	//初步设计路面升级对象
	private Cbsj cbsj=new Cbsj();
	private Plan_upload file;
	//分页参数
	private int page = 1;
	private int rows = 10;
	//上报审核状态，批量操作
	private String sbzt1;
	private String shzt1;
	//上传文件对象参数
	private File uploadSjpf;
	private String uploadSjpfFileName;
	//数据访问对象
	@Resource(name="cbsjServerImpl")
	private CbsjServer cbsjServer;
	@Resource(name="jhshServerImpl")
	private JhshServer jhshServer;
	//导入Excel
	private String fileuploadFileName;
	private File fileupload;
	
	private String ghlxbm;
	private String ghlxmc;
	private String lxmc;
	
	
	
	public String getGhlxbm() {
		return ghlxbm;
	}
	public void setGhlxbm(String ghlxbm) {
		this.ghlxbm = ghlxbm;
	}
	public String getGhlxmc() {
		return ghlxmc;
	}
	public void setGhlxmc(String ghlxmc) {
		this.ghlxmc = ghlxmc;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}
	/**
	 * 分页查询路面升级项目信息
	 * @throws Exception
	 */
	public void queryCbsj() throws Exception{
		try {
			
			if(cbsj.getTsdq().length()>0){
				String[] tsdqs=cbsj.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				cbsj.setTsdq(tsdq);
			}
			xmnfHandle();
			ylxbhHandle();
			xjsdjHandle();
			jsjsdjHandle();
			
			cbsj.setLsxmlx(MyUtil.getQueryTJ2(cbsj.getLsxmnf(),cbsj.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			cbsj.setLsxmnf(MyUtil.getQueryTJ(cbsj.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			
			cbsj.setGhlxbm(cbsj.getGhlxbm());
			cbsj.setGhlxbh(MyUtil.getQueryTJ(cbsj.getGhlxbh(), "lxbm"));
			cbsj.setGhlxbm(MyUtil.getQueryTJ(cbsj.getGhlxbm(), "ghlxbm"));
			cbsj.setXzqhdm(xzqhBm2(cbsj.getXzqhdm(),"xzqhdm2"));
			cbsj.setGhlxmc(cbsj.getGhlxmc());
			cbsj.setLxmc(cbsj.getLxmc());
			
			List<Cbsj> resultData=null;
			int total=0;
			if(cbsj.getXmlx()==1){
				resultData=cbsjServer.queryCbsjLmsj(cbsj, page, rows);
				total=cbsjServer.queryCbsjLmsjCount(cbsj);
			}else if(cbsj.getXmlx()==11){
				if(cbsj.getXmlx1()!=null)
					if(cbsj.getXmlx1().length()>0){
						String[] tsdqs=cbsj.getXmlx1().split(",");
						String tsdq="";
						for (int i = 0; i < tsdqs.length; i++) {
							if("全部".equals(tsdqs[i])){
								tsdq="";
								break;
							}
							if(i==0)
								tsdq+="and(c.xmlx1 like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or c.xmlx1 like '%"+tsdqs[i]+"%'";
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						cbsj.setXmlx1(tsdq);
					}
				resultData = cbsjServer.queryCbsjgsd(cbsj, page, rows);
				total = cbsjServer.queryCbsjgsdCount(cbsj);
			}else if(cbsj.getXmlx()==2){
				resultData = cbsjServer.queryCbsjLmgz(cbsj, page, rows);
				total = cbsjServer.queryCbsjLmgzCount(cbsj);
			}else if(cbsj.getXmlx()==3){
				resultData = cbsjServer.queryCbsjXj(cbsj, page, rows);
				total = cbsjServer.queryCbsjXjCount(cbsj);
			}else if(cbsj.getXmlx()==4){
				/*String gcfl = cbsj.getGcfl();
				if(gcfl.equals("")){
					gcfl=null;
				}else if(gcfl.indexOf(",")>-1){
					String[] gcflArray = gcfl.split(",");
					for (int i = 0; i < gcflArray.length; i++) {
						if(i==0){
							gcfl = "(l.gcfl like '%"+gcflArray[i]+"%'";
						}else if(i==gcflArray.length-1){
							gcfl += " or l.gcfl like '%"+ gcflArray[i] +"%' )";
						}else{
							gcfl += " or l.gcfl like '%" + gcflArray[i] + "%'";
						}
					}
				}else{
					gcfl = "l.gcfl like '%" + gcfl + "%'";
				}
				cbsj.setGcfl(gcfl);*/
				if(cbsj.getXmlx1()!=null)
					if(cbsj.getXmlx1().length()>0){
						String[] tsdqs=cbsj.getXmlx1().split(",");
						String tsdq="";
						for (int i = 0; i < tsdqs.length; i++) {
							if("全部".equals(tsdqs[i])){
								tsdq="";
								break;
							}
							if(i==0)
								tsdq+="and(l.gcfl like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or l.gcfl like '%"+tsdqs[i]+"%'";
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						cbsj.setXmlx1(tsdq);
					}
				cbsj.setXjsdj(cbsj.getXjsdj().replaceAll("xjsdj", "jsdj"));
				resultData = cbsjServer.queryCbsjYhdzx(cbsj, page, rows);
				total = cbsjServer.queryCbsjYhdzxCount(cbsj);
			}else if(cbsj.getXmlx()==5){
				cbsj.setXjsdj(cbsj.getXjsdj().replaceAll("xjsdj", "jsdj"));
				resultData = cbsjServer.queryCbsjSh(cbsj, page, rows);
				total = cbsjServer.queryCbsjShCount(cbsj);
			}
			result.put("rows", resultData);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void shangbaoCbsj(){
		ResponseUtils.write(getresponse(), ""+cbsjServer.shangbaoCbsj(cbsj));
		
	}
	
	
	public void queryCbsjbg() throws Exception{
		try {
			cbsj.setXzqhdm(xzqhBm2(cbsj.getXzqhdm(),"xzqhdm2"));
			if(cbsj.getTsdq().length()>0){
				String[] tsdqs=cbsj.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				cbsj.setTsdq(tsdq);
			}
			xmbmHandle();
			ylxbhHandle();
			xjsdjHandle();
			jsjsdjHandle();
			List<Cbsj> resultData=null;
			int total=0;
			if(cbsj.getXmlx()==1){
				resultData=cbsjServer.queryCbsjLmsjbg(cbsj, page, rows);
				total=cbsjServer.queryCbsjLmsjbgCount(cbsj);
			}else if(cbsj.getXmlx()==2){
				resultData = cbsjServer.queryCbsjLmgzbg(cbsj, page, rows);
				total = cbsjServer.queryCbsjLmgzbgCount(cbsj);
			}else if(cbsj.getXmlx()==3){
				resultData = cbsjServer.queryCbsjXjbg(cbsj, page, rows);
				total = cbsjServer.queryCbsjXjbgCount(cbsj);
			}else if(cbsj.getXmlx()==4){
				String gcfl = cbsj.getGcfl();
				if(gcfl.equals("")){
					gcfl=null;
				}else if(gcfl.indexOf(",")>-1){
					String[] gcflArray = gcfl.split(",");
					for (int i = 0; i < gcflArray.length; i++) {
						if(i==0){
							gcfl = "(l.gcfl like '%"+gcflArray[i]+"%'";
						}else if(i==gcflArray.length-1){
							gcfl += " or l.gcfl like '%"+ gcflArray[i] +"%' )";
						}else{
							gcfl += " or l.gcfl like '%" + gcflArray[i] + "%'";
						}
					}
				}else{
					gcfl = "l.gcfl like '%" + gcfl + "%'";
				}
				cbsj.setGcfl(gcfl);
				cbsj.setXjsdj(cbsj.getXjsdj().replaceAll("xjsdj", "jsdj"));
				resultData = cbsjServer.queryCbsjYhdzxbg(cbsj, page, rows);
				total = cbsjServer.queryCbsjYhdzxbgCount(cbsj);
			}else if(cbsj.getXmlx()==5){
				cbsj.setXjsdj(cbsj.getXjsdj().replaceAll("xjsdj", "jsdj"));
				resultData = cbsjServer.queryCbsjShbg(cbsj, page, rows);
				total = cbsjServer.queryCbsjShbgCount(cbsj);
			}
			result.put("rows", resultData);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	public void loadcbsjTjxx() throws Exception{
		try {
			cbsj.setXzqhdm(xzqhBm2(cbsj.getXzqhdm(),"xzqhdm2"));
			if(cbsj.getTsdq().length()>0){
				String[] tsdqs=cbsj.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				cbsj.setTsdq(tsdq);
			}
			xmnfHandle();
			ylxbhHandle();
			xjsdjHandle();
			jsjsdjHandle();
			cbsj.setLsxmlx(MyUtil.getQueryTJ2(cbsj.getLsxmnf(),cbsj.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			cbsj.setLsxmnf(MyUtil.getQueryTJ(cbsj.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			cbsj.setGhlxbm(cbsj.getGhlxbm());
			cbsj.setGhlxmc(cbsj.getGhlxmc());
			cbsj.setLxmc(cbsj.getLxmc());
			cbsj.setGhlxbh(MyUtil.getQueryTJ(cbsj.getGhlxbh(), "lxbm"));
			cbsj.setGhlxbm(MyUtil.getQueryTJ(cbsj.getGhlxbm(), "ghlxbm"));
			Lxsh l=null;
			if(cbsj.getXmlx()==1){
				l=cbsjServer.loadsjcbsjTjxx(cbsj);
			}else if(cbsj.getXmlx()==11){
				if(cbsj.getXmlx1()!=null)
					if(cbsj.getXmlx1().length()>0){
						String[] tsdqs=cbsj.getXmlx1().split(",");
						String tsdq="";
						for (int i = 0; i < tsdqs.length; i++) {
							if("全部".equals(tsdqs[i])){
								tsdq="";
								break;
							}
							if(i==0)
								tsdq+="and(c.xmlx1 like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or c.xmlx1 like '%"+tsdqs[i]+"%'";
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						cbsj.setXmlx1(tsdq);
					}
				l = cbsjServer.loadgsdcbsjTjxx(cbsj);
			}else if(cbsj.getXmlx()==2){
				l = cbsjServer.loadlmcbsjTjxx(cbsj);
			}else if(cbsj.getXmlx()==3){
				l = cbsjServer.loadxjcbsjTjxx(cbsj);
			}
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	public void loadcbsjbgTjxx() throws Exception{
		try {
			cbsj.setXzqhdm(xzqhBm2(cbsj.getXzqhdm(),"xzqhdm2"));
			if(cbsj.getTsdq().length()>0){
				String[] tsdqs=cbsj.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				cbsj.setTsdq(tsdq);
			}
			xmbmHandle();
			ylxbhHandle();
			xjsdjHandle();
			jsjsdjHandle();
			Lxsh l=null;
			if(cbsj.getXmlx()==1){
				l=cbsjServer.loadsjcbsjbgTjxx(cbsj);
			}else if(cbsj.getXmlx()==2){
				l = cbsjServer.loadlmcbsjbgTjxx(cbsj);
			}else if(cbsj.getXmlx()==3){
				l = cbsjServer.loadxjcbsjbgTjxx(cbsj);
			}
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void queryCbsjLj(){
		xmnfHandle();
		xjsdjHandle();
		jsjsdjHandle();
		ylxbhHandle();
		cbsj.setLsxmlx(MyUtil.getQueryTJ2(cbsj.getLsxmnf(),cbsj.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		cbsj.setLsxmnf(MyUtil.getQueryTJ(cbsj.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
		//System.out.println(cbsj.getLxmc());
		cbsj.setLxmc(cbsj.getLxmc());
		cbsj.setGhlxbm(cbsj.getGhlxbm());
		cbsj.setGhlxmc(cbsj.getGhlxmc());
		cbsj.setLxmc(cbsj.getLxmc());
		cbsj.setGhlxbh(MyUtil.getQueryTJ(cbsj.getGhlxbh(), "lxbm"));
		cbsj.setGhlxbm(MyUtil.getQueryTJ(cbsj.getGhlxbm(), "ghlxbm"));
		
		cbsj.setXzqhdm(xzqhBm2(cbsj.getXzqhdm(),"xzqhdm2"));
		if(cbsj.getTsdq().length()>0){
			String[] tsdqs=cbsj.getTsdq().split(",");
			String tsdq="and(";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="tsdq like '%"+tsdqs[i]+"%'";
				else
					tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			cbsj.setTsdq(tsdq);
		}
		Map<String, String> result = null;
		
		if(cbsj.getXmlx()==4){
			/*String gcfl = cbsj.getGcfl();
			if(gcfl.equals("")){
				gcfl=null;
			}else if(gcfl.indexOf(",")>-1){
				String[] gcflArray = gcfl.split(",");
				for (int i = 0; i < gcflArray.length; i++) {
					if(i==0){
						gcfl = "(l.gcfl like '%"+gcflArray[i]+"%'";
					}else if(i==gcflArray.length-1){
						gcfl += " or l.gcfl like '%"+ gcflArray[i] +"%' )";
					}else{
						gcfl += " or l.gcfl like '%" + gcflArray[i] + "%'";
					}
				}
			}else{
				gcfl = "l.gcfl like '%" + gcfl + "%'";
			}
			cbsj.setGcfl(gcfl);*/
			if(cbsj.getXmlx1()!=null)
				if(cbsj.getXmlx1().length()>0){
					String[] tsdqs=cbsj.getXmlx1().split(",");
					String tsdq="";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="and(l.gcfl like '%"+tsdqs[i]+"%'";
						else
							tsdq+="or l.gcfl like '%"+tsdqs[i]+"%'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					cbsj.setXmlx1(tsdq);
					
					//System.out.println(cbsj.getXmlx1()+"--------------------------");
				}
			
			cbsj.setXjsdj(cbsj.getXjsdj().replaceAll("xjsdj", "jsdj"));
			result = cbsjServer.queryCbsjLjYhdzx(cbsj);
		}else if(cbsj.getXmlx()==5){
			cbsj.setXjsdj(cbsj.getXjsdj().replaceAll("xjsdj", "jsdj"));
			result = cbsjServer.queryCbsjLjSh(cbsj);
		}
		try {
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryCbsjbgLj(){
		xmbmHandle();
		xjsdjHandle();
		jsjsdjHandle();
		ylxbhHandle();
		cbsj.setXzqhdm(xzqhBm(cbsj.getXzqhdm(), "xzqhdm"));
		if(cbsj.getTsdq().length()>0){
			String[] tsdqs=cbsj.getTsdq().split(",");
			String tsdq="and(";
			for (int i = 0; i < tsdqs.length; i++) {
				if("全部".equals(tsdqs[i])){
					tsdq="";
					break;
				}
				if(i==0)
					tsdq+="tsdq like '%"+tsdqs[i]+"%'";
				else
					tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
			}
			if(tsdq==""){
				tsdq="";
			}else{
				tsdq+=")";
			}
			cbsj.setTsdq(tsdq);
		}
		Map<String, String> result = null;
		
		if(cbsj.getXmlx()==4){
			String gcfl = cbsj.getGcfl();
			if(gcfl.equals("")){
				gcfl=null;
			}else if(gcfl.indexOf(",")>-1){
				String[] gcflArray = gcfl.split(",");
				for (int i = 0; i < gcflArray.length; i++) {
					if(i==0){
						gcfl = "(l.gcfl like '%"+gcflArray[i]+"%'";
					}else if(i==gcflArray.length-1){
						gcfl += " or l.gcfl like '%"+ gcflArray[i] +"%' )";
					}else{
						gcfl += " or l.gcfl like '%" + gcflArray[i] + "%'";
					}
				}
			}else{
				gcfl = "l.gcfl like '%" + gcfl + "%'";
			}
			cbsj.setGcfl(gcfl);
			cbsj.setXjsdj(cbsj.getXjsdj().replaceAll("xjsdj", "jsdj"));
			result = cbsjServer.queryCbsjbgLjYhdzx(cbsj);
		}else if(cbsj.getXmlx()==5){
			cbsj.setXjsdj(cbsj.getXjsdj().replaceAll("xjsdj", "jsdj"));
			result = cbsjServer.queryCbsjbgLjSh(cbsj);
		}
		try {
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据项目编码查询计划初步设计信息
	 * @throws Exception
	 */
	public void queryCbsjByXmbm() throws Exception{
		Cbsj object=new Cbsj();
		try {
			if(cbsj.getXmlx()==1){
				object=cbsjServer.queryCbsjLmsjByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==2){
				object = cbsjServer.queryCbsjLmgzByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==3){
				object =cbsjServer.queryCbsjXjByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==4){
				object =cbsjServer.queryCbsjYhdzxByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==5){
				object =cbsjServer.queryCbsjShByXmbm(cbsj.getXmbm());
			}
			if(object!=null)
				object.setXmlx(cbsj.getXmlx());
			JsonUtils.write(object, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码查询计划初步设计信息
	 * @throws Exception
	 */
	public void queryCbsjqxByXmbm() throws Exception{
		Cbsj object=new Cbsj();
		try {
			if(cbsj.getXmlx()==1){
				object=cbsjServer.queryCbsjLmsjqxByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==2){
				object = cbsjServer.queryCbsjLmgzqxByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==3){
				object =cbsjServer.queryCbsjXjqxByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==4){
				object =cbsjServer.queryCbsjYhdzxqxByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==5){
				object =cbsjServer.queryCbsjShqxByXmbm(cbsj.getXmbm());
			}
			if(object!=null)
				object.setXmlx(cbsj.getXmlx());
			JsonUtils.write(object, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void queryCbsjbgByXmbm() throws Exception{
		Cbsj object=new Cbsj();
		try {
			if(cbsj.getXmlx()==1){
				object=cbsjServer.queryCbsjLmsjbgByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==2){
				object = cbsjServer.queryCbsjLmgzbgByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==3){
				object =cbsjServer.queryCbsjXjbgByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==4){
				object =cbsjServer.queryCbsjYhdzxbgByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==5){
				object =cbsjServer.queryCbsjShbgByXmbm(cbsj.getXmbm());
			}
			if(object!=null)
				object.setXmlx(cbsj.getXmlx());
			JsonUtils.write(object, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 修改路面改造初步设计信息
	 * @throws Exception
	 */
	public void updatesgt(){
		boolean bl=false;

		if(cbsj.getXmbm().substring(10,11).equals("1")){
			bl=cbsjServer.updatesjsgt(cbsj);
		}
		if(cbsj.getXmbm().substring(10,11).equals("2")){
			bl=cbsjServer.updatelmsgt(cbsj);
		}
		if(cbsj.getXmbm().substring(10,11).equals("3")){
			bl=cbsjServer.updatexjsgt(cbsj);
		}	
			ResponseUtils.write(getresponse(), bl+"");
	}
	
	public void updateCbsj() throws Exception{
		try{
			boolean b = false;
			System.out.println(cbsj.getYlxbh());
			//准备路线桩号信息
			Lx lx=new Lx();
			lx.setLxbm(cbsj.getYlxbh());
			lx.setQdzh(cbsj.getQdzh());
			lx.setZdzh(cbsj.getZdzh());
			lx.setXmid(cbsj.getXmbm());
			lx.setQdmc(cbsj.getQdmc());
			lx.setZdmc(cbsj.getZdmc());
			lx.setYilc(cbsj.getYilc());
			lx.setErlc(cbsj.getErlc());
			lx.setSanlc(cbsj.getSanlc());
			lx.setSilc(cbsj.getSilc());
			lx.setDwlc(cbsj.getDwlc());
			lx.setWllc(cbsj.getWllc());
			lx.setJhyilc(cbsj.getJhyilc());
			lx.setJherlc(cbsj.getJherlc());
			lx.setJhsanlc(cbsj.getJhsanlc());
			lx.setJhsilc(cbsj.getJhsilc());
			lx.setJhdwlc(cbsj.getJhdwlc());
			lx.setJhwllc(cbsj.getJhwllc());
			lx.setLc(cbsj.getLc());
			lx.setSffirst("1");
			lx.setJdbs(cbsj.getJdbs());
			lx.setGydw(cbsj.getGydw());
			lx.setGydwdm(cbsj.getGydwdm());
			lx.setXzqh(cbsj.getXzqh());
			lx.setXzqhdm(cbsj.getXzqhdm());
			lx.setGhlxbm(cbsj.getGhlxbm());
			lx.setGhqdzh(cbsj.getGhqdzh());
			lx.setGhzdzh(cbsj.getGhzdzh());
			lx.setGxlxbm(cbsj.getGxlxbm());
			lx.setGxqdzh(cbsj.getGxqdzh());
			lx.setGxzdzh(cbsj.getGxzdzh());
			if(cbsj.getXmlx()==1){
				lx.setJhyilc(cbsj.getJhyilc());
				lx.setJherlc(cbsj.getJherlc());
				lx.setJhsanlc(cbsj.getJhsanlc());
				lx.setJhsilc(cbsj.getJhsilc());
				lx.setJhdwlc(cbsj.getJhdwlc());
				lx.setJhwllc(cbsj.getJhwllc());
				b = cbsjServer.updateCbsjLmsj(cbsj);
			}else if(cbsj.getXmlx()==2){
				b=cbsjServer.updateCbsjLmgz(cbsj);
			}else if(cbsj.getXmlx()==3){
				lx.setXjlxbm(cbsj.getXjlxbm());
				lx.setXjqdzh(cbsj.getXjqdzh());
				lx.setXjzdzh(cbsj.getXjzdzh());
				double xjlc=cbsj.getXjzdzh().equals("") ? 0 : Double.parseDouble(cbsj.getXjzdzh())-Double.parseDouble(cbsj.getXjqdzh());
				lx.setXjlc(cbsj.getXjlc()==null ? new Double(xjlc).toString() : cbsj.getXjlc());
				b=cbsjServer.updateCbsjXj(cbsj);
			}else if(cbsj.getXmlx()==4){
				b=cbsjServer.updateCbsjYhdzx(cbsj);
			}else if(cbsj.getXmlx()==5){
				b=cbsjServer.updateCbsjSh(cbsj);
			}
			if(b){
				if(cbsj.getXmlx()==4){
					lx.setJdbs("2");
					jhshServer.updateLx(lx,cbsj);
				}else{
					jhshServer.updateLx(lx);
				}
			}
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码删除信息
	 * @throws Exception
	 */
	public void deleteCbsjByXmbm() throws Exception{
		try {
			boolean b=false;
			if(cbsj.getXmlx()==1){
				b=cbsjServer.deleteLmsjByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==2){
				b = cbsjServer.deleteLmgzByXmbm(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==3){
				b = cbsjServer.deleteXjByXmbm(cbsj.getXmbm());
			}
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void thCbsjByXmbm(){
		ResponseUtils.write(getresponse(), ""+cbsjServer.thCbsjByXmbm(cbsj));
	}
	
	public void thwshcbsj(){
		ResponseUtils.write(getresponse(), ""+cbsjServer.thwshcbsj(cbsj));
	}
	
	/**
	 * 审核流程，修改上报、审核状态
	 * @throws Exception 
	 */
	public void shCbsjByXmbm() throws Exception{
		try {
			boolean b=false;
			if(cbsj.getXmlx()==1){
				b=cbsjServer.shCbsjLmsjByXmbm(cbsj,sbzt1,shzt1);
				if(b && (shzt1!=null && !shzt1.equals(""))){
					jhshServer.insertJhshLmsjFromCbsj(cbsj.getXmbm());
					Lxsh lxsh=new Lxsh();
					lxsh.setXmbm(cbsj.getXmbm());
					WnjhServer w=new WnjhServerImpl();
					lxsh.setXmlx(""+cbsj.getXmlx());
					lxsh.setXmjd("计划");
					w.updateWnxmjd(lxsh);
				}
			}else if(cbsj.getXmlx()==2){
				b = cbsjServer.shCbsjLmgzByXmbm(cbsj,sbzt1,shzt1);
				if(b && (shzt1!=null && !shzt1.equals(""))){
					jhshServer.insertJhshLmgzFromCbsj(cbsj.getXmbm());
					Lxsh lxsh=new Lxsh();
					lxsh.setXmbm(cbsj.getXmbm());
					WnjhServer w=new WnjhServerImpl();
					lxsh.setXmlx(""+cbsj.getXmlx());
					lxsh.setXmjd("计划");
					w.updateWnxmjd(lxsh);
				}
			}else if(cbsj.getXmlx()==3){
				b = cbsjServer.shCbsjXjByXmbm(cbsj,sbzt1,shzt1);
				if(b && (shzt1!=null && !shzt1.equals(""))){
					jhshServer.insertJhshXjFromCbsj(cbsj.getXmbm());
					Lxsh lxsh=new Lxsh();
					lxsh.setXmbm(cbsj.getXmbm());
					WnjhServer w=new WnjhServerImpl();
					lxsh.setXmlx(""+cbsj.getXmlx());
					lxsh.setXmjd("计划");
					w.updateWnxmjd(lxsh);
				}
			}else if(cbsj.getXmlx()==4){
				b = cbsjServer.shCbsjYhdzxByXmbm(cbsj,shzt1);
				jhshServer.insertJhshYhdzxFromCbsj(cbsj.getXmbm());
			}else if(cbsj.getXmlx()==5){
				b = cbsjServer.shCbsjShByXmbm(cbsj,shzt1);
				jhshServer.insertJhshShFromCbsj(cbsj.getXmbm());
			}
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 上传设计批复文件
	 * @throws IOException 
	 */
	public void uploadSjpf() throws Exception{
		try {
			HttpServletResponse response = ServletActionContext.getResponse();
			String fileurl="E:\\江西综合平台上传文件\\sjpfwj\\"+cbsj.getXmbm().substring(0,4)+"\\";
			File file =new File(fileurl);
			if(uploadSjpf!=null){
				String fid=UUID.randomUUID().toString();
				Plan_upload uploads =new Plan_upload(fid,uploadSjpfFileName, "设计批复文件", cbsj.getXmbm(), 
						"E:\\江西综合平台上传文件/sjpfwj/"+cbsj.getXmbm().substring(0,4)+"/"+uploadSjpfFileName, cbsj.getSjpfwh());
				uploads.setFid(fid);
				Plan_upload result = cbsjServer.queryFileByWh(uploads);
				if(result==null && cbsjServer.insertFile(uploads) && cbsjServer.insertFileJl(uploads)){
					uploadFile(file,uploadSjpfFileName);
					response.getWriter().print(uploadSjpfFileName+"上传成功！");
				}else{
					uploads.setFid(result.getId());
					cbsjServer.insertFileJl(uploads);
					response.getWriter().print(uploadSjpfFileName+"上传成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	private void uploadFile(File file,String fileName) throws FileNotFoundException,IOException {
		if(!file.exists()){
			file.mkdirs();
		}
		InputStream is = new FileInputStream(uploadSjpf); 
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
	public void queryFileByWh(){
		try {
			List<Plan_upload> list = cbsjServer.queryxdFileByWh(file);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	public void getWjbyxmbm(){
		try {
			List<Plan_upload> list = cbsjServer.getWjbyxmbm(file);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	public void getWjbytype(){
		try {
			List<Plan_upload> list = cbsjServer.getWjbytype(file);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	public void queryFileByXmbm() throws Exception{
		try {
			List<Plan_upload> list = cbsjServer.queryFileByXmbm(file);
			JsonUtils.write(list, getresponse().getWriter());
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
					result+=" (myxz."+name+" like '%"+s[i]+"%'";
				else
					result+=" or myxz."+name+" like '%"+s[i]+"%'";
			}
			result+=")";
			//System.out.println(result);
			//result= bh.indexOf(",")==-1 ? " x."+name+" like '%"+bh+"%'": "x."+name+" in ("+bh+")";
		}
		return result;
	}
	public void exportExcelCbsj(){
		try {
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			cbsj.setTsdq((String) session.getAttribute("tsdq"));
			
			xmnfHandle();
			ylxbhHandle();
			xjsdjHandle();
			jsjsdjHandle();
			cbsj.setLsxmlx(MyUtil.getQueryTJ2(cbsj.getLsxmnf(),cbsj.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			cbsj.setLsxmnf(MyUtil.getQueryTJ(cbsj.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			
			cbsj.setGhlxbm(cbsj.getGhlxbm());
			cbsj.setGhlxbh(MyUtil.getQueryTJ(cbsj.getGhlxbh(), "lxbm"));
			cbsj.setGhlxbm(MyUtil.getQueryTJ(cbsj.getGhlxbm(), "ghlxbm"));
			cbsj.setXzqhdm(xzqhBm2(cbsj.getXzqhdm(),"xzqhdm2"));
			if(cbsj.getTsdq().length()>0){
				String[] tsdqs=cbsj.getTsdq().split(",");
				String tsdq="and(";
				for (int i = 0; i < tsdqs.length; i++) {
					if("全部".equals(tsdqs[i])){
						tsdq="";
						break;
					}
					if(i==0)
						tsdq+="tsdq like '%"+tsdqs[i]+"%'";
					else
						tsdq+="or tsdq like '%"+tsdqs[i]+"%'";
				}
				if(tsdq==""){
					tsdq="";
				}else{
					tsdq+=")";
				}
				cbsj.setTsdq(tsdq);
			}
			if(",".equals(cbsj.getJsjsdj()))
				cbsj.setJsjsdj("");
			//数据
			List<Excel_list> excelData=new ArrayList<Excel_list>();
			//设置标题、文件名称
			String titleName="";
			String fileName="";
			if(cbsj.getXmlx()==1){
				
				excelData = cbsjServer.queryLmsjExcel(cbsj);
				
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("公路建设工程初步设计(国省道改造改建工程)");//设置第一行 
				eldata.setSheetName("公路建设工程初步设计(国省道改造改建工程)");//设置sheeet名
				eldata.setFileName("公路建设工程初步设计(国省道改造改建工程)");//设置文件名
				eldata.setEl(excelData);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("项目编码",1,1,2,2));
				et.add(new Excel_tilte("行政区划",1,1,3,3));
				et.add(new Excel_tilte("建设单位",1,1,4,4));
				et.add(new Excel_tilte("建设技术等级",1,1,5,5));
				et.add(new Excel_tilte("建设性质",1,1,6,6));
				et.add(new Excel_tilte("原路线编码",1,1,7,7));
				et.add(new Excel_tilte("原路线名称",1,1,8,8));
				et.add(new Excel_tilte("原起点桩号",1,1,9,9));
				et.add(new Excel_tilte("原止点桩号",1,1,10,10));
				et.add(new Excel_tilte("规划路线编码",1,1,11,11));
				et.add(new Excel_tilte("规划路线名称",1,1,12,12));
				et.add(new Excel_tilte("规划起点桩号",1,1,13,13));
				et.add(new Excel_tilte("规划止点桩号",1,1,14,14));
				et.add(new Excel_tilte("共线路线编码",1,1,15,15));
				et.add(new Excel_tilte("共线起点桩号",1,1,16,16));
				et.add(new Excel_tilte("共线止点桩号",1,1,17,17));		
				et.add(new Excel_tilte("里程",1,1,18,18));
				et.add(new Excel_tilte("一级公路",1,1,19,19));
				et.add(new Excel_tilte("二级公路",1,1,20,20));
				et.add(new Excel_tilte("三级公路",1,1,21,21));
				et.add(new Excel_tilte("四级公路",1,1,22,22));
				et.add(new Excel_tilte("等外公路",1,1,23,23));
				et.add(new Excel_tilte("无路",1,1,24,24));
				et.add(new Excel_tilte("建设后一级公路",1,1,25,25));
				et.add(new Excel_tilte("建设后二级公路",1,1,26,26));
				et.add(new Excel_tilte("建设后三级公路",1,1,27,27));
				et.add(new Excel_tilte("建设后四级公路",1,1,28,28));
				et.add(new Excel_tilte("建设后等外公路",1,1,29,29));
				et.add(new Excel_tilte("建设后无路",1,1,30,30));
				et.add(new Excel_tilte("路基(m3)",1,1,31,31));
				et.add(new Excel_tilte("桥梁（座）",1,1,32,32));
				et.add(new Excel_tilte("桥梁（延米）",1,1,33,33));
				et.add(new Excel_tilte("涵洞（座）",1,1,34,34));
				et.add(new Excel_tilte("涵洞（米）",1,1,35,35));
				et.add(new Excel_tilte("隧道（座）",1,1,36,36));
				et.add(new Excel_tilte("隧道（延米）",1,1,37,37));
				et.add(new Excel_tilte("面层类型",1,1,38,38));
				et.add(new Excel_tilte("面层里程",1,1,39,39));
				et.add(new Excel_tilte("基层类型",1,1,40,40));
				et.add(new Excel_tilte("基层里程",1,1,41,41));
				et.add(new Excel_tilte("垫层类别",1,1,42,42));
				et.add(new Excel_tilte("垫层里程",1,1,43,43));
				et.add(new Excel_tilte("大桥名称",1,1,44,44));
				et.add(new Excel_tilte("大桥长度",1,1,45,45));
				et.add(new Excel_tilte("大桥单跨",1,1,46,46));
				et.add(new Excel_tilte("隧道名称",1,1,47,47));
				et.add(new Excel_tilte("隧道双幅长度",1,1,48,48));
				et.add(new Excel_tilte("隧道类型",1,1,49,49));
				et.add(new Excel_tilte("开工时间",1,1,50,50));
				et.add(new Excel_tilte("完工时间",1,1,51,51));
				et.add(new Excel_tilte("工期（月）",1,1,52,52));
				et.add(new Excel_tilte("设计单位",1,1,53,53));
				et.add(new Excel_tilte("设计批复文号",1,1,54,54));
				et.add(new Excel_tilte("批复时间",1,1,55,55));
				et.add(new Excel_tilte("建安费（万元）",1,1,56,56));
				et.add(new Excel_tilte("地方自筹",1,1,57,57));
				et.add(new Excel_tilte("银行贷款",1,1,58,58));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			}else if(cbsj.getXmlx()==11){
				if(cbsj.getXmlx1()!=null)
					if(cbsj.getXmlx1().length()>0){
						String[] tsdqs=cbsj.getXmlx1().split(",");
						String tsdq="";
						for (int i = 0; i < tsdqs.length; i++) {
							if("全部".equals(tsdqs[i])){
								tsdq="";
								break;
							}
							if(i==0)
								tsdq+="and(c.xmlx1 like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or c.xmlx1 like '%"+tsdqs[i]+"%'";
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						cbsj.setXmlx1(tsdq);
					}
				excelData = cbsjServer.querygsdExcel(cbsj);
				
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("公路建设工程初步设计(国省道改造）");//设置第一行 
				eldata.setSheetName("公路建设工程初步设计(国省道改造）");//设置sheeet名
				eldata.setFileName("公路建设工程初步设计(国省道改造）");//设置文件名
				eldata.setEl(excelData);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("项目编码",1,1,2,2));
				et.add(new Excel_tilte("行政区划",1,1,3,3));
				et.add(new Excel_tilte("建设单位",1,1,4,4));
				et.add(new Excel_tilte("建设技术等级",1,1,5,5));
				et.add(new Excel_tilte("建设性质",1,1,6,6));
				et.add(new Excel_tilte("原路线编码",1,1,7,7));
				et.add(new Excel_tilte("原路线名称",1,1,8,8));
				et.add(new Excel_tilte("原起点桩号",1,1,9,9));
				et.add(new Excel_tilte("原止点桩号",1,1,10,10));
				et.add(new Excel_tilte("规划路线编码",1,1,11,11));
				et.add(new Excel_tilte("规划路线名称",1,1,12,12));
				et.add(new Excel_tilte("规划起点桩号",1,1,13,13));
				et.add(new Excel_tilte("规划止点桩号",1,1,14,14));
				et.add(new Excel_tilte("共线路线编码",1,1,15,15));
				et.add(new Excel_tilte("共线起点桩号",1,1,16,16));
				et.add(new Excel_tilte("共线止点桩号",1,1,17,17));		
				et.add(new Excel_tilte("里程",1,1,18,18));
				et.add(new Excel_tilte("一级公路",1,1,19,19));
				et.add(new Excel_tilte("二级公路",1,1,20,20));
				et.add(new Excel_tilte("三级公路",1,1,21,21));
				et.add(new Excel_tilte("四级公路",1,1,22,22));
				et.add(new Excel_tilte("等外公路",1,1,23,23));
				et.add(new Excel_tilte("无路",1,1,24,24));
				et.add(new Excel_tilte("建设后一级公路",1,1,25,25));
				et.add(new Excel_tilte("建设后二级公路",1,1,26,26));
				et.add(new Excel_tilte("建设后三级公路",1,1,27,27));
				et.add(new Excel_tilte("建设后四级公路",1,1,28,28));
				et.add(new Excel_tilte("建设后等外公路",1,1,29,29));
				et.add(new Excel_tilte("建设后无路",1,1,30,30));
				et.add(new Excel_tilte("路基(m3)",1,1,31,31));
				et.add(new Excel_tilte("桥梁（座）",1,1,32,32));
				et.add(new Excel_tilte("桥梁（延米）",1,1,33,33));
				et.add(new Excel_tilte("涵洞（座）",1,1,34,34));
				et.add(new Excel_tilte("涵洞（米）",1,1,35,35));
				et.add(new Excel_tilte("隧道（座）",1,1,36,36));
				et.add(new Excel_tilte("隧道（延米）",1,1,37,37));
				et.add(new Excel_tilte("面层类型",1,1,38,38));
				et.add(new Excel_tilte("面层里程",1,1,39,39));
				et.add(new Excel_tilte("基层类型",1,1,40,40));
				et.add(new Excel_tilte("基层里程",1,1,41,41));
				et.add(new Excel_tilte("垫层类别",1,1,42,42));
				et.add(new Excel_tilte("垫层里程",1,1,43,43));
				et.add(new Excel_tilte("大桥名称",1,1,44,44));
				et.add(new Excel_tilte("大桥长度",1,1,45,45));
				et.add(new Excel_tilte("大桥单跨",1,1,46,46));
				et.add(new Excel_tilte("隧道名称",1,1,47,47));
				et.add(new Excel_tilte("隧道双幅长度",1,1,48,48));
				et.add(new Excel_tilte("隧道类型",1,1,49,49));
				et.add(new Excel_tilte("开工时间",1,1,50,50));
				et.add(new Excel_tilte("完工时间",1,1,51,51));
				et.add(new Excel_tilte("工期（月）",1,1,52,52));
				et.add(new Excel_tilte("设计单位",1,1,53,53));
				et.add(new Excel_tilte("设计批复文号",1,1,54,54));
				et.add(new Excel_tilte("批复时间",1,1,55,55));
				et.add(new Excel_tilte("建安费（万元）",1,1,56,56));
				et.add(new Excel_tilte("地方自筹",1,1,57,57));
				et.add(new Excel_tilte("银行贷款",1,1,58,58));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			}else if(cbsj.getXmlx()==2){
				excelData = cbsjServer.queryLmgzExcel(cbsj);
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("公路建设工程初步设计(国省道改造路面改造工程)");//设置第一行 
				eldata.setSheetName("公路建设工程初步设计(国省道改造路面改造工程)");//设置sheeet名
				eldata.setFileName("公路建设工程初步设计(国省道改造路面改造工程)");//设置文件名
				eldata.setEl(excelData);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("项目编码",1,1,2,2));
				et.add(new Excel_tilte("行政区划",1,1,3,3));
				et.add(new Excel_tilte("建设单位",1,1,4,4));
				et.add(new Excel_tilte("建设技术等级",1,1,5,5));
				et.add(new Excel_tilte("建设性质",1,1,6,6));
				et.add(new Excel_tilte("原路线编码",1,1,7,7));
				et.add(new Excel_tilte("原路线名称",1,1,8,8));
				et.add(new Excel_tilte("原起点桩号",1,1,9,9));
				et.add(new Excel_tilte("原止点桩号",1,1,10,10));
				et.add(new Excel_tilte("规划路线编码",1,1,11,11));
				et.add(new Excel_tilte("规划路线名称",1,1,12,12));
				et.add(new Excel_tilte("规划起点桩号",1,1,13,13));
				et.add(new Excel_tilte("规划止点桩号",1,1,14,14));
				et.add(new Excel_tilte("共线路线编码",1,1,15,15));
				et.add(new Excel_tilte("共线起点桩号",1,1,16,16));
				et.add(new Excel_tilte("共线止点桩号",1,1,17,17));		
				et.add(new Excel_tilte("里程",1,1,18,18));
				et.add(new Excel_tilte("一级公路",1,1,19,19));
				et.add(new Excel_tilte("二级公路",1,1,20,20));
				et.add(new Excel_tilte("三级公路",1,1,21,21));
				et.add(new Excel_tilte("四级公路",1,1,22,22));
				et.add(new Excel_tilte("等外公路",1,1,23,23));
				et.add(new Excel_tilte("无路",1,1,24,24));
				et.add(new Excel_tilte("建设后一级公路",1,1,25,25));
				et.add(new Excel_tilte("建设后二级公路",1,1,26,26));
				et.add(new Excel_tilte("建设后三级公路",1,1,27,27));
				et.add(new Excel_tilte("建设后四级公路",1,1,28,28));
				et.add(new Excel_tilte("建设后等外公路",1,1,29,29));
				et.add(new Excel_tilte("建设后无路",1,1,30,30));
				et.add(new Excel_tilte("路基(m3)",1,1,31,31));
				et.add(new Excel_tilte("桥梁（座）",1,1,32,32));
				et.add(new Excel_tilte("桥梁（延米）",1,1,33,33));
				et.add(new Excel_tilte("涵洞（座）",1,1,34,34));
				et.add(new Excel_tilte("涵洞（米）",1,1,35,35));
				et.add(new Excel_tilte("隧道（座）",1,1,36,36));
				et.add(new Excel_tilte("隧道（延米）",1,1,37,37));
				et.add(new Excel_tilte("面层类型",1,1,38,38));
				et.add(new Excel_tilte("面层里程",1,1,39,39));
				et.add(new Excel_tilte("基层类型",1,1,40,40));
				et.add(new Excel_tilte("基层里程",1,1,41,41));
				et.add(new Excel_tilte("垫层类别",1,1,42,42));
				et.add(new Excel_tilte("垫层里程",1,1,43,43));
				et.add(new Excel_tilte("大桥名称",1,1,44,44));
				et.add(new Excel_tilte("大桥长度",1,1,45,45));
				et.add(new Excel_tilte("大桥单跨",1,1,46,46));
				et.add(new Excel_tilte("隧道名称",1,1,47,47));
				et.add(new Excel_tilte("隧道双幅长度",1,1,48,48));
				et.add(new Excel_tilte("隧道类型",1,1,49,49));
				et.add(new Excel_tilte("开工时间",1,1,50,50));
				et.add(new Excel_tilte("完工时间",1,1,51,51));
				et.add(new Excel_tilte("工期（月）",1,1,52,52));
				et.add(new Excel_tilte("设计单位",1,1,53,53));
				et.add(new Excel_tilte("设计批复文号",1,1,54,54));
				et.add(new Excel_tilte("批复时间",1,1,55,55));
				et.add(new Excel_tilte("建安费（万元）",1,1,56,56));
				et.add(new Excel_tilte("地方自筹",1,1,57,57));
				et.add(new Excel_tilte("银行贷款",1,1,58,58));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			}else if(cbsj.getXmlx()==3){
				excelData = cbsjServer.queryXjExcel(cbsj);
				
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("公路建设工程初步设计(国省道改造新建工程)");//设置第一行 
				eldata.setSheetName("公路建设工程初步设计(国省道改造新建工程)");//设置sheeet名
				eldata.setFileName("公路建设工程初步设计(国省道改造新建工程)");//设置文件名
				eldata.setEl(excelData);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("项目编码",1,1,2,2));
				et.add(new Excel_tilte("行政区划",1,1,3,3));
				et.add(new Excel_tilte("建设单位",1,1,4,4));
				et.add(new Excel_tilte("建设技术等级",1,1,5,5));
				et.add(new Excel_tilte("建设性质",1,1,6,6));
				et.add(new Excel_tilte("原路线编码",1,1,7,7));
				et.add(new Excel_tilte("原路线名称",1,1,8,8));
				et.add(new Excel_tilte("原起点桩号",1,1,9,9));
				et.add(new Excel_tilte("原止点桩号",1,1,10,10));
				et.add(new Excel_tilte("规划路线编码",1,1,11,11));
				et.add(new Excel_tilte("规划路线名称",1,1,12,12));
				et.add(new Excel_tilte("规划起点桩号",1,1,13,13));
				et.add(new Excel_tilte("规划止点桩号",1,1,14,14));
				et.add(new Excel_tilte("共线路线编码",1,1,15,15));
				et.add(new Excel_tilte("共线起点桩号",1,1,16,16));
				et.add(new Excel_tilte("共线止点桩号",1,1,17,17));		
				et.add(new Excel_tilte("里程",1,1,18,18));
				et.add(new Excel_tilte("一级公路",1,1,19,19));
				et.add(new Excel_tilte("二级公路",1,1,20,20));
				et.add(new Excel_tilte("三级公路",1,1,21,21));
				et.add(new Excel_tilte("四级公路",1,1,22,22));
				et.add(new Excel_tilte("等外公路",1,1,23,23));
				et.add(new Excel_tilte("无路",1,1,24,24));
				et.add(new Excel_tilte("建设后一级公路",1,1,25,25));
				et.add(new Excel_tilte("建设后二级公路",1,1,26,26));
				et.add(new Excel_tilte("建设后三级公路",1,1,27,27));
				et.add(new Excel_tilte("建设后四级公路",1,1,28,28));
				et.add(new Excel_tilte("建设后等外公路",1,1,29,29));
				et.add(new Excel_tilte("建设后无路",1,1,30,30));
				et.add(new Excel_tilte("路基(m3)",1,1,31,31));
				et.add(new Excel_tilte("桥梁（座）",1,1,32,32));
				et.add(new Excel_tilte("桥梁（延米）",1,1,33,33));
				et.add(new Excel_tilte("涵洞（座）",1,1,34,34));
				et.add(new Excel_tilte("涵洞（米）",1,1,35,35));
				et.add(new Excel_tilte("隧道（座）",1,1,36,36));
				et.add(new Excel_tilte("隧道（延米）",1,1,37,37));
				et.add(new Excel_tilte("面层类型",1,1,38,38));
				et.add(new Excel_tilte("面层里程",1,1,39,39));
				et.add(new Excel_tilte("基层类型",1,1,40,40));
				et.add(new Excel_tilte("基层里程",1,1,41,41));
				et.add(new Excel_tilte("垫层类别",1,1,42,42));
				et.add(new Excel_tilte("垫层里程",1,1,43,43));
				et.add(new Excel_tilte("大桥名称",1,1,44,44));
				et.add(new Excel_tilte("大桥长度",1,1,45,45));
				et.add(new Excel_tilte("大桥单跨",1,1,46,46));
				et.add(new Excel_tilte("隧道名称",1,1,47,47));
				et.add(new Excel_tilte("隧道双幅长度",1,1,48,48));
				et.add(new Excel_tilte("隧道类型",1,1,49,49));
				et.add(new Excel_tilte("开工时间",1,1,50,50));
				et.add(new Excel_tilte("完工时间",1,1,51,51));
				et.add(new Excel_tilte("工期（月）",1,1,52,52));
				et.add(new Excel_tilte("设计单位",1,1,53,53));
				et.add(new Excel_tilte("设计批复文号",1,1,54,54));
				et.add(new Excel_tilte("批复时间",1,1,55,55));
				et.add(new Excel_tilte("建安费（万元）",1,1,56,56));
				et.add(new Excel_tilte("地方自筹",1,1,57,57));
				et.add(new Excel_tilte("银行贷款",1,1,58,58));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			}else if(cbsj.getXmlx()==4){
				if(cbsj.getXmlx1()!=null)
					if(cbsj.getXmlx1().length()>0){
						String[] tsdqs=cbsj.getXmlx1().split(",");
						String tsdq="";
						for (int i = 0; i < tsdqs.length; i++) {
							if("全部".equals(tsdqs[i])){
								tsdq="";
								break;
							}
							if(i==0)
								tsdq+="and(l.gcfl like '%"+tsdqs[i]+"%'";
							else
								tsdq+="or l.gcfl like '%"+tsdqs[i]+"%'";
						}
						if(tsdq==""){
							tsdq="";
						}else{
							tsdq+=")";
						}
						cbsj.setXmlx1(tsdq);
					}
				cbsj.setXjsdj(cbsj.getXjsdj().replaceAll("xjsdj", "jsdj"));
				excelData = cbsjServer.queryYhdzxExcel(cbsj);
				
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("养护大中修施工图设计");//设置第一行 
				eldata.setSheetName("养护大中修施工图设计");//设置sheeet名
				eldata.setFileName("养护大中修施工图设计");//设置文件名
				eldata.setEl(excelData);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("项目编码",1,1,2,2));
				et.add(new Excel_tilte("行政区划",1,1,3,3));
				et.add(new Excel_tilte("建设单位",1,1,4,4));
				et.add(new Excel_tilte("建设技术等级",1,1,5,5));
				et.add(new Excel_tilte("建设性质",1,1,6,6));
				et.add(new Excel_tilte("原路线编码",1,1,7,7));
				et.add(new Excel_tilte("原路线名称",1,1,8,8));
				et.add(new Excel_tilte("原起点桩号",1,1,9,9));
				et.add(new Excel_tilte("原止点桩号",1,1,10,10));
				et.add(new Excel_tilte("规划路线编码",1,1,11,11));
				et.add(new Excel_tilte("规划路线名称",1,1,12,12));
				et.add(new Excel_tilte("规划起点桩号",1,1,13,13));
				et.add(new Excel_tilte("规划止点桩号",1,1,14,14));
				et.add(new Excel_tilte("共线路线编码",1,1,15,15));
				et.add(new Excel_tilte("共线起点桩号",1,1,16,16));
				et.add(new Excel_tilte("共线止点桩号",1,1,17,17));		
				et.add(new Excel_tilte("里程",1,1,18,18));
				et.add(new Excel_tilte("一级公路",1,1,19,19));
				et.add(new Excel_tilte("二级公路",1,1,20,20));
				et.add(new Excel_tilte("三级公路",1,1,21,21));
				et.add(new Excel_tilte("四级公路",1,1,22,22));
				et.add(new Excel_tilte("等外公路",1,1,23,23));
				et.add(new Excel_tilte("无路",1,1,24,24));
				et.add(new Excel_tilte("面层类型",1,1,25,25));
				et.add(new Excel_tilte("面层里程",1,1,26,26));
				et.add(new Excel_tilte("基层类型",1,1,27,27));
				et.add(new Excel_tilte("基层里程",1,1,28,28));
				et.add(new Excel_tilte("垫层类别",1,1,29,29));
				et.add(new Excel_tilte("垫层里程",1,1,30,30));
				et.add(new Excel_tilte("开工时间",1,1,31,31));
				et.add(new Excel_tilte("完工时间",1,1,32,32));
				et.add(new Excel_tilte("工期（月）",1,1,33,33));
				et.add(new Excel_tilte("设计单位",1,1,34,34));
				et.add(new Excel_tilte("设计批复文号",1,1,35,35));
				et.add(new Excel_tilte("批复时间",1,1,36,36));
				et.add(new Excel_tilte("建设方案",1,1,37,37));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			}else if(cbsj.getXmlx()==5){
				cbsj.setXjsdj(cbsj.getXjsdj().replaceAll("xjsdj", "jsdj"));
				excelData = cbsjServer.queryShExcel(cbsj);
				
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("灾毁恢复重建施工图设计");//设置第一行 
				eldata.setSheetName("灾毁恢复重建施工图设计");//设置sheeet名
				eldata.setFileName("灾毁恢复重建施工图设计");//设置文件名
				eldata.setEl(excelData);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,1,0,0));
				et.add(new Excel_tilte("项目名称",1,1,1,1));
				et.add(new Excel_tilte("项目编码",1,1,2,2));
				et.add(new Excel_tilte("行政区划",1,1,3,3));
				et.add(new Excel_tilte("建设单位",1,1,4,4));
				et.add(new Excel_tilte("建设技术等级",1,1,5,5));
				et.add(new Excel_tilte("建设性质",1,1,6,6));
				et.add(new Excel_tilte("原路线编码",1,1,7,7));
				et.add(new Excel_tilte("原路线名称",1,1,8,8));
				et.add(new Excel_tilte("原起点桩号",1,1,9,9));
				et.add(new Excel_tilte("原止点桩号",1,1,10,10));
				et.add(new Excel_tilte("规划路线编码",1,1,11,11));
				et.add(new Excel_tilte("规划路线名称",1,1,12,12));
				et.add(new Excel_tilte("规划起点桩号",1,1,13,13));
				et.add(new Excel_tilte("规划止点桩号",1,1,14,14));
				et.add(new Excel_tilte("共线路线编码",1,1,15,15));
				et.add(new Excel_tilte("共线起点桩号",1,1,16,16));
				et.add(new Excel_tilte("共线止点桩号",1,1,17,17));		
				et.add(new Excel_tilte("里程",1,1,18,18));
				et.add(new Excel_tilte("一级公路",1,1,19,19));
				et.add(new Excel_tilte("二级公路",1,1,20,20));
				et.add(new Excel_tilte("三级公路",1,1,21,21));
				et.add(new Excel_tilte("四级公路",1,1,22,22));
				et.add(new Excel_tilte("等外公路",1,1,23,23));
				et.add(new Excel_tilte("无路",1,1,24,24));
				et.add(new Excel_tilte("面层类型",1,1,25,25));
				et.add(new Excel_tilte("面层里程",1,1,26,26));
				et.add(new Excel_tilte("基层类型",1,1,27,27));
				et.add(new Excel_tilte("基层里程",1,1,28,28));
				et.add(new Excel_tilte("垫层类别",1,1,29,29));
				et.add(new Excel_tilte("垫层里程",1,1,30,30));
				et.add(new Excel_tilte("开工时间",1,1,31,31));
				et.add(new Excel_tilte("完工时间",1,1,32,32));
				et.add(new Excel_tilte("工期（月）",1,1,33,33));
				et.add(new Excel_tilte("设计单位",1,1,34,34));
				et.add(new Excel_tilte("设计批复文号",1,1,35,35));
				et.add(new Excel_tilte("批复时间",1,1,36,36));
				et.add(new Excel_tilte("建设方案",1,1,37,37));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导入养护大中修初步设计
	 */
	@SuppressWarnings("unchecked")
	public void importExcelYhdzxCbsj(){
		String str="xmmc,xmbm,xzqh,jsdw,jsjsdj,jsxz,ylxbh,qdzh,zdzh,lc,yilc,erlc,sanlc,silc,dwlc,wllc,mc,mc_lc,jc,jc_lc,dc,dc_lc,kgsj,wgsj,gq,sjdw,sjpfwh,pfsj,jsfa";
		try{
			List<Cbsj> list = ExcelImportUtil.readExcel(str, 0, Cbsj.class,fileupload);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setLxbm(cbsj.getYlxbh());
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setYilc(cbsj.getYilc());
				lx.setErlc(cbsj.getErlc());
				lx.setSanlc(cbsj.getSanlc());
				lx.setSilc(cbsj.getSilc());
				lx.setDwlc(cbsj.getDwlc());
				lx.setWllc(cbsj.getWllc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(cbsjServer.updateCbsjYhdzx(list) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入灾毁重建初步设计
	 */
	@SuppressWarnings("unchecked")
	public void importExcelShCbsj(){
		HashMap<String, String> attribute = new HashMap<String, String>();
		
		String str="xmmc,xmbm,xzqh,jsdw,jsjsdj,jsxz,ylxbh,qdzh,zdzh,lc,yilc,erlc,sanlc,silc,dwlc,wllc,mc,mc_lc,jc,jc_lc,dc,dc_lc,kgsj,wgsj,gq,sjdw,sjpfwh,pfsj,jsfa";
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readExcel(str, 0, Cbsj.class,fileupload);
			List<Lx> lxlist = new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setLxbm(cbsj.getYlxbh());
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setYilc(cbsj.getYilc());
				lx.setErlc(cbsj.getErlc());
				lx.setSanlc(cbsj.getSanlc());
				lx.setSilc(cbsj.getSilc());
				lx.setDwlc(cbsj.getDwlc());
				lx.setWllc(cbsj.getWllc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(cbsjServer.updateCbsjSh(list) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入路面改造初步设计
	 */
	@SuppressWarnings("unchecked")
	public void importExcelLmgzCbsj(){
		String str="xmmc,xmbm,xzqh,jsdw,jsjsdj,jsxz,ylxbh,qdzh,zdzh,lc,yilc,erlc,sanlc,silc,dwlc,wllc,lj,ql,ql_ym,hd,hd_m,sd,sd_ym,mc,mc_lc,jc,jc_lc,dc,dc_lc,dq,dq_cd,dq_dk,sdmc," +
				"sd_sfcd,sd_lx,kgsj,wgsj,gq,sjdw,sjpfwh,pfsj,dfzc,yhdk";
		
		HashMap<String, String> attribute = new HashMap<String, String>();
		
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readExcel(str, 0, Cbsj.class,fileupload);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setYilc(cbsj.getYilc());
				lx.setErlc(cbsj.getErlc());
				lx.setSanlc(cbsj.getSanlc());
				lx.setSilc(cbsj.getSilc());
				lx.setDwlc(cbsj.getDwlc());
				lx.setWllc(cbsj.getWllc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(cbsjServer.updateCbsjLmgz(list) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入升级初步设计
	 */
	@SuppressWarnings("unchecked")
	public void importExcelLmsjCbsj(){
		String str="xmmc,xmbm,xzqh,jsdw,jsjsdj,jsxz,ylxbh,qdzh,zdzh,lc,yilc,erlc,sanlc,silc,dwlc,wllc,jhyilc,jherlc,jhsanlc,jhsilc,jhdwlc,jhwllc,lj,ql,ql_ym,hd,hd_m,sd,sd_ym,mc,mc_lc,jc,jc_lc,dc,dc_lc,dq,dq_cd,dq_dk,sdmc," +
				"sd_sfcd,sd_lx,kgsj,wgsj,gq,sjdw,sjpfwh,pfsj,dfzc,yhdk";
		
		HashMap<String, String> attribute = new HashMap<String, String>();
		
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readExcel(str, 0, Cbsj.class,fileupload);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
				lx.setLc(cbsj.getLc());
//				lx.setQdmc(cbsj.getQdmc());
//				lx.setZdmc(cbsj.getZdmc());
				lx.setYilc(cbsj.getYilc());
				lx.setErlc(cbsj.getErlc());
				lx.setSanlc(cbsj.getSanlc());
				lx.setSilc(cbsj.getSilc());
				lx.setDwlc(cbsj.getDwlc());
				lx.setWllc(cbsj.getWllc());
				lx.setJhyilc(cbsj.getJhyilc());
				lx.setJherlc(cbsj.getJherlc());
				lx.setJhsanlc(cbsj.getJhsanlc());
				lx.setJhsilc(cbsj.getJhsilc());
				lx.setJhdwlc(cbsj.getJhdwlc());
				lx.setJhwllc(cbsj.getJhwllc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(cbsjServer.updateCbsjLmsj(list) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入新建项目初步设计
	 */
	@SuppressWarnings("unchecked")
	public void importExcelXjCbsj(){
		String str="xmmc,xmbm,xzqh,jsdw,jsjsdj,jsxz,ylxbh,qdzh,zdzh,xjlxbm,xjqdzh,xjzdzh,yilc,erlc,sanlc,silc,dwlc,wllc,lj,ql,ql_ym,hd,hd_m,sd,sd_ym,mc,mc_lc,jc,jc_lc,dc,dc_lc,dq,dq_cd,dq_dk,sdmc,sd_sfcd,sd_lx,kgsj,wgsj,gq,sjdw,sjpfwh,pfsj,jaf,dfzc,yhdk";
		HashMap<String, String> attribute = new HashMap<String, String>();
		
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try{
			List<Cbsj> list = ExcelImportUtil.readExcel(str, 0, Cbsj.class,fileupload);
			List<Lx> lxlist=new ArrayList<Lx>();
			for (Cbsj cbsj : list) {
				cbsj.setSfbj("1");
				Lx lx=new Lx();
				lx.setQdzh(cbsj.getQdzh());
				lx.setZdzh(cbsj.getZdzh());
				lx.setXmid(cbsj.getXmbm());
				lx.setQdmc(cbsj.getQdmc());
				lx.setZdmc(cbsj.getZdmc());
				lx.setXjlxbm(cbsj.getXjlxbm());
				lx.setXjqdzh(cbsj.getXjqdzh());
				lx.setXjzdzh(cbsj.getXjzdzh());
				lx.setYilc(cbsj.getYilc());
				lx.setErlc(cbsj.getErlc());
				lx.setSanlc(cbsj.getSanlc());
				lx.setSilc(cbsj.getSilc());
				lx.setDwlc(cbsj.getDwlc());
				lx.setWllc(cbsj.getWllc());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(cbsjServer.updateCbsjXj(list) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private void jsjsdjHandle() {
		if(cbsj.getJsjsdj()!=null && !cbsj.getJsjsdj().equals("")){
			String jsjsdj = cbsj.getJsjsdj();
			if(jsjsdj.indexOf(",")>-1){
				String[] split = jsjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsjsdj = "(c.jsjsdj like '"+split[i]+"%'";
					}else if(i==split.length-1){
						jsjsdj += " or c.jsjsdj like '"+split[i]+"%')";
					}else{
						jsjsdj += " or c.jsjsdj like '"+split[i]+"%'";
					}
				}
			}else{
				jsjsdj = "c.jsjsdj like '"+jsjsdj+"%'";
			}
			cbsj.setJsjsdj(jsjsdj);
		}
	}
	private void xjsdjHandle() {
		if(cbsj.getXjsdj()!=null && !cbsj.getXjsdj().equals("")){
			String xjsdj = cbsj.getXjsdj();
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
				}
			}else{
				xjsdj = "l.xjsdj like '"+xjsdj+"%'";
			}
			cbsj.setXjsdj(xjsdj);
		}
	}
	private void xmbmHandle() {
		String xmbm = cbsj.getXmbm();
		if(xmbm.indexOf(",")>-1){
			String[] xmnfArray = xmbm.split(",");
			for (int i = 0; i < xmnfArray.length; i++) {
				if(i==xmnfArray.length-1){
					xmbm += "or c.xmbm like '" + xmnfArray[i] + "%') ";
				}else if(i==0){
					xmbm = "(c.xmbm like '" + xmnfArray[i] + "%' ";
				}else{
					xmbm += "or c.xmbm like '" + xmnfArray[i] + "%' ";
				}
			}
		}else{
			xmbm = "c.xmbm like '" + xmbm + "%' ";
		}
		cbsj.setXmbm(xmbm);
	}
	
	private void xmnfHandle() {
		String xmnf = cbsj.getXmnf();
		if(xmnf.indexOf(",")>-1){
			String[] xmnfArray = xmnf.split(",");
			for (int i = 0; i < xmnfArray.length; i++) {
				if(i==xmnfArray.length-1){
					xmnf += "or c.xmbm like '" + xmnfArray[i] + "%') ";
				}else if(i==0){
					xmnf = "(c.xmbm like '" + xmnfArray[i] + "%' ";
				}else{
					xmnf += "or c.xmbm like '" + xmnfArray[i] + "%' ";
				}
			}
		}else{
			xmnf = "c.xmbm like '" + xmnf + "%' ";
		}
		cbsj.setXmnf(xmnf);
	}
	private void ylxbhHandle() {
		String ylxbh = cbsj.getYlxbh()==null ? "" : cbsj.getYlxbh();
		if(!ylxbh.equals("") && ylxbh!=null){
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
			cbsj.setYlxbh(ylxbh);
		}
	}
	//get set方法
	public Cbsj getCbsj() {
		return cbsj;
	}
	public void setCbsj(Cbsj cbsj) {
		this.cbsj = cbsj;
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
	@Override
	public Cbsj getModel() {
		return cbsj;
	}
	public File getUploadSjpf() {
		return uploadSjpf;
	}
	public void setUploadSjpf(File uploadSjpf) {
		this.uploadSjpf = uploadSjpf;
	}
	public String getUploadSjpfFileName() {
		return uploadSjpfFileName;
	}
	public void setUploadSjpfFileName(String uploadSjpfFileName) {
		this.uploadSjpfFileName = uploadSjpfFileName;
	}
	public String getSbzt1() {
		return sbzt1;
	}
	public void setSbzt1(String sbzt1) {
		this.sbzt1 = sbzt1;
	}
	public String getShzt1() {
		return shzt1;
	}
	public void setShzt1(String shzt1) {
		this.shzt1 = shzt1;
	}
	public Plan_upload getFile() {
		return file;
	}
	public void setFile(Plan_upload file) {
		this.file = file;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
	public void queryFile(){
		List<Plan_upload> filelist = cbsjServer.queryFj();
		Map<String, Object> result =new HashMap<String, Object>();
		result.put("rows", filelist);
		result.put("total", filelist.size());
		try {
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void down(){
		try {
        	HttpServletResponse response = getresponse();
        	file.setFilename(file.getFilename().replace("加号", "+"));
        	Plan_upload queryFjById = cbsjServer.queryFjByName(file);
        	File wj =new File(this.getClass().getResource("/").getPath()+"sjpfwj/"+file.getXmbm()+"/");
        	if(!wj.exists()){
        		wj.mkdirs();
        	}
        	File save =new File(wj,queryFjById.getFilename());
        	OutputStream out = new FileOutputStream(save);
        	response.setContentType("application/x-download");
        	response.addHeader("Content-Disposition", "attachment;filename="+new String(queryFjById.getFilename().getBytes("GBK"),"ISO-8859-1"));
        	byte[] buffer = queryFjById.getFiledata();
        	out.write(buffer);
        	out.flush();
        	out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void readFile() throws FileNotFoundException, IOException{
		File file = new File("E://前期及批复文件数据//工可批复文件");
		if(file.exists()){
			File[] listFiles = file.listFiles();
			System.out.println("开始");
			for (File item : listFiles) {
				List<Plan_upload> queryGkXm = cbsjServer.queryGkXm(item.getName().substring(0, item.getName().indexOf(".")));
				if(queryGkXm.size()>0){
					for (Plan_upload itemGk : queryGkXm) {
						String fid=UUID.randomUUID().toString();
						Plan_upload uploads =new Plan_upload(fid,item.getName(), "工可批复文件", itemGk.getParentid(), 
								"E:\\江西综合平台上传文件/gkpfwj/"+item.getName(), item.getName().substring(0, item.getName().indexOf(".")));
						uploads.setFid(fid);
						Plan_upload result = cbsjServer.queryFileByWh(uploads);
						if(result==null){
							cbsjServer.insertFile(uploads);
							cbsjServer.insertFileJl(uploads);
						}else{
							uploads.setFid(result.getId());
							cbsjServer.insertFileJl(uploads);
						}
					}
				}else{
					String fid=UUID.randomUUID().toString();
					Plan_upload uploads =new Plan_upload(fid,item.getName(), "工可批复文件", null, 
							"E:\\江西综合平台上传文件/gkpfwj/"+item.getName(), item.getName().substring(0, item.getName().indexOf(".")));
					uploads.setFid(fid);
					cbsjServer.insertFile(uploads);
				}
			}
		}
	}
	
	public void readJhxdFile(){
		File file =new File("E://前期及批复文件数据//2011-2015年计划下达文件");
		if(file.exists()){
			File[] listFiles = file.listFiles();
			for (File item : listFiles) {
				List<Plan_upload> queryJhXm = cbsjServer.queryJhXm(item.getName().substring(0, item.getName().indexOf(".")));
				if(queryJhXm.size()>0){
					for (Plan_upload itemp : queryJhXm) {
						String fid=UUID.randomUUID().toString();
						Plan_upload uploads =new Plan_upload(fid,item.getName(), "计划下达文件", itemp.getParentid(), 
								"E:\\江西综合平台上传文件/jhxdwj/"+item.getName(), item.getName().substring(0, item.getName().indexOf(".")));
						uploads.setFid(fid);
						Plan_upload result = cbsjServer.queryFileByWh(uploads);
						if(result==null){
							cbsjServer.insertFile(uploads);
							cbsjServer.insertFileJl(uploads);
						}else{
							uploads.setFid(result.getId());
							cbsjServer.insertFileJl(uploads);
						}
					}
				}else{
					String fid=UUID.randomUUID().toString();
					Plan_upload uploads =new Plan_upload(fid,item.getName(), "计划下达文件", null, 
							"E:\\江西综合平台上传文件/jhxdwj/"+item.getName(), item.getName().substring(0, item.getName().indexOf(".")));
					uploads.setFid(fid);
					cbsjServer.insertFile(uploads);
				}
				
			}
		}
	}
}
