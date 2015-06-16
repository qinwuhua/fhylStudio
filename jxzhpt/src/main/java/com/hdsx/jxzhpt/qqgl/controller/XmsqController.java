package com.hdsx.jxzhpt.qqgl.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jackson.map.util.JSONWrappedObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.XmsqServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Scope("prototype")
@Controller
public class XmsqController extends BaseActionSupport implements ModelDriven<Xmsq>{
	//回复数据集合
	private Map<String, Object> result=new HashMap<String, Object>();
	//计划审核对象
	private Xmsq xmsq=new Xmsq();
	@Override
	public Xmsq getModel() {
		return xmsq;
	}
	//分页参数
	private int page = 1;
	private int rows = 10;
	//添加路线信息字段
	private String qdmc;//起点名称
	private String zdmc;//止点名称
	private String jdbs;//阶段标示
	//数据访问对象
	@Resource(name="xmsqServerImpl")
	private XmsqServer xmsqServer;
	@Resource(name="jhshServerImpl")
	private JhshServer jhshServer;
	/**
	 * 查询下一个项目编码
	 * @throws Exception
	 */
	public void queryNextXmbm() throws Exception{
		try{
			String xmbm=null;
			if(xmsq.getXmlx()==4){
				xmbm = xmsqServer.queryYhdzxNextXmbm();
			}else if(xmsq.getXmlx()==5){
				xmbm = xmsqServer.queryShNextXmbm();
			}
			result.put("xmbm", xmbm);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 提示框列表
	 * @throws Exception
	 */
	public void queryAutoList() throws Exception{
		try{
			JsonUtils.write(xmsqServer.queryAutoList(xmsq), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 查询特殊地区
	 * @throws Exception
	 */
	public void queryTsdq() throws Exception{
		try {
			StringBuffer tsdq= new StringBuffer();
			List<String> list = xmsqServer.queryTsdq(xmsq);
			for (int i = 0; i < list.size(); i++) {
				if(list.size()-1==i){
					tsdq.append(list.get(i));
				}else{
					tsdq.append(list.get(i)+",");
				}
			}
			result.put("tsdq", tsdq.toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 添加项目申请信息
	 * @throws Exception
	 */
	public void insertXmsq() throws Exception{
		try{
			boolean b=false;
			List<Xmsq> list=new ArrayList<Xmsq>();
			xmsq.setLsjl(xmsqServer.queryLsjl(xmsq.getYlxbh(),xmsq.getQdzh(),xmsq.getZdzh())>0 ? "是" : "否");
			list.add(xmsq);
			if(xmsq.getXmlx()==4){
				b = xmsqServer.insertXmsqYhdzx(list);
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.insertXmsqSh(list);
			}
			if(b){
				Lx lx=new Lx(xmsq.getXmbm(), xmsq.getYlxbh(), xmsq.getLxmc(), xmsq.getXzqh(), xmsq.getXzqhdm(), 
						xmsq.getGydw(), xmsq.getGydwdm(), xmsq.getQdzh(), xmsq.getZdzh(), xmsq.getLc(), xmsq.getJsdj(), 
						xmsq.getGcfl(), qdmc, zdmc, "1");
				boolean s= xmsqServer.insertLx(lx);
			}
			result.put("result", new Boolean(b));
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	public void queryXmsq(){
		try {
			List<Xmsq> list=null;
			int total=0;
			xmsq.setGydwdm(xzqhBm(xmsq.getGydwdm(), "gydwdm"));
			xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm"));
			if(xmsq.getXmlx()==4){
				list = xmsqServer.queryYhdzxXmsq(xmsq,page,rows);
				total =xmsqServer.queryYhdzxCount(xmsq);
			}else if(xmsq.getXmlx()==5){
				list = xmsqServer.queryShXmsq(xmsq,page,rows);
				total =xmsqServer.queryShCount(xmsq);
			}
			result.put("rows", list);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除申请项目信息
	 * @throws Exception
	 */
	public void deleteXmsq() throws Exception{
		try{
			boolean b=true;
			if(xmsq.getXmlx()==4){
				 b = xmsqServer.deleteYhdzxByXmbm(xmsq.getXmbm());
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.deleteShByXmbm(xmsq.getXmbm());
			}
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 修改申请状态
	 * @throws Exception
	 */
	public void updateXmsqSbzt() throws Exception{
		//上报流程：初始状态是0， 上报或通过则修改上报状态为 cookie('unit2').length
		try{
			boolean b=true;
			xmsq.setSqzt(xmsq.getXzqhdm().length());
			System.out.println("状态长度："+xmsq.getXzqhdm().length());
			if(xmsq.getXmlx()==4){
				b = xmsqServer.updateYhdzxSqzt(xmsq);
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.updateShSqzt(xmsq);
			}
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 通过申请，并在计划审核中加入数据
	 * @throws Exception
	 */
	public void updateXmsqSp() throws Exception{
		try{
			boolean b=true;
			xmsq.setSqzt(xmsq.getXzqhdm().length());
			if(xmsq.getXmlx()==4){
				b = xmsqServer.updateYhdzxSqzt(xmsq);
				if(b){
					//xmsqServer.insertJhshYhdzx(xmsq);//添加项目申请到计划审核
					//再次修改后，添加到初步设计
					xmsqServer.insertCbsjYhdzx(xmsq);
				}
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.updateShSqzt(xmsq);
				if(b){
					//xmsqServer.insertJhshYhdzx(xmsq);//添加项目申请到计划审核
					//再次修改后，添加到初步设计
					boolean s = xmsqServer.insertCbsjSh(xmsq);
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
	 * 根据项目编码查询项目申请信息
	 * @throws Exception
	 */
	public void queryXmsqByXmbm() throws Exception{
		try{
			Xmsq obj=new Xmsq();
			if(xmsq.getXmlx()==4){
				obj = xmsqServer.queryYhdzxByXmbm(xmsq);
			}else if(xmsq.getXmlx()==5){
				obj = xmsqServer.queryShByXmbm(xmsq);
			}
			JsonUtils.write(obj, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 修改项目申请信息
	 * @throws Exception 
	 */
	public void updateXmsq() throws Exception{
		try{
			boolean b=true;
			//准备路线桩号信息
			Lx lx=new Lx();
			lx.setQdzh(xmsq.getQdzh());
			lx.setZdzh(xmsq.getZdzh());
			lx.setXmid(xmsq.getXmbm());
			lx.setQdmc(qdmc);
			lx.setZdmc(zdmc);
			lx.setSffirst("1");
			lx.setJdbs(jdbs);
			
			if(xmsq.getXmlx()==4){
				b = xmsqServer.updateYhdzx(xmsq);
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.updateSh(xmsq);
			}
			if(b){
				jhshServer.updateLx(lx);
			}
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
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
			result= bh.indexOf(",")==-1 ? " x."+name+" like '%"+bh+"%'": "x."+name+" in ("+bh+")";
		}
		return result;
	}
	//get set
	public Xmsq getXmsq() {
		return xmsq;
	}
	public void setXmsq(Xmsq xmsq) {
		this.xmsq = xmsq;
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
	public String getQdmc() {
		return qdmc;
	}
	public void setQdmc(String qdmc) {
		this.qdmc = qdmc;
	}
	public String getZdmc() {
		return zdmc;
	}
	public void setZdmc(String zdmc) {
		this.zdmc = zdmc;
	}
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
}
