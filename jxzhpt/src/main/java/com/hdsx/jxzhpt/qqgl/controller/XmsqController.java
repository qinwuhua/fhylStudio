package com.hdsx.jxzhpt.qqgl.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.commons.beanutils.BeanComparator;
import org.apache.commons.collections.comparators.ComparatorChain;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.common.base.Strings;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.XmsqServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.jxzhpt.xtgl.bean.Param;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.jxzhpt.xtgl.server.XtglServer;
import com.hdsx.jxzhpt.xtgl.server.impl.XtglServerImpl;
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
			}else if(xmsq.getXmlx()==1){
				xmbm = xmsqServer.querySjgzNextXmbm(xmsq);
			}
			else if(xmsq.getXmlx()==2){
				xmbm = xmsqServer.queryLmgzNextXmbm(xmsq);
			}else if(xmsq.getXmlx()==3){
				xmbm = xmsqServer.queryXjNextXmbm(xmsq);
			}
			else if(xmsq.getXmlx()==5){
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
	
	
	public void queryAutoghList() throws Exception{
		try{
			if(xmsq.getYlxbh()==null||"".equals(xmsq.getYlxbh()))
				return;
			JsonUtils.write(xmsqServer.queryAutoghList(xmsq), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	public void queryYlmlxByLxInfo(){
		try{
			Lx l = xmsqServer.queryAutoList1(xmsq);
			//System.out.println(l.getYlmlx());
			JsonUtils.write(l, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
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
		/*int flag = xmsqServer.queryLsjl(xmsq.getYlxbh(),xmsq.getQdzh(),xmsq.getZdzh(),xmsq.getXmbm());
		if(flag>0){
			List<Lx> lxs=xmsqServer.queryLslist(xmsq);
			result.put("result", "have");
			result.put("lx", lxs);
		}else{
			List<Lx> lxs=xmsqServer.queryLslist(xmsq);
			if(lxs.size()>1){
				result.put("result", "have");
				result.put("lx", lxs);
			}else{
				result.put("result", new Boolean(true).toString());
			}
		}*/
		List<Lx> l=xmsqServer.queryLsjlxx(xmsq);
		if(l.size()>0){
			result.put("result", "have");
			result.put("lx", l);
		}else{
			result.put("result", new Boolean(true).toString());
		}
		JsonUtils.write(result, getresponse().getWriter());
	}
	public void sfinsert1() throws IOException, Exception{
		//查询项目筛选
		XtglServer x=new XtglServerImpl();
		Param p = x.selectXmsx();
		List<Lx> dlx=new ArrayList<Lx>();//用来删除
		List<Lx> ylx=new ArrayList<Lx>();//用来删除
		List<Lx> lxwn=new ArrayList<Lx>();
		List<Lx> lxserw=new ArrayList<Lx>();
		Jhsh jhsh=new Jhsh();
		jhsh.setXmbm(xmsq.getXmbm());
		ylx=jhshServer.queryylxbxmbm(jhsh);
		if("是".equals(p.getSfwn())){
			lxwn=jhshServer.querywnxmxx(jhsh);
		}
		if("是".equals(p.getSfserw())){
			lxserw=jhshServer.querylxLsxx(jhsh);
		}
		
		lxwn.addAll(lxserw);
		
		for (Lx lx : lxwn) {
			/*if(Integer.parseInt(lx.getXmnf())>Integer.parseInt(xmsq.getXmbm().substring(0, 4))){
				dlx.add(lx);
				continue;
			}*/
			if(lx.getXmbm().equals(xmsq.getXmbm())){
				dlx.add(lx);
				continue;
			}
			if(p.getNd().indexOf(lx.getXmnf())==-1){
				dlx.add(lx);
				continue;
			}
			if("否".equals(p.getSfgj())){
				if("改建".equals(lx.getJsxz())){
					dlx.add(lx);
					continue;
				}
			}
			if("否".equals(p.getSflm())){
				if("路面改造".equals(lx.getJsxz())){
					dlx.add(lx);
					continue;
				}
			}
			if("否".equals(p.getSfxj())){
				if("新建".equals(lx.getJsxz())){
					dlx.add(lx);
					continue;
				}
			}
			if("否".equals(p.getSfzh())){
				if("灾毁恢复重建".equals(lx.getJsxz())){
					dlx.add(lx);
					continue;
				}
			}
			if("否".equals(p.getSfdx())){
				if("大修".equals(lx.getJsxz())){
					dlx.add(lx);
					continue;
				}
			}
			if("否".equals(p.getSfzx())){
				if("中修".equals(lx.getJsxz())){
					dlx.add(lx);
					continue;
				}
			}
			if("否".equals(p.getSfyfx())){
				if(!"改建".equals(lx.getJsxz()) && !"路面改造".equals(lx.getJsxz()) && !"新建".equals(lx.getJsxz()) && !"灾毁恢复重建".equals(lx.getJsxz()) && !"大修".equals(lx.getJsxz()) && !"中修".equals(lx.getJsxz())){
					dlx.add(lx);
					continue;
				}
			}
			
		}
		lxwn.removeAll(dlx);
		
		/*
		ComparatorChain chain = new ComparatorChain();        
		chain.addComparator(new BeanComparator("xmnf"),false);//true,fase正序反序
		Collections.sort(lxwn,chain);*/
		
		if(lxwn.size()==0){
			result.put("result", new Boolean(true).toString());
		}else{
			result.put("result", "have");
			result.put("lx", lxwn);
			result.put("ylx", ylx);
		}
		
		JsonUtils.write(result, getresponse().getWriter());
		
	}
	public void insertXmsq() throws Exception{
		try{
			boolean b=false;
			Lx lx=new Lx(xmsq.getXmbm(), xmsq.getYlxbh(), xmsq.getLxmc(), xmsq.getXzqh(), xmsq.getXzqhdm(), 
					xmsq.getGydw(), xmsq.getGydwdm(), xmsq.getQdzh(), xmsq.getZdzh(), xmsq.getLc(), xmsq.getJsdj(), 
					xmsq.getGcfl(), xmsq.getQdmc(), xmsq.getZdmc(), "1",xmsq.getXzqhdm2());
			lx.setGhlxbm(xmsq.getGhlxbm());
			lx.setGhqdzh(xmsq.getGhqdzh());
			lx.setGhzdzh(xmsq.getGhzdzh());
			lx.setGxlxbm(xmsq.getGxlxbm());
			lx.setGxqdzh(xmsq.getGxqdzh());
			lx.setGxzdzh(xmsq.getGxzdzh());
			lx.setGhlxmc(xmsq.getGhlxmc());
			if(xmsq.getXmlx()==5){
				lx.setJdbs("0");
			}else{
				lx.setJdbs("1");
			}
			if(xmsq.getXmlx()==4||xmsq.getXmlx()==5){
				Xmsq xmsq3=new Xmsq();
				xmsq3.setXmbm(xmsq.getXmbm());
				xmsq3.setYlxbh(xmsq.getGhlxbm());
				xmsq3.setQdzh(xmsq.getGhqdzh());
				xmsq3.setZdzh(xmsq.getGhzdzh());
				Lx x = xmsqServer.querysfwnxmk(xmsq3);
				//List<Lx> l = xmsqServer.queryLslistwnxmk(xmsq);
				xmsq.setWnxmk(x.getWnxmk());
				if("是".equals(x.getWnxmk())){
				xmsq.setWnnfxz(x.getWnnfxz());
				xmsq.setWnxmbm(x.getWnxmbm());
				xmsq.setWnxmid(x.getWnxmid());}
			}
			lx.setXzqhdm2(xmsq.getXzqhdm2());
			lx.setXzqhmc2(xmsq.getXzqh());
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
			lx.setLmkd(xmsq.getLmkd());
			List<Xmsq> list=new ArrayList<Xmsq>();
			Xmsq xmsq3=new Xmsq();
			xmsq3.setXmbm(xmsq.getXmbm());
			xmsq3.setYlxbh(xmsq.getGhlxbm());
			xmsq3.setQdzh(xmsq.getGhqdzh());
			xmsq3.setZdzh(xmsq.getGhzdzh());
			Lx x2 = xmsqServer.querysflsjl(xmsq3);
			xmsq.setLsjl(x2.getLsjl());
			if("是".equals(x2.getLsjl())){
			xmsq.setLsxmbm(x2.getLsxmbm());
			xmsq.setLsxmid(x2.getLsxmid());
			}
			
			//Lx queryHaveLx = xmsq.getXmlx()==4 ? jhshServer.queryHaveLx(lx) : null;
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
			if(queryHaveLx!=null){
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}else{
				list.add(xmsq);
				if(xmsq.getXmlx()==4){
					b = xmsqServer.insertXmsqYhdzx(list);
				}else if(xmsq.getXmlx()==5){
					b = xmsqServer.insertXmsqSh(list);
				}
				if(b){
					if(xmsq.getXmlx()==4)
					xmsqServer.insertLx(lx,xmsq);
					else
					xmsqServer.insertLx(lx);	
				}
				
				result.put("result", new Boolean(b).toString());
			}
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
	public void queryXmsqbyyhc(){
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
				
				//xmsq.setXmbm(xmbm);
				xmsq.setXmbm("substr(x.xmbm,0,4) in ("+xmsq.getXmbm()+")");
				
			}
			xmsq.setGhlxbm(xmsq.getGhlxbm());
			xmsq.setGhlxmc(xmsq.getGhlxmc());
			xmsq.setLsxmlx(MyUtil.getQueryTJ2(xmsq.getLsxmnf(),xmsq.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			xmsq.setLsxmnf(MyUtil.getQueryTJ(xmsq.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			
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
			xmsq.setGhlxbh(MyUtil.getQueryTJ(xmsq.getGhlxbh(), "lxbm"));
			xmsq.setGhlxbm(MyUtil.getQueryTJ(xmsq.getGhlxbm(), "ghlxbm"));
			
			xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm2"));
			xmsq.setJsxz(xmsq.getJsxz());
			xmsq.setWnxmk(xmsq.getWnxmk());
			if(xmsq.getXmlx()==4){
				String gcfl = xmsq.getJsxz();
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
				//System.out.println(xmsq.getJsxz());
				list = xmsqServer.queryYhdzxXmsqbyyhc(xmsq,page,rows);
				total =xmsqServer.queryYhdzxCountbyyhc(xmsq);
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
				list = xmsqServer.queryShXmsqbyyhc(xmsq,page,rows);
				total =xmsqServer.queryShCountbyyhc(xmsq);
			}
			
			result.put("rows", list);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	public void queryXmsq(){
		try {
			
			if(!xmsq.getXmnf().equals("")){
				/*if(xmbm.indexOf(",")>-1){
					if(xmbm.indexOf(",") == 0){
						xmbm = xmbm.substring(0);
					}
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
				}*/
				
				//xmsq.setXmnf(xmbm);
				xmsq.setXmnf("substr(x.xmbm,0,4) in ("+xmsq.getXmnf()+")");
				
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
			xmsq.setGhlxbh(MyUtil.getQueryTJ(xmsq.getGhlxbh(), "lxbm"));
			xmsq.setGhlxbm(MyUtil.getQueryTJ(xmsq.getGhlxbm(), "ghlxbm"));
			
			xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm2"));
			xmsq.setJsxz(xmsq.getJsxz());
			xmsq.setWnxmk(xmsq.getWnxmk());
			xmsq.setLsxmlx(MyUtil.getQueryTJ2(xmsq.getLsxmnf(),xmsq.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			xmsq.setLsxmnf(MyUtil.getQueryTJ(xmsq.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			if(xmsq.getXmlx()==4){
				String gcfl = xmsq.getJsxz();
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
				//System.out.println(xmsq.getJsxz());
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
		try {
		String xmbm = xmsq.getXmnf();
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
		xmsq.setXmnf(xmbm);
		xmsq.setGhlxbm(xmsq.getGhlxbm());
		xmsq.setGhlxmc(xmsq.getGhlxmc());
		xmsq.setLsxmlx(MyUtil.getQueryTJ2(xmsq.getLsxmnf(),xmsq.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		xmsq.setLsxmnf(MyUtil.getQueryTJ(xmsq.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
		
		jsdjHandle();
	//	xmsq.setGydwdm(xzqhBm(xmsq.getGydwdm(), "gydwdm"));
		xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm2"));
		xmsq.setJsxz(xmsq.getJsxz());
		xmsq.setWnxmk(xmsq.getWnxmk());
		xmsq.setGhlxbh(MyUtil.getQueryTJ(xmsq.getGhlxbh(), "lxbm"));
		xmsq.setGhlxbm(MyUtil.getQueryTJ(xmsq.getGhlxbm(), "ghlxbm"));
		
		Map<String, String> result = null;
		if(xmsq.getXmlx()==4){
			String gcfl = xmsq.getJsxz();
			if(gcfl==null || gcfl.equals("")){
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
		
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void queryLjbyyhc(){
		try {
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
		xmsq.setLsxmlx(MyUtil.getQueryTJ2(xmsq.getLsxmnf(),xmsq.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		xmsq.setLsxmnf(MyUtil.getQueryTJ(xmsq.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
		xmsq.setGhlxbh(MyUtil.getQueryTJ(xmsq.getGhlxbh(), "lxbm"));
		xmsq.setGhlxbm(MyUtil.getQueryTJ(xmsq.getGhlxbm(), "ghlxbm"));
		
	//	xmsq.setGydwdm(xzqhBm(xmsq.getGydwdm(), "gydwdm"));
		xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm2"));
		xmsq.setJsxz(xmsq.getJsxz());
		xmsq.setWnxmk(xmsq.getWnxmk());
		Map<String, String> result = null;
		if(xmsq.getXmlx()==4){
			String gcfl = xmsq.getJsxz();
			if(gcfl==null || gcfl.equals("")){
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
			result = xmsqServer.queryLjYhdzxbyyhc(xmsq);
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
			result = xmsqServer.queryLjShbyyhc(xmsq);
		}
		
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
				b = xmsqServer.updateYhdzxSqztyhc(xmsq);
				if(b){
					List<Xmsq> x=xmsqServer.queryyhdzxcb(xmsq);
					String xmbm=xmsq.getXmbm();
					if(x.size()>0)
					for (Xmsq xm : x) {
						if(xmbm.indexOf(xm.getXmbm())>-1)
							xmbm=xmbm.replaceAll(xm.getXmbm(), "");
					}
					if(xmbm!=null||!"".equals(xmbm))
					xmsq.setXmbm(xmbm);
					xmsqServer.insertCbsjYhdzx(xmsq);
				}
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.updateShSqztyhc(xmsq);
				if(b){
					//boolean s = xmsqServer.insertCbsjSh(xmsq);
					//修改灾毁流程，如果修改回去则用上边的那个
					boolean s1 = xmsqServer.insertCbsjShls(xmsq);
					
				}
			}else if(xmsq.getXmlx()==6){
				b = xmsqServer.updateYhzxSqzt(xmsq);
			}
			//路线阶段添加
			if(xmsq.getXmlx()==5){
				if(b){
					Lx lx=new Lx();
					lx.setXmid(xmsq.getXmbm());
					lx.setJdbs("0");
					jhshServer.insertLxJdbs(lx);
				}
			}else{
				if(b){
					Lx lx=new Lx();
					lx.setXmid(xmsq.getXmbm());
					lx.setJdbs(xmsq.getJdbs());
					jhshServer.insertLxJdbs(lx);
				}
			}
			
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	
	//
	/**
	 * 通过申请，并在计划审核中加入数据
	 * @throws Exception
	 */
	public void updateXmsqSpzgc() throws Exception{
		
		try{
			boolean b=true;
			xmsq.setSqzt(xmsq.getXzqhdm().length());
			if(xmsq.getXmlx()==4){
				b = xmsqServer.updateYhdzxSqzt(xmsq);
				/*if(b){
					List<Xmsq> x=xmsqServer.queryyhdzxcb(xmsq);
					String xmbm=xmsq.getXmbm();
					if(x.size()>0)
					for (Xmsq xm : x) {
						if(xmbm.indexOf(xm.getXmbm())>-1)
							xmbm=xmbm.replaceAll(xm.getXmbm(), "");
					}
					if(xmbm!=null||!"".equals(xmbm))
					xmsq.setXmbm(xmbm);
					xmsqServer.insertCbsjYhdzx(xmsq);
				}*/
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.updateShSqzt(xmsq);
				/*if(b){
					//boolean s = xmsqServer.insertCbsjSh(xmsq);
					//修改灾毁流程，如果修改回去则用上边的那个
					boolean s1 = xmsqServer.insertCbsjShls(xmsq);
					
				}*/
			}
			//路线阶段添加
			/*if(xmsq.getXmlx()==5){
				if(b){
					Lx lx=new Lx();
					lx.setXmid(xmsq.getXmbm());
					lx.setJdbs("0");
					jhshServer.insertLxJdbs(lx);
				}
			}else{
				if(b){
					Lx lx=new Lx();
					lx.setXmid(xmsq.getXmbm());
					lx.setJdbs(xmsq.getJdbs());
					jhshServer.insertLxJdbs(lx);
				}
			}*/
			
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	
	
	
	
	public void updateXmsqthSp() throws Exception{
		try{
			boolean b=true;
			xmsq.setSqzt(xmsq.getXzqhdm().length()+2);
			if(xmsq.getXmlx()==4){
				b = xmsqServer.updateYhdzxSqzt(xmsq);
				
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
	 * 根据项目编码查询项目申请信息
	 * @throws Exception
	 */
	public void queryXmsqqxByXmbm() throws Exception{
		try{
			Xmsq obj=new Xmsq();
			if(xmsq.getXmlx()==4){
				obj = xmsqServer.queryYhdzxqxByXmbm(xmsq);
			}else if(xmsq.getXmlx()==5){
				obj = xmsqServer.queryShqxByXmbm(xmsq);
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
			xmsq.setLxbm(xmsq.getYlxbh());
			lx.setLxbm(xmsq.getYlxbh());
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
			lx.setGhlxbm(xmsq.getGhlxbm());
			lx.setGhqdzh(xmsq.getGhqdzh());
			lx.setGhzdzh(xmsq.getGhzdzh());
			lx.setGxlxbm(xmsq.getGxlxbm());
			lx.setGxqdzh(xmsq.getGxqdzh());
			lx.setGxzdzh(xmsq.getGxzdzh());
			lx.setGhlxmc(xmsq.getGhlxmc());
			lx.setXmbm1(xmsq.getXmbm1());
			if(xmsq.getXmlx()==5){
				xmsq.setJdbs("0");
			}else{
				xmsq.setJdbs("1");
			}
			String bz=xmsq.getBz();
			Xmsq xmsq3=new Xmsq();
			xmsq3.setXmbm(xmsq.getXmbm());
			xmsq3.setYlxbh(xmsq.getGhlxbm());
			xmsq3.setQdzh(xmsq.getGhqdzh());
			xmsq3.setZdzh(xmsq.getGhzdzh());
			xmsq3.setBz("lxsh_lx where 1=1 and sffirst!='1' and jdbs='"+xmsq.getJdbs()+"'");
			Lx x = xmsqServer.querysfwnxmkdg(xmsq3);
			//List<Lx> l = xmsqServer.queryLslistwnxmk(xmsq);
			xmsq.setWnxmk(x.getWnxmk());
			if("是".equals(x.getWnxmk())){
			xmsq.setWnnfxz(x.getWnnfxz());
			xmsq.setWnxmbm(x.getWnxmbm());
			xmsq.setWnxmid(x.getWnxmid());}
			
			Lx x2 = xmsqServer.querysflsjldg(xmsq3);
			xmsq.setLsjl(x2.getLsjl());
			if("是".equals(x2.getLsjl())){
			xmsq.setLsxmbm(x2.getLsxmbm());
			xmsq.setLsxmid(x2.getLsxmid());
			}
			xmsq.setBz(bz);
			if(xmsq.getXmlx()==4){
				b = xmsqServer.updateYhdzx(xmsq);
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.updateSh(xmsq);
			}
			if(b){
				if(xmsq.getXmlx()==5){
					lx.setJdbs("0");
					jhshServer.updateLxqwh(lx);
				}else{
					lx.setJdbs("1");
					//jhshServer.updateLx(lx,xmsq);
					jhshServer.updateLxshm(lx,xmsq);
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
			String fileTitle="<title=项目编码,fieid=xmbm>,<title=项目名称,fieid=xmmc>,<title=行政区划代码,fieid=xzqhdm>,<title=行政区划,fieid=xzqh>,<title=管养单位,fieid=gydw>,<title=原路线编码,fieid=ylxbh>,<title=原路线名称,fieid=lxmc>,<title=原起点桩号,fieid=qdzh>,<title=原止点桩号,fieid=zdzh>,<title=规划路线编码,fieid=ghlxbm>,<title=规划路线名称,fieid=ghlxmc>,<title=规划起点桩号,fieid=ghqdzh>,<title=规划止点桩号,fieid=ghzdzh>,<title=共线路线编码,fieid=gxlxbm>,<title=共线起点桩号,fieid=gxqdzh>,<title=共线止点桩号,fieid=gxzdzh>,<title=起点名称,fieid=qdmc>,<title=止点名称,fieid=zdmc>,<title=里程,fieid=lc>,<title=一级公路,fieid=yilc>,<title=二级公路,fieid=erlc>,<title=三级公路,fieid=sanlc>,<title=四级公路,fieid=silc>,<title=等外公路,fieid=dwlc>,<title=无路,fieid=wllc>,<title=路面宽度,fieid=lmkd>,<title=技术等级,fieid=jsdj>,<title=项目年份,fieid=xmnf>,<title=工程分类,fieid=gcfl>,<title=计划开工时间,fieid=jhkgsj>,<title=计划完工时间,fieid=jhwgsj>,<title=工期（月）,fieid=gq>,<title=总投资,fieid=ntz>,<title=建设方案,fieid=jsfa,width=60>,<title=备注,fieid=bz,width=20>,<title=项目编码,fieid=xmbm,hidden=true>";
			//数据
			List<Object> excelData=new ArrayList<Object>();
			//设置标题、文件名称
			String titleName="";
			String fileName="";
			String xmbm = xmsq.getXmnf();
			
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			String tsdqS=(String) session.getAttribute("tsdq");
			xmsq.setTsdq(tsdqS);
			
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
			xmsq.setXmnf(xmbm);
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
			xmsq.setGhlxbh(MyUtil.getQueryTJ(xmsq.getGhlxbh(), "lxbm"));
			xmsq.setGhlxbm(MyUtil.getQueryTJ(xmsq.getGhlxbm(), "ghlxbm"));
			
			xmsq.setGydwdm(xzqhBm(xmsq.getGydwdm(), "gydwdm"));
//			xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm"));
			
			xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm2"));
			xmsq.setWnxmk(xmsq.getWnxmk());
			xmsq.setLsxmlx(MyUtil.getQueryTJ2(xmsq.getLsxmnf(),xmsq.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			xmsq.setLsxmnf(MyUtil.getQueryTJ(xmsq.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			
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
	
	public void exportExcelXmsqZhcj(){
		
			List<Excel_list>  l=new ArrayList<Excel_list>();
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			String tsdqS=(String) session.getAttribute("tsdq");
			xmsq.setTsdq(tsdqS);
			
			String xmbm = xmsq.getXmnf();
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
			xmsq.setXmnf(xmbm);
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
			xmsq.setGhlxbh(MyUtil.getQueryTJ(xmsq.getGhlxbh(), "lxbm"));
			xmsq.setGhlxbm(MyUtil.getQueryTJ(xmsq.getGhlxbm(), "ghlxbm"));
			
			xmsq.setGydwdm(xzqhBm(xmsq.getGydwdm(), "gydwdm"));
			
			xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm2"));
			xmsq.setWnxmk(xmsq.getWnxmk());
			xmsq.setLsxmlx(MyUtil.getQueryTJ2(xmsq.getLsxmnf(),xmsq.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
			xmsq.setLsxmnf(MyUtil.getQueryTJ(xmsq.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
			
		 if(xmsq.getXmlx()==5){
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
				
				l = xmsqServer.queryZhcjExport(xmsq);
			}
		 
		    ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("灾毁恢复重建建议计划表");//设置第一行
			eldata.setSheetName("灾毁恢复重建");//设置sheeet名
			eldata.setFileName("灾毁恢复重建建议计划表");//设置文件名
			
			eldata.setEl(l);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,1,0,0));
			et.add(new Excel_tilte("项目编码",1,1,1,1));
			et.add(new Excel_tilte("项目名称",1,1,2,2));
			et.add(new Excel_tilte("行政区划代码",1,1,3,3));
			et.add(new Excel_tilte("行政区划",1,1,4,4));
			et.add(new Excel_tilte("管养单位",1,1,5,5));
			et.add(new Excel_tilte("原路线编码",1,1,6,6));
			et.add(new Excel_tilte("原路线名称",1,1,7,7));
			et.add(new Excel_tilte("原起点桩号",1,1,8,8));
			et.add(new Excel_tilte("原止点桩号",1,1,9,9));
			et.add(new Excel_tilte("规划路线编码",1,1,10,10));
			et.add(new Excel_tilte("规划路线名称",1,1,11,11));
			et.add(new Excel_tilte("规划起点桩号",1,1,12,12));
			et.add(new Excel_tilte("规划止点桩号",1,1,13,13));
			et.add(new Excel_tilte("共线路线编码",1,1,14,14));
			et.add(new Excel_tilte("共线起点桩号",1,1,15,15));
			et.add(new Excel_tilte("共线止点桩号",1,1,16,16));
			et.add(new Excel_tilte("起点名称",1,1,17,17));
			et.add(new Excel_tilte("止点名称",1,1,18,18));
			et.add(new Excel_tilte("里程",1,1,19,19));
			et.add(new Excel_tilte("一级公路",1,1,20,20));
			et.add(new Excel_tilte("二级公路",1,1,21,21));
			et.add(new Excel_tilte("三级公路",1,1,22,22));
			et.add(new Excel_tilte("四级公路",1,1,23,23));
			et.add(new Excel_tilte("等外公路",1,1,24,24));
			et.add(new Excel_tilte("无路",1,1,25,25));
			et.add(new Excel_tilte("路面宽度",1,1,26,26));
			et.add(new Excel_tilte("技术等级",1,1,27,27));
			et.add(new Excel_tilte("项目年份",1,1,28,28));
			et.add(new Excel_tilte("工程分类",1,1,29,29));
			et.add(new Excel_tilte("计划开工时间",1,1,30,30));
			et.add(new Excel_tilte("计划完工时间",1,1,31,31));
			et.add(new Excel_tilte("工期（月）",1,1,32,32));
			et.add(new Excel_tilte("总投资",1,1,33,33));
			et.add(new Excel_tilte("建设方案",1,1,34,34));
			et.add(new Excel_tilte("备注",1,1,35,35));
			et.add(new Excel_tilte("计划核对结果",1,1,36,36));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			try {
				Excel_export.excel_export(eldata,response);
			} catch (Exception e) {
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
						xmsq.getGcfl(), xmsq.getQdmc(), xmsq.getZdmc(), "1",xmsq.getXzqhdm2());
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
						xmsq.getGcfl(), xmsq.getQdmc(), xmsq.getZdmc(), "1",xmsq.getXzqhdm2());
				lx.setJdbs("0");
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
					result+=" (x."+name+" like '%"+s[i]+"%'";
				else
					result+=" or x."+name+" like '%"+s[i]+"%'";
			}
			result+=")";
			//System.out.println(result);
			//result= bh.indexOf(",")==-1 ? " x."+name+" like '%"+bh+"%'": "x."+name+" in ("+bh+")";
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
	
	public void loadGhlx(){
		try {
			
			List<TreeNode> resultList = new ArrayList<TreeNode>();
			List<TreeNode> resultList1 = new ArrayList<TreeNode>();
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
			
			TreeNode qb = new TreeNode("","全部",null,resultList);
			resultList1.add(qb);
			ResponseUtils.write(getresponse(), JSONArray.fromObject(resultList1).toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void loadYlx(){
		try {
			
			List<TreeNode> resultList = new ArrayList<TreeNode>();
			List<TreeNode> resultList1 = new ArrayList<TreeNode>();
			List<Map<String, String>> gd = xmsqServer.queryLxFromLxshlxByLevel("and lxbm like 'G%'",xmsq.getXzqhdm());
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
			
			//s
			List<Map<String, String>> sd = xmsqServer.queryLxFromLxshlxByLevel("and lxbm like 'S%'",xmsq.getXzqhdm());
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
			
			//x
			List<Map<String, String>> xd = xmsqServer.queryLxFromLxshlxByLevel("and lxbm like 'X%'",xmsq.getXzqhdm());
			List<TreeNode> xChildren = new ArrayList<TreeNode>();
			for (Map<String, String> item : xd) {
				TreeNode lx = new TreeNode();
				lx.setId(item.get("ID"));
				lx.setText(item.get("TEXT"));
				xChildren.add(lx);
			}
			TreeNode x = new TreeNode("X","县道",null,xChildren);
			x.setState("closed");
			resultList.add(x);
			//y
			List<Map<String, String>> yd = xmsqServer.queryLxFromLxshlxByLevel("and lxbm like 'Y%'",xmsq.getXzqhdm());
			List<TreeNode> yChildren = new ArrayList<TreeNode>();
			for (Map<String, String> item : yd) {
				TreeNode lx = new TreeNode();
				lx.setId(item.get("ID"));
				lx.setText(item.get("TEXT"));
				yChildren.add(lx);
			}
			TreeNode y = new TreeNode("Y","乡道",null,yChildren);
			y.setState("closed");
			resultList.add(y);
			//c
			List<Map<String, String>> cd = xmsqServer.queryLxFromLxshlxByLevel("and lxbm like 'C%'",xmsq.getXzqhdm());
			List<TreeNode> cChildren = new ArrayList<TreeNode>();
			for (Map<String, String> item : cd) {
				TreeNode lx = new TreeNode();
				lx.setId(item.get("ID"));
				lx.setText(item.get("TEXT"));
				cChildren.add(lx);
			}
			TreeNode c = new TreeNode("C","村道",null,cChildren);
			c.setState("closed");
			resultList.add(c);
			//z
			List<Map<String, String>> zd = xmsqServer.queryLxFromLxshlxByLevel("and lxbm like 'Z%'",xmsq.getXzqhdm());
			List<TreeNode> zChildren = new ArrayList<TreeNode>();
			for (Map<String, String> item : zd) {
				TreeNode lx = new TreeNode();
				lx.setId(item.get("ID"));
				lx.setText(item.get("TEXT"));
				zChildren.add(lx);
			}
			TreeNode z = new TreeNode("Z","专道",null,zChildren);
			z.setState("closed");
			resultList.add(z);
			//其他
			List<Map<String, String>> qtd = xmsqServer.queryLxFromLxshlxByLevel("and lxbm not like 'G%' and lxbm not like 'S%' and lxbm not like 'X%' and lxbm not like 'Y%' and lxbm not like 'C%' and lxbm not like 'Z%'",xmsq.getXzqhdm());
			List<TreeNode> qtChildren = new ArrayList<TreeNode>();
			for (Map<String, String> item : qtd) {
				TreeNode lx = new TreeNode();
				lx.setId(item.get("ID"));
				lx.setText(item.get("TEXT"));
				qtChildren.add(lx);
			}
			TreeNode qt = new TreeNode("qt","其他",null,qtChildren);
			qt.setState("closed");
			resultList.add(qt);

			TreeNode qb = new TreeNode("","全部",null,resultList);
			resultList1.add(qb);
			
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
	
	public void queryyhdzxsfdj(){
		try {
			JsonUtils.write(xmsqServer.queryyhdzxsfdj(), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
	
	
	public void exportExcelXmsq1(){
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String tsdqS=(String) session.getAttribute("tsdq");
		xmsq.setTsdq(tsdqS);
		
		List<Excel_list>  l=new ArrayList<Excel_list>();
		String xmbm = xmsq.getXmnf();
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
		xmsq.setXmnf(xmbm);
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
		xmsq.setGhlxbh(MyUtil.getQueryTJ(xmsq.getGhlxbh(), "lxbm"));
		xmsq.setGhlxbm(MyUtil.getQueryTJ(xmsq.getGhlxbm(), "ghlxbm"));
		
//		xmsq.setGydwdm(xzqhBm(xmsq.getGydwdm(), "gydwdm"));
//		xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm"));
		
		xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm2"));
		xmsq.setWnxmk(xmsq.getWnxmk());
		xmsq.setLsxmlx(MyUtil.getQueryTJ2(xmsq.getLsxmnf(),xmsq.getLsxmlx(),"fun_lsxmlx(lsxmbm)"));
		xmsq.setLsxmnf(MyUtil.getQueryTJ(xmsq.getLsxmnf(),"fun_lsxmnf(lsxmbm)"));
		
		if(xmsq.getXmlx()==4){
			String gcfl = xmsq.getJsxz();
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
			l= xmsqServer.queryYhdzxExport1(xmsq);
//			int k=1;
//			for (Excel_list e : l) {
//				if("1".equals(e.getV_50())) {
//					e.setV_0(""+k);k++;
//				}
//			}
		}
		
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("养护大中修工程建议计划表");//设置第一行
		eldata.setSheetName("养护大中修");//设置sheeet名
		eldata.setFileName("养护大中修工程建议计划表");//设置文件名
		
		eldata.setEl(l);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,1,0,0));
		et.add(new Excel_tilte("行政等级",1,1,1,1));
		et.add(new Excel_tilte("项目编码",1,1,2,2));
		et.add(new Excel_tilte("工程项目名称",1,1,3,3));
		et.add(new Excel_tilte("原路线编码",1,1,4,4));
		et.add(new Excel_tilte("原路线名称",1,1,5,5));
		et.add(new Excel_tilte("原起点桩号",1,1,6,6));
		et.add(new Excel_tilte("原止点桩号",1,1,7,7));
		et.add(new Excel_tilte("规划路线编码",1,1,8,8));
		et.add(new Excel_tilte("规划路线名称",1,1,9,9));
		et.add(new Excel_tilte("规划起点桩号",1,1,10,10));
		et.add(new Excel_tilte("规划止点桩号",1,1,11,11));
		et.add(new Excel_tilte("共线路线编码",1,1,12,12));
		et.add(new Excel_tilte("共线起点桩号",1,1,13,13));
		et.add(new Excel_tilte("共线止点桩号",1,1,14,14));
		et.add(new Excel_tilte("实施里程（km）",1,1,15,15));
		et.add(new Excel_tilte("技术等级",1,1,16,16));
		et.add(new Excel_tilte("电子地图路面宽度",1,1,17,17));
		et.add(new Excel_tilte("原路面类型",1,1,18,18));
		et.add(new Excel_tilte("原路面结构",1,1,19,19));
		et.add(new Excel_tilte("建设性质（大修、中修、预防性）",1,1,20,20));
		et.add(new Excel_tilte("技术处治方案",1,1,21,21));
		et.add(new Excel_tilte("按统一单价计算省补助资金（万元）",1,1,22,22));
		et.add(new Excel_tilte("总投资（万元）",1,1,23,23));
		et.add(new Excel_tilte("立项文号或施工图批复文号",1,1,24,24));
		et.add(new Excel_tilte("管养单位",1,1,25,25));
//		et.add(new Excel_tilte("最近建设时间",1,1,26,26));
//		et.add(new Excel_tilte("为在建高速公路损坏普通国省道路段",1,1,27,27));
//		et.add(new Excel_tilte("通过村镇、街道路段",1,1,28,28));
		et.add(new Excel_tilte("备注",1,1,26,26));
		et.add(new Excel_tilte("计划核对结果",1,1,27,27));
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public void getghxx(){
		try {
			JsonUtils.write(xmsqServer.getghxx(xmsq), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getghxxbyone(){
		try {
			JsonUtils.write(xmsqServer.getghxxbyone(xmsq), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getghlxinfo(){
		List<Xmsq> l=xmsqServer.getghlxinfo(xmsq);
		List<Xmsq> l1=new ArrayList<Xmsq>();
		for (Xmsq xm : l) {
			if(xm.getYlxbm().equals(xm.getXlxbm())&&xm.getYqdzh().equals(xm.getXqdzh())&&xm.getYzdzh().equals(xm.getXzdzh())){
				//System.out.println("删除");
				l1.add(xm);
			}
			//System.out.println(xmsq.getXlxbm()+"      ------------------------------------------------------------");
		}
		l.removeAll(l1);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getylxinfo(){
		Xmsq l=xmsqServer.getylxinfo(xmsq);
		
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getylxlminfo(){
		Lx l=xmsqServer.getylxlminfo(xmsq);
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void getgxlxinfo(){
		List<Xmsq> l=xmsqServer.getgxlxinfo(xmsq);
		
		try {
			JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
