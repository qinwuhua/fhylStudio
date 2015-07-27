package com.hdsx.jxzhpt.qqgl.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.codehaus.jackson.map.util.JSONWrappedObject;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
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
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
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
			}
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
			System.out.println("阶段："+xmsq.getJdbs());
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
			Lx lx=new Lx();
			lx.setXmid(xmsq.getXmbm());
			lx.setJdbs(xmsq.getJdbs());
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
					xmsqServer.insertCbsjYhdzx(xmsq);
				}
			}else if(xmsq.getXmlx()==5){
				b = xmsqServer.updateShSqzt(xmsq);
				if(b){
					boolean s = xmsqServer.insertCbsjSh(xmsq);
				}
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
	public void exportExcelXmsq(){
		try{
			ExcelTitleCell [] title=new ExcelTitleCell[19];
			title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
			title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
			title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
			title[3]=new ExcelTitleCell("管养单位",false, new ExcelCoordinate(0, (short)3), null,20);
			title[4]=new ExcelTitleCell("原路线编号",false, new ExcelCoordinate(0, (short)4), null,20);
			title[5]=new ExcelTitleCell("路线名称",false, new ExcelCoordinate(0, (short)5), null,20);
			title[6]=new ExcelTitleCell("起点名称",false, new ExcelCoordinate(0, (short)6), null,20);
			title[7]=new ExcelTitleCell("讫点名称",false, new ExcelCoordinate(0, (short)7), null,20);
			title[8]=new ExcelTitleCell("起点桩号",false, new ExcelCoordinate(0, (short)8), null,20);
			title[9]=new ExcelTitleCell("讫点桩号",false, new ExcelCoordinate(0, (short)9), null,20);
			title[10]=new ExcelTitleCell("里程",false, new ExcelCoordinate(0, (short)10), null,20);
			title[11]=new ExcelTitleCell("路面宽度",false, new ExcelCoordinate(0, (short)11), null,20);
			title[12]=new ExcelTitleCell("技术等级",false, new ExcelCoordinate(0, (short)12), null,20);
			title[13]=new ExcelTitleCell("拟投资",false, new ExcelCoordinate(0, (short)13), null,20);
			title[14]=new ExcelTitleCell("计划开工时间",false, new ExcelCoordinate(0, (short)14), null,20);
			title[15]=new ExcelTitleCell("计划完工时间",false, new ExcelCoordinate(0, (short)15), null,20);
			title[16]=new ExcelTitleCell("工期",false, new ExcelCoordinate(0, (short)16), null,20);
			title[17]=new ExcelTitleCell("工程分类",false, new ExcelCoordinate(0, (short)17), null,20);
			title[18]=new ExcelTitleCell("建设方案",false, new ExcelCoordinate(0, (short)18), null,20);
			//设置列与字段对应
			Map<String, String> attribute=new HashMap<String, String>();
			attribute.put("0", "xmmc");//项目名称
			attribute.put("1", "xmbm");//项目编码
			attribute.put("2", "xzqh");//行政区划
			attribute.put("3", "gydw");//管养单位
			attribute.put("4", "ylxbh");//原路线编号
			attribute.put("5", "lxmc");//路线名称
			attribute.put("6", "qdmc");//起点名称
			attribute.put("7", "zdmc");//止点名称
			attribute.put("8", "qdzh");//起点桩号
			attribute.put("9", "zdzh");//止点桩号
			attribute.put("10", "lc");//里程
			attribute.put("11", "lmkd");//路面宽度
			attribute.put("12", "jsdj");//建设等级
			attribute.put("13", "ntz");//拟投资
			attribute.put("14", "jhkgsj");//开工时间
			attribute.put("15", "jhwgsj");//完工时间
			attribute.put("16", "gq");//工期
			attribute.put("17", "gcfl");//工程费雷
			attribute.put("18", "jsfa");//建设方案
			//数据
			List<Object> excelData=new ArrayList<Object>();
			//设置标题、文件名称
			String titleName="";
			String fileName="";
			xmsq.setGydwdm(xzqhBm(xmsq.getGydwdm(), "gydwdm"));
			xmsq.setXzqhdm(xzqhBm(xmsq.getXzqhdm(), "xzqhdm"));
			if(xmsq.getXmlx()==4){
				titleName="立项审核";
				fileName="养护大中修立项审核";
				excelData = xmsqServer.queryYhdzxExport(xmsq);
			}else if(xmsq.getXmlx()==5){
				titleName="立项审核";
				fileName="灾毁重建立项审核";
				excelData = xmsqServer.queryShExport(xmsq);
			}
			ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
			ExcelExportUtil.excelWrite(excel, fileName, getresponse());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入养护大中修Excel
	 */
	@SuppressWarnings("unchecked")
	public void importExcelYhdzx(){
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xzqhdm");//行政区划代码
		attribute.put("1", "xzqh");//行政区划
		attribute.put("2", "gydw");//管养单位
		attribute.put("3", "ylxbh");//原路线编号
		attribute.put("4", "ghlxbh");//规划路线编号
		attribute.put("5", "lmkd");//路面宽度
		attribute.put("6", "lxmc");//路线名称
		attribute.put("7", "qdmc");//起点桩号
		attribute.put("8", "zdmc");//止点桩号
		attribute.put("9", "qdzh");//起点桩号
		attribute.put("10", "zdzh");//止点桩号
		attribute.put("11", "lc");//里程
		attribute.put("12", "jsdj");//技术等级
		attribute.put("13", "xmmc");//项目名称
		attribute.put("14", "gcfl");//工程分类
		attribute.put("15", "jhkgsj");//开工时间
		attribute.put("16", "jhwgsj");//完工时间
		attribute.put("17", "gq");//工期
		attribute.put("18", "ntz");//拟投资
		attribute.put("19", "jsfa");//建设方案
		attribute.put("20", "tsdq");//建设方案
		
		ExcelEntity excel=new ExcelEntity();
		excel.setAttributes(attribute);
		try {
			List<Xmsq> list = ExcelImportUtil.readerExcel(fileupload, Xmsq.class, 2, excel);
			List<Lx> lxlist=new ArrayList<Lx>();
			String nextXmbm = xmsqServer.queryYhdzxNextXmbm();
			int num = new Integer(nextXmbm.substring(nextXmbm.length()-4)).intValue();
			Calendar cal = Calendar.getInstance();
			for (Xmsq xmsq : list) {
				xmsq.setXmbm(""+cal.get(Calendar.YEAR)+xmsq.getXzqhdm()+num);
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
				lx.setJsfa(xmsq.getJsfa());
				xmsq.setLsjl(xmsqServer.queryLsjl(xmsq.getYlxbh(),xmsq.getQdzh(),xmsq.getZdzh(),xmsq.getXmbm())>0 ? "是" : "否");
				lxlist.add(lx);
				num++;
			}
			if(xmsqServer.insertXmsqYhdzx(list)){
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
	 * 导入灾毁重建Excel
	 */
	@SuppressWarnings("unchecked")
	public void importExcelSh(){
		//设置列与字段对应
				Map<String, String> attribute=new HashMap<String, String>();
				attribute.put("0", "xzqhdm");//行政区划代码
				attribute.put("1", "xzqh");//行政区划
				attribute.put("2", "gydw");//管养单位
				attribute.put("3", "ylxbh");//原路线编号
				attribute.put("4", "ghlxbh");//规划路线编号
				attribute.put("5", "lmkd");//路面宽度
				attribute.put("6", "lxmc");//路线名称
				attribute.put("7", "qdmc");//起点桩号
				attribute.put("8", "zdmc");//止点桩号
				attribute.put("9", "qdzh");//起点桩号
				attribute.put("10", "zdzh");//止点桩号
				attribute.put("11", "lc");//里程
				attribute.put("12", "jsdj");//技术等级
				attribute.put("13", "xmmc");//项目名称
				attribute.put("14", "gcfl");//工程分类
				attribute.put("15", "jhkgsj");//开工时间
				attribute.put("16", "jhwgsj");//完工时间
				attribute.put("17", "gq");//工期
				attribute.put("18", "ntz");//拟投资
				attribute.put("19", "jsfa");//建设方案
				attribute.put("20", "tsdq");//建设方案
				
				ExcelEntity excel=new ExcelEntity();
				excel.setAttributes(attribute);
				try {
					List<Xmsq> list = ExcelImportUtil.readerExcel(fileupload, Xmsq.class, 2, excel);
					List<Lx> lxlist=new ArrayList<Lx>();
					String nextXmbm = xmsqServer.queryShNextXmbm();
					int num = new Integer(nextXmbm.substring(nextXmbm.length()-4)).intValue();
					Calendar cal = Calendar.getInstance();
					for (Xmsq xmsq : list) {
						xmsq.setXmbm(""+cal.get(Calendar.YEAR)+xmsq.getXzqhdm()+num);
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
						lx.setJsfa(xmsq.getJsfa());
						xmsq.setLsjl(xmsqServer.queryLsjl(xmsq.getYlxbh(),xmsq.getQdzh(),xmsq.getZdzh(),xmsq.getXmbm())>0 ? "是" : "否");
						lxlist.add(lx);
						num++;
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
