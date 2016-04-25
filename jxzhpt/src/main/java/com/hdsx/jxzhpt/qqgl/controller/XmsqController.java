package com.hdsx.jxzhpt.qqgl.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import net.sf.json.JSONArray;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.common.base.Strings;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.XmsqServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
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
	//数据访问对象
	@Resource(name="xmsqServerImpl")
	private XmsqServer xmsqServer;
	@Resource(name="jhshServerImpl")
	private JhshServer jhshServer;
	//导入Excel
	private String fileuploadFileName;
	private File fileupload;
	private String tbbmbm2;//填报部门编码，用于Excel
	/**
	 * 查询下一个项目编码
	 * @throws Exception
	 */
	public void queryNextXmbm() throws Exception{
		try{
			String xmbm=null;
			if(xmsq.getXmlx()==4){
				xmbm = xmsqServer.queryYhdzxNextXmbm(xmsq);
			}else if(xmsq.getXmlx()==5){
				xmbm = xmsqServer.queryShNextXmbm(xmsq);
			}
			else if(xmsq.getXmlx()==6){
				xmbm = xmsqServer.queryYhzxNextXmbm(xmsq);
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
	 * @throws IOException 
	 * @throws Exception
	 */
	public void sfinsert() throws IOException, Exception{
		int flag = xmsqServer.queryLsjl(xmsq.getYlxbh(),xmsq.getQdzh(),xmsq.getZdzh(),xmsq.getXmbm());
		if(flag>0){
			List<Lx> lxs=xmsqServer.queryLslist(xmsq);
			result.put("result", "have");
			result.put("lx", lxs);
		}else{
			result.put("result", new Boolean(true).toString());
		}
		JsonUtils.write(result, getresponse().getWriter());
	}
	public void insertXmsq() throws Exception{
		try{
			boolean b=false;
			Lx lx=new Lx(xmsq.getXmbm(), xmsq.getYlxbh(), xmsq.getLxmc(), xmsq.getXzqh(), xmsq.getXzqhdm(), 
					xmsq.getGydw(), xmsq.getGydwdm(), xmsq.getQdzh(), xmsq.getZdzh(), xmsq.getLc(), xmsq.getJsdj(), 
					xmsq.getGcfl(), xmsq.getQdmc(), xmsq.getZdmc(), "1");
			lx.setJdbs("1");
			lx.setJsjsdj(xmsq.getJsdj());
			lx.setGpsqdzh(xmsq.getGpsqdzh());
			lx.setGpszdzh(xmsq.getGpszdzh());
			lx.setJsfa(xmsq.getJsfa());
			lx.setYilc(xmsq.getYilc());
			lx.setErlc(xmsq.getErlc());
			lx.setSanlc(xmsq.getSanlc());
			lx.setSilc(xmsq.getSilc());
			lx.setDwlc(xmsq.getDwlc());
			lx.setWllc(xmsq.getWllc());
			List<Xmsq> list=new ArrayList<Xmsq>();
			//xmsq.setLsjl(xmsqServer.queryLsjl(xmsq.getYlxbh(),xmsq.getQdzh(),xmsq.getZdzh(),xmsq.getXmbm())>0 ? "是" : "否");
			list.add(xmsq);
			if(xmsq.getXmlx()==4){
				b = xmsqServer.insertXmsqYhdzx(list);
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.insertXmsqSh(list);
			}
			if(b){
				xmsqServer.insertLx(lx);
			}
			result.put("result", new Boolean(b).toString());
			/*Lx queryHaveLx = xmsq.getXmlx()==4 ? jhshServer.queryHaveLx(lx) : null;
			if(queryHaveLx==null){
				List<Xmsq> list=new ArrayList<Xmsq>();
				xmsq.setLsjl(xmsqServer.queryLsjl(xmsq.getYlxbh(),xmsq.getQdzh(),xmsq.getZdzh(),xmsq.getXmbm())>0 ? "是" : "否");
				list.add(xmsq);
				if(xmsq.getXmlx()==4){
					b = xmsqServer.insertXmsqYhdzx(list);
				}else if(xmsq.getXmlx()==5){
					b = xmsqServer.insertXmsqSh(list);
				}
				if(b){
					xmsqServer.insertLx(lx);
				}
				result.put("result", new Boolean(b).toString());
			}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}*/
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	/**
	 * 添加项目申请信息---养护中心项目
	 * @throws Exception
	 */
	public void insertYhzx() throws Exception{
		try{
			boolean b=false;
			List<Xmsq> list=new ArrayList<Xmsq>();
			list.add(xmsq);
			b = xmsqServer.insertXmsqYhzx(list);
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	public void queryXmsq(){
		try {
			String xmbm = xmsq.getXmbm();
			
			if(!xmbm.equals("")){
				if(xmbm.indexOf(",")>-1){
					/*if(xmbm.indexOf(",") == 0){
						xmbm = xmbm.substring(0);
					}*/
					String[] xmnfArray = xmbm.split(",");
					for (int i = 1; i < xmnfArray.length; i++) {
						if(i==xmnfArray.length-1){
							xmbm += "or x.xmbm like '" + xmnfArray[i] + "%') ";
						}else if(i==1){
							xmbm = "(x.xmbm like '" + xmnfArray[i] + "%' ";
						}else{
							xmbm += "or x.xmbm like '" + xmnfArray[i] + "%' ";
						}
					}
				}else{
					xmbm = "x.xmbm like '" + xmbm + "%' ";
				}
				
				xmsq.setXmbm(xmbm);
			}
			xmsq.setGhlxbm(xmsq.getGhlxbm());
			xmsq.setGhlxmc(xmsq.getGhlxmc());
			jsdjHandle();
			String ylxbh = xmsq.getYlxbh();
			if(ylxbh!=null && !ylxbh.equals("")){
				String[] split1 = ylxbh.split(",");
				ylxbh="";
				for (int i = 0; i < split1.length; i++) {
					ylxbh+=i==split1.length-1 ? "lxbm like '"+split1[i]+"%'" : "lxbm like '"+split1[i]+"%' or ";
				}
				if(ylxbh!=null && ylxbh.equals("")){
					ylxbh = "("+ylxbh+")";
				}
				xmsq.setYlxbh(ylxbh);
			}
			List<Xmsq> list=null;
			int total=0;
			String sss = xmsq.getJsxz();
			String aaa = xmsq.getWnxmk();
			//xmsq.setGydwdm(xzqhBm(xmsq.getGydwdm(), "gydwdm"));
			xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm"));
			xmsq.setJsxz(xmsq.getJsxz());
			xmsq.setWnxmk(xmsq.getWnxmk());
			if(xmsq.getXmlx()==4){
				String gcfl = xmsq.getGcfl();
				if(gcfl!=null && !gcfl.equals("")){
					if(gcfl.indexOf(",")>-1){
						String[] gcflArray = gcfl.split(",");
						for (int i = 0; i < gcflArray.length; i++) {
							if(i==0){
								gcfl = "(x.gcfl like '%"+gcflArray[i]+"%'";
							}else if(i==gcflArray.length-1){
								gcfl += " or x.gcfl like '%"+ gcflArray[i] +"%' )";
							}else{
								gcfl += " or x.gcfl like '%" + gcflArray[i] + "%'";
							}
						}
					}else{
						gcfl = "x.gcfl like '%" + gcfl + "%'";
					}
					xmsq.setGcfl(gcfl);
				}
				if(xmsq.getTsdq().length()>0){
					String[] tsdqs=xmsq.getTsdq().split(",");
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
					xmsq.setTsdq(tsdq);
				}
				list = xmsqServer.queryYhdzxXmsq(xmsq,page,rows);
				total =xmsqServer.queryYhdzxCount(xmsq);
			}else if(xmsq.getXmlx()==5){
				if(xmsq.getTsdq().length()>0){
					String[] tsdqs=xmsq.getTsdq().split(",");
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
					xmsq.setTsdq(tsdq);
				}
				list = xmsqServer.queryShXmsq(xmsq,page,rows);
				total =xmsqServer.queryShCount(xmsq);
			}
			else if(xmsq.getXmlx()==6) {
				list = xmsqServer.queryYhzxXmsq(xmsq,page,rows);
				total =xmsqServer.queryYhzxCount(xmsq);
			}
			result.put("rows", list);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void jsdjHandle() {
		String jsdj = xmsq.getJsdj();
		if(jsdj!=null && !jsdj.equals("")){
			if(jsdj.indexOf(",")>-1){
				String[] split = jsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						jsdj = "(jsdj like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						jsdj += " or jsdj like '%"+split[i]+"%')";
					}else{
						jsdj += " or jsdj like '%"+split[i]+"%'";
					}
				}
			}else{
				jsdj = "jsdj like '%"+jsdj+"%'";
			}
			xmsq.setJsdj(jsdj);
		}
	}
	public void queryLj(){
		String xmbm = xmsq.getXmbm();
		if(xmbm.indexOf(",")>-1){
			String[] xmnfArray = xmbm.split(",");
			for (int i = 0; i < xmnfArray.length; i++) {
				if(i==xmnfArray.length-1){
					xmbm += "or x.xmbm like '" + xmnfArray[i] + "%') ";
				}else if(i==0){
					xmbm = "(x.xmbm like '" + xmnfArray[i] + "%' ";
				}else{
					xmbm += "or x.xmbm like '" + xmnfArray[i] + "%' ";
				}
			}
		}else{
			xmbm = "x.xmbm like '" + xmbm + "%' ";
		}
		xmsq.setXmbm(xmbm);
		xmsq.setGhlxbm(xmsq.getGhlxbm());
		xmsq.setGhlxmc(xmsq.getGhlxmc());
		jsdjHandle();
	//	xmsq.setGydwdm(xzqhBm(xmsq.getGydwdm(), "gydwdm"));
		xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm"));
		xmsq.setJsxz(xmsq.getJsxz());
		xmsq.setWnxmk(xmsq.getWnxmk());
		Map<String, String> result = null;
		if(xmsq.getXmlx()==4){
			String gcfl = xmsq.getGcfl();
			if(gcfl!=null && gcfl.equals("")){
				gcfl=null;
			}else if(gcfl.indexOf(",")>-1){
				String[] gcflArray = gcfl.split(",");
				for (int i = 0; i < gcflArray.length; i++) {
					if(i==0){
						gcfl = "(x.gcfl like '%"+gcflArray[i]+"%'";
					}else if(i==gcflArray.length-1){
						gcfl += " or x.gcfl like '%"+ gcflArray[i] +"%' )";
					}else{
						gcfl += " or x.gcfl like '%" + gcflArray[i] + "%'";
					}
				}
			}else{
				gcfl = "x.gcfl like '%" + gcfl + "%'";
			}
			xmsq.setGcfl(gcfl);
			String ylxbh = xmsq.getYlxbh();
			if(ylxbh!=null && !ylxbh.equals("")){
				String[] split1 = ylxbh.split(",");
				ylxbh="";
				for (int i = 0; i < split1.length; i++) {
					ylxbh+=i==split1.length-1 ? "lxbm like '"+split1[i]+"%'" : "lxbm like '"+split1[i]+"%' or ";
				}
				if(ylxbh!=null && ylxbh.equals("")){
					ylxbh = "("+ylxbh+")";
				}
				xmsq.setYlxbh(ylxbh);
			}
			if(xmsq.getTsdq().length()>0){
				String[] tsdqs=xmsq.getTsdq().split(",");
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
				xmsq.setTsdq(tsdq);
			}
			result = xmsqServer.queryLjYhdzx(xmsq);
		}else if(xmsq.getXmlx()==5){
			if(xmsq.getTsdq().length()>0){
				String[] tsdqs=xmsq.getTsdq().split(",");
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
				xmsq.setTsdq(tsdq);
			}
			result = xmsqServer.queryLjSh(xmsq);
		}
		else if(xmsq.getXmlx()==6){
			result = xmsqServer.queryLjYhzx(xmsq);
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
			else if(xmsq.getXmlx()==6){
				b = xmsqServer.deleteYhzxByXmbm(xmsq.getXmbm());
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
			Lx lx=new Lx();
			lx.setXmid(xmsq.getXmbm());
			lx.setJdbs(xmsq.getJdbs());
			if(xmsq.getXmlx()==4){
				b = xmsqServer.updateYhdzxSqzt(xmsq);
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.updateShSqzt(xmsq);
			}else if (xmsq.getXmlx()==6) {
				b = xmsqServer.updateYhzxSqzt(xmsq);
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
					xmsqServer.insertCbsjYhdzx(xmsq);
				}
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.updateShSqzt(xmsq);
				if(b){
					boolean s = xmsqServer.insertCbsjSh(xmsq);
				}
			}else if(xmsq.getXmlx()==6){
				b = xmsqServer.updateYhzxSqzt(xmsq);
			}
			//路线阶段添加
			if(b){
				Lx lx=new Lx();
				lx.setXmid(xmsq.getXmbm());
				lx.setJdbs(xmsq.getJdbs());
				jhshServer.insertLxJdbs(lx);
			}
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	/**
	 * 通过申请，并在计划审核中加入数据---養護中心項目
	 * @throws Exception
	 */
	public void updateYhzxSp() throws Exception{
		try{
			boolean b=true;
			xmsq.setSqzt(xmsq.getXzqhdm().length());
			b = xmsqServer.updateYhzxSqzt(xmsq);
			if(b){
				xmsqServer.insertJhshYhzx(xmsq);
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
			}else if (xmsq.getXmlx()==6) {
				obj = xmsqServer.queryYhzxByXmbm(xmsq);
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
			lx.setQdmc(xmsq.getQdmc());
			lx.setZdmc(xmsq.getZdmc());
			lx.setYilc(xmsq.getYilc());
			lx.setErlc(xmsq.getErlc());
			lx.setSanlc(xmsq.getSanlc());
			lx.setSilc(xmsq.getSilc());
			lx.setDwlc(xmsq.getDwlc());
			lx.setWllc(xmsq.getWllc());
			lx.setSffirst("1");
			lx.setJdbs(xmsq.getJdbs());
			
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
	 * 修改项目申请信息--养护中心
	 * @throws Exception 
	 */
	public void updateYhzx() throws Exception{
		try{
			boolean b=true;
			b = xmsqServer.updateYhzx(xmsq);
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	public void exportExcelXmsq(){
		try{
			//设置列与字段对应
			String fileTitle="<title=行政区划代码,fieid=xzqhdm>,<title=行政区划,fieid=xzqh>,<title=管养单位,fieid=gydw>,<title=原路线编号,fieid=ylxbh>,<title=路线编号,fieid=ghlxbh>,<title=路线名称,fieid=lxmc>,<title=起点名称,fieid=qdmc>,<title=止点名称,fieid=zdmc>,<title=起点桩号,fieid=qdzh>,<title=止点桩号,fieid=zdzh>,<title=里程,fieid=lc>,<title=一级公路,fieid=yilc>,<title=二级公路,fieid=erlc>,<title=三级公路,fieid=sanlc>,<title=四级公路,fieid=silc>,<title=等外公路,fieid=dwlc>,<title=无路,fieid=wllc>,<title=路面宽度,fieid=lmkd>,<title=技术等级,fieid=jsdj>,<title=项目年份,fieid=xmnf>,<title=项目名称,fieid=xmmc>,<title=工程分类,fieid=gcfl>,<title=计划开工时间,fieid=jhkgsj>,<title=计划完工时间,fieid=jhwgsj>,<title=工期（月）,fieid=gq>,<title=拟投资,fieid=ntz>,<title=建设方案,fieid=jsfa,width=60>,<title=备注,fieid=bz,width=20>,<title=项目编码,fieid=xmbm,hidden=true>";
			//数据
			List<Object> excelData=new ArrayList<Object>();
			//设置标题、文件名称
			String titleName="";
			String fileName="";
			String xmbm = xmsq.getXmbm();
			if(xmbm.indexOf(",")>-1){
				String[] xmnfArray = xmbm.split(",");
				for (int i = 0; i < xmnfArray.length; i++) {
					if(i==xmnfArray.length-1){
						xmbm += "or x.xmbm like '" + xmnfArray[i] + "%') ";
					}else if(i==0){
						xmbm = "(x.xmbm like '" + xmnfArray[i] + "%' ";
					}else{
						xmbm += "or x.xmbm like '" + xmnfArray[i] + "%' ";
					}
				}
			}else{
				xmbm = "x.xmbm like '" + xmbm + "%' ";
			}
			xmsq.setXmbm(xmbm);
			String ylxbh = xmsq.getYlxbh();
			if(ylxbh!=null && !ylxbh.equals("")){
				String[] split1 = ylxbh.split(",");
				ylxbh="";
				for (int i = 0; i < split1.length; i++) {
					ylxbh+=i==split1.length-1 ? "lxbm like '"+split1[i]+"%'" : "lxbm like '"+split1[i]+"%' or ";
				}
				if(ylxbh!=null && ylxbh.equals("")){
					ylxbh = "("+ylxbh+")";
				}
				xmsq.setYlxbh(ylxbh);
			}
			jsdjHandle();
			xmsq.setGydwdm(xzqhBm(xmsq.getGydwdm(), "gydwdm"));
			xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm"));
			if(xmsq.getXmlx()==4){
				titleName="立项审核";
				fileName="养护大中修立项审核";
				if(xmsq.getTsdq().length()>0){
					String[] tsdqs=xmsq.getTsdq().split(",");
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
					xmsq.setTsdq(tsdq);
				}
				excelData = xmsqServer.queryYhdzxExport(xmsq);
			}else if(xmsq.getXmlx()==5){
				titleName="立项审核";
				fileName="灾毁重建立项审核";
				if(xmsq.getTsdq().length()>0){
					String[] tsdqs=xmsq.getTsdq().split(",");
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
					xmsq.setTsdq(tsdq);
				}
				excelData = xmsqServer.queryShExport(xmsq);
			}
			else if(xmsq.getXmlx()==6){
			    fileTitle="<title=项目编码,fieid=xmbm>,<title=项目名称,fieid=xmmc>,<title=行政区划,fieid=xzqh>,<title=管养单位,fieid=gydw>,<title=原道班名称,fieid=ydbmc>,<title=所在路线桩号,fieid=lxzh>,<title=计划开工时间,fieid=jhkgsj>,<title=计划完工时间,fieid=jhwgsj>,<title=备注,fieid=bz,width=20>";
				titleName="立项审核";
				fileName="养护中心立项审核";
				excelData = xmsqServer.queryYhzxExport(xmsq);
			}
			ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,getresponse());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入养护大中修Excel
	 */
	@SuppressWarnings("unchecked")
	public void importExcelYhdzx(){
		System.out.println("无异常");
		//设置列与字段对应
		String str="xzqhdm,xzqh,gydw,ylxbh,ghlxbh,lxmc,qdmc,zdmc,qdzh,zdzh,lc,yilc,erlc,sanlc,silc,dwlc,wllc,lmkd,jsdj,xmnf,xmmc,gcfl,jhkgsj,jhwgsj,gq,ntz,jsfa,bz,xmbm";
		try {
			List<Xmsq> list = ExcelImportUtil.readExcel(str, 0, 2, Xmsq.class,fileupload);
			List<Lx> lxlist=new ArrayList<Lx>();
			
			Calendar cal = Calendar.getInstance();
			boolean inserOrUpdate=true;
			int num=0;
			
			for (Xmsq xmsq : list) {
				if(xmsq.getXmbm()!=null && !xmsq.getXmbm().equals("")){
					inserOrUpdate=false;
				}else{
					if(xmsq.getXmnf()==null)
						xmsq.setXmnf(xmsq.getXmbm().substring(0,4));
					String nextXmbm = xmsqServer.queryYhdzxNextXmbm(xmsq);
					System.out.println(nextXmbm);
					num = num==0 ? new Integer(nextXmbm.substring(nextXmbm.length()-4)).intValue() : num+1;
					xmsq.setXmbm(""+cal.get(Calendar.YEAR)+xmsq.getXzqhdm()+num);
					xmsq.setGydwdm(tbbmbm2);
					List<Lx> lxs=xmsqServer.queryLslist(xmsq);
					xmsq.setLsjl(lxs.size()>0 ? "是" : "否");
					
				}
				xmsq.setGpsqdzh(xmsq.getQdzh());
				xmsq.setGpszdzh(xmsq.getZdzh());
				Lx lx=new Lx(xmsq.getXmbm(), xmsq.getYlxbh(), xmsq.getLxmc(), xmsq.getXzqh(), xmsq.getXzqhdm(), 
						xmsq.getGydw(), xmsq.getGydwdm(), xmsq.getQdzh(), xmsq.getZdzh(), xmsq.getLc(), xmsq.getJsdj(), 
						xmsq.getGcfl(), xmsq.getQdmc(), xmsq.getZdmc(), "1");
				lx.setJdbs("1");
				lx.setJsjsdj(xmsq.getJsdj());
				lx.setGpsqdzh(xmsq.getGpsqdzh());
				lx.setGpszdzh(xmsq.getGpszdzh());
				lx.setJsfa(xmsq.getJsfa());
				lx.setYilc(xmsq.getYilc());
				lx.setErlc(xmsq.getErlc());
				lx.setSanlc(xmsq.getSanlc());
				lx.setSilc(xmsq.getSilc());
				lx.setDwlc(xmsq.getDwlc());
				lx.setWllc(xmsq.getWllc());
				lx.setQdmc(xmsq.getQdmc());
				lx.setZdmc(xmsq.getZdmc());
				lxlist.add(lx);
			}
			if(inserOrUpdate){
				if(xmsqServer.insertXmsqYhdzx(list)){
					if(xmsqServer.insertLx(lxlist)){
						getresponse().getWriter().print(fileuploadFileName+"导入成功！");
					}
				}else{
					getresponse().getWriter().print(fileuploadFileName+"导入失败！");
				}
			}else{
				if(xmsqServer.updateYhdzx(list) && jhshServer.updateLx(lxlist)){
					getresponse().getWriter().print(fileuploadFileName+"导入成功！");
				}else{
					getresponse().getWriter().print(fileuploadFileName+"导入失败！");
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导入灾毁重建Excel
	 */
	@SuppressWarnings("unchecked")
	public void importExcelSh(){
		//设置列与字段对应
		String str="xzqhdm,xzqh,gydw,ylxbh,ghlxbh,lxmc,qdmc,zdmc,qdzh,zdzh,lc,yilc,erlc,sanlc,silc,dwlc,wllc,lmkd,jsdj,xmmc,gcfl,jhkgsj,jhwgsj,gq,ntz,jsfa";
		try {
			List<Xmsq> list = ExcelImportUtil.readExcel(str, 0, 2, Xmsq.class,fileupload);
			List<Lx> lxlist=new ArrayList<Lx>();
			Calendar cal = Calendar.getInstance();
			String nextXmbm=null;
			int num = 0;
			for (Xmsq xmsq : list) {
				nextXmbm = num == 0 ? xmsqServer.queryShNextXmbm(xmsq) : nextXmbm;
				num = num==0 ? new Integer(nextXmbm.substring(nextXmbm.length()-4)).intValue() : num;
				xmsq.setXmbm(""+cal.get(Calendar.YEAR)+xmsq.getXzqhdm()+num);
				num++;
				xmsq.setGydwdm(tbbmbm2);
				xmsq.setGpsqdzh(xmsq.getQdzh());
				xmsq.setGpszdzh(xmsq.getZdzh());
				Lx lx=new Lx(xmsq.getXmbm(), xmsq.getYlxbh(), xmsq.getLxmc(), xmsq.getXzqh(), xmsq.getXzqhdm(), 
						xmsq.getGydw(), xmsq.getGydwdm(), xmsq.getQdzh(), xmsq.getZdzh(), xmsq.getLc(), xmsq.getJsdj(), 
						xmsq.getGcfl(), xmsq.getQdmc(), xmsq.getZdmc(), "1");
				lx.setJdbs("1");
				lx.setJsjsdj(xmsq.getJsdj());
				lx.setGpsqdzh(xmsq.getGpsqdzh());
				lx.setGpszdzh(xmsq.getGpszdzh());
				lx.setYilc(xmsq.getYilc());
				lx.setErlc(xmsq.getErlc());
				lx.setSanlc(xmsq.getSanlc());
				lx.setSilc(xmsq.getSilc());
				lx.setDwlc(xmsq.getDwlc());
				lx.setWllc(xmsq.getWllc());
				lx.setQdmc(xmsq.getQdmc());
				lx.setZdmc(xmsq.getZdmc());
				lx.setJsfa(xmsq.getJsfa());
				xmsq.setLsjl(xmsqServer.queryLsjl(xmsq.getYlxbh(),xmsq.getQdzh(),xmsq.getZdzh(),xmsq.getXmbm())>0 ? "是" : "否");
				lxlist.add(lx);
			}
			if(xmsqServer.insertXmsqSh(list)){
				if(xmsqServer.insertLx(lxlist)){
					getresponse().getWriter().print(fileuploadFileName+"导入成功！");
				}
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询所有的行政区划
	 */
	public void queryAllXzqh(){
		List<TreeNode> result =xmsqServer.queryAllXzqh(xmsq.getXzqhdm());
		TreeNode root = returnRoot1(result,result.get(0));
		List<TreeNode> children1 = new ArrayList<TreeNode>();
		children1.add(result.get(0));
		List<TreeNode> children = root.getChildren();
		children1.get(0).setChildren(children);
		try{
		    String s=JSONArray.fromObject(children1).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryAllGydw(){
		try{
			List<TreeNode> result =xmsqServer.queryAllGydw(xmsq.getGydwdm());
			TreeNode root = returnRoot1(result,result.get(0));
			List<TreeNode> children1 = new ArrayList<TreeNode>();
			children1.add(result.get(0));
			List<TreeNode> children = root.getChildren();
			children1.get(0).setChildren(children);
		    String s=JSONArray.fromObject(children1).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private TreeNode returnRoot1(List<TreeNode> list, TreeNode zzjgTree){
		for(TreeNode temp : list){
			if(temp!=zzjgTree){
				if(temp.getParent() != null &&temp.getParent() !="" && temp.getParent().equals(zzjgTree.getId())){
					zzjgTree.setState("open");
					zzjgTree.getChildren().add(temp);
					returnRoot1(list,temp);
				}
			}
		}
		return zzjgTree;
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
	
	public void loadGldj(){
		try {
			List<TreeNode> resultList1 = new ArrayList<TreeNode>();
			
			List<TreeNode> resultList = new ArrayList<TreeNode>();
			
			List<Map<String, String>> gd = xmsqServer.queryLxFromGpsroadByLevel("G",xmsq.getXzqhdm());
			List<TreeNode> gChildren = new ArrayList<TreeNode>();
			for (Map<String, String> item : gd) {
				TreeNode lx = new TreeNode();
				lx.setId(item.get("ID"));
				lx.setText(item.get("TEXT"));
				gChildren.add(lx);
			}
			TreeNode g = new TreeNode("G","国道",null,gChildren);
			g.setState("closed");
			resultList.add(g);
			List<Map<String, String>> sd =  xmsqServer.queryLxFromGpsroadByLevel("S",xmsq.getXzqhdm());
			List<TreeNode> sChildren = new ArrayList<TreeNode>();
			for (Map<String, String> item : sd) {
				TreeNode lx = new TreeNode();
				lx.setId(item.get("ID"));
				lx.setText(item.get("TEXT"));
				sChildren.add(lx);
			}
			TreeNode s = new TreeNode("S","省道",null,sChildren);
			s.setState("closed");
			resultList.add(s);
			TreeNode x = new TreeNode("X", "县道", null, null);
			resultList.add(x);
			TreeNode xiang = new TreeNode("Y", "乡道", null, null);
			resultList.add(xiang);
			TreeNode c = new TreeNode("C", "村道", null, null);
			resultList.add(c);
			TreeNode z = new TreeNode("Z", "专道", null, null);
			resultList.add(z);
			TreeNode qb = new TreeNode("","全部",null,resultList);
			resultList1.add(qb);
			System.out.println(JSONArray.fromObject(resultList1).toString());
			ResponseUtils.write(getresponse(), JSONArray.fromObject(resultList1).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	public String getTbbmbm2() {
		return tbbmbm2;
	}
	public void setTbbmbm2(String tbbmbm2) {
		this.tbbmbm2 = tbbmbm2;
	}
}
