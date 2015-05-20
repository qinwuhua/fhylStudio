package com.hdsx.jxzhpt.jhgl.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import jsx3.gui.Interactive;

import org.apache.struts2.ServletActionContext;
import org.apache.xerces.impl.xpath.regex.Match;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjzj;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcsjServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_gcsjController extends BaseActionSupport{
	private int page = 1;
	private int rows = 10;
	@Resource(name = "plan_GcsjServerImpl")
	private Plan_gcsjServer gcsjServer;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	private Plan_gcsj jh;
	private Plan_lx_gcsj lx;
	private String tbbmbm2;
	private Plan_zjzj zjzj;
	private String fileuploadFileName;
	private File fileupload;
	private String gydwdm;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	
	public void queryWjById(){
		try {
			HttpServletResponse response = getresponse();
			response.setContentType("octets/stream");
			Plan_gcsj gcsj = gcsjServer.queryWjById(jh.getId());
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			byte[] file=null;
			if(jh.getGkbgmc()!=null){
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(jh.getGkbgmc().substring(0,jh.getGkbgmc().indexOf(".")).getBytes("gb2312"), "ISO-8859-1")+ jh.getGkbgmc().substring(jh.getGkbgmc().indexOf(".")));
				file=gcsj.getGkbgwj();
			}else if(jh.getSjsgtmc()!=null){
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(jh.getSjsgtmc().substring(0,jh.getSjsgtmc().indexOf(".")).getBytes("gb2312"), "ISO-8859-1")+ jh.getSjsgtmc().substring(jh.getSjsgtmc().indexOf(".")));
				file=gcsj.getSjsgtwj();
			}
			out.write(file);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void uploadGcsjFile(){
		try{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8"); 
			FileInputStream inputStream = null;
			byte [] file=null;
			if(uploadGk!=null){
				file =new byte[(int)uploadGk.length()];
				inputStream=new FileInputStream(uploadGk);
			}
			if(uploadSjt!=null){
				file=new byte[(int)uploadSjt.length()];
				inputStream=new FileInputStream(uploadSjt);
			}
			ByteArrayOutputStream byteOutpu=new ByteArrayOutputStream();
			int index=0;
			while((index=inputStream.read(file))!=-1){
				byteOutpu.write(file, 0, index);
			}
			if(uploadGkFileName!=null){
				jh.setGkbgmc(uploadGkFileName);
				jh.setGkbgwj(file);
			}
			if(uploadSjtFileName!=null){
				jh.setSjsgtmc(uploadSjtFileName);
				jh.setSjsgtwj(file);
			}
			gcsjServer.uploadGcsjFile(jh);
			response.getWriter().write(uploadGkFileName==null ? uploadSjtFileName : uploadGkFileName);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void querySumMessage(){
		try {
			JsonUtils.write(gcsjServer.querySumMessage(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcsjList(){
		lx.setGydwdm(gydwOrxzqhBm(lx.getGydwdm(),"gydwdm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		List<Plan_gcsj> list = gcsjServer.queryGcsjList(page,rows,jh,lx);
		jsonMap.put("total", gcsjServer.queryGcsjCount(jh,lx));
		jsonMap.put("rows", list);
		try {
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcsjSum(){
		try {
			lx.setGydwdm(gydwOrxzqhBm(lx.getGydwdm(),"gydwdm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			JsonUtils.write(gcsjServer.queryGcsjSum(jh,lx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcsjById(){
		try {
			Plan_gcsj gcsj = gcsjServer.queryGcsjById(jh.getId());
			System.out.println("下达时间："+gcsj.getXdsj());
			System.out.println("计划开工："+gcsj.getJhkgsj());
			JsonUtils.write(gcsj, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGcsjNfs(){
		try {
			JsonUtils.write(gcsjServer.queryGcsjNfs(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropGcsjById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("jh", new Boolean(gcsjServer.dropGcsjById(jh.getId())).toString());
			result.put("lx", new Boolean(gcsjServer.dropGcsjLxByJhid(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editGcsjById(){
		try {
			JsonUtils.write(gcsjServer.editGcsjById(jh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editGcsjSpBatch(){
		try{
			String[] id = jh.getId().split(",");
			String[] spzt = jh.getSpzt().split(",");
			String[] jh_sbthcd = jh.getJh_sbthcd().split(",");
			System.out.println("ID:"+jh.getId());
			List<Plan_gcsj> list=new ArrayList<Plan_gcsj>();
			for (int i = 0; i < id.length; i++) {
				Plan_gcsj gcsj=new Plan_gcsj();
				gcsj.setId(id[i]);
				gcsj.setSpzt(spzt[i].equals("0") ? "1" : spzt[i]);
				gcsj.setJh_sbthcd(new Integer(jh_sbthcd[i]).intValue() >=6 ? jh_sbthcd[i] : 
					new Integer((new Integer(jh_sbthcd[i]).intValue()+2)).toString());
				gcsj.setSpbmdm(jh.getSpbmdm());
				gcsj.setSpsj(new Date());
				list.add(gcsj);
			}
			Map<String, String> result=new HashMap<String, String>();
			result.put("result",  new Boolean(gcsjServer.editGcgjStatusBatch(list)).toString());
			JsonUtils.write(result,getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void editGcsjStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(gcsjServer.editGcsjStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void exportExcel_gcsj(){
		lx.setGydwdm(gydwOrxzqhBm(lx.getGydwdm(),"gydwdm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
		List<Plan_gcsj> queryGcsjList = gcsjServer.queryGcsjList(jh,lx);
		List<Map<String,String>> exceData=new ArrayList<Map<String,String>>();
		for(Plan_gcsj item : queryGcsjList){
			List<Plan_lx_gcsj> lxlist = item.getPlan_lx_gcsjs();
			for(Plan_lx_gcsj itemlx : lxlist){
				Map<String, String> lxmap=new HashMap<String, String>();
				lxmap.put("0", itemlx.getGydw());
				lxmap.put("1", itemlx.getXzqhmc());
				lxmap.put("2", itemlx.getLxbm());
				lxmap.put("3", itemlx.getLxmc());
				lxmap.put("4", itemlx.getQdzh());
				lxmap.put("5", itemlx.getZdzh());
				lxmap.put("6", itemlx.getQzlc());
				lxmap.put("7", itemlx.getXmlc());
				exceData.add(lxmap);
			}
		}
		List<String> excelTitle=new ArrayList<String>();
		excelTitle.add("管养单位");
		excelTitle.add("行政区划");
		excelTitle.add("路线编码");
		excelTitle.add("路线名称");
		excelTitle.add("起点桩号");
		excelTitle.add("止点桩号");
		excelTitle.add("起止里程");
		excelTitle.add("项目里程");
		String tableName="工程改建路面升级";
		HttpServletResponse response= getresponse();
		ExcelUtil.excelWrite(exceData, excelTitle, tableName, response);
	}
	
	public void exportZjxdExcel(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[10];
		title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
		title[1]=new ExcelTitleCell("路线信息",false, new ExcelCoordinate(0, (short)1), null,50);
		title[2]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)2), null,15);
		title[3]=new ExcelTitleCell("填报单位",false, new ExcelCoordinate(0, (short)3), null,15);
		title[4]=new ExcelTitleCell("下达年份",false, new ExcelCoordinate(0, (short)4), null,15);
		title[5]=new ExcelTitleCell("下达总投资",false, new ExcelCoordinate(0, (short)5), null,15);
		title[6]=new ExcelTitleCell("车购税",false, new ExcelCoordinate(0, (short)6), null,15);
		title[7]=new ExcelTitleCell("省投资",false, new ExcelCoordinate(0, (short)7), null,15);
		title[8]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)8), null,15);
		title[9]=new ExcelTitleCell("ID",true, new ExcelCoordinate(0, (short)9), null,20);
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//第一列项目名称
		attribute.put("1", "lxxx");//路线信息
		attribute.put("2", "pfztz");//批复总投资
		attribute.put("3", "tbdw");//填报单位-即导出单位
		attribute.put("4", "xdnf");//下达年份
		attribute.put("5", "xdzj");//下达的总投资
		attribute.put("6", "btzzj");//下达的部投资
		attribute.put("7", "stz");//省投资
		attribute.put("8", "jhxdwh");//省投资
		attribute.put("9", "xmid");
		//准备数据
		lx.setGydwdm(gydwOrxzqhBm(lx.getGydwdm(),"gydwdm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
		String gydwmc=zjxdServer.queryGydwmcById(lx.getGydwbm());
		List<Object> excelData = new ArrayList<Object>();
		if(lx.getGydwdm().equals("36")){
			lx.setGydwdm(null);
		}
		for (Plan_gcsj item : gcsjServer.queryGcsjList(jh, lx)) {
			Plan_zjxd zjxd=new Plan_zjxd();
			zjxd.setXmmc(item.getXmmc());
			String strLx="";
			for (int i = 0; i <item.getPlan_lx_gcsjs().size(); i++) {
				strLx+=item.getPlan_lx_gcsjs().get(i).getLxmc()+"-"+
						item.getPlan_lx_gcsjs().get(i).getLxbm()+"("+
						item.getPlan_lx_gcsjs().get(i).getQdzh()+"-"+
						item.getPlan_lx_gcsjs().get(i).getZdzh()+")";
				if(i!=item.getPlan_lx_gcsjs().size()-1){
					strLx+="\r\n";
				}
			}
			zjxd.setLxxx(strLx);
			zjxd.setPfztz(item.getPftz());
			zjxd.setXmid(item.getId());
			zjxd.setTbdw(gydwmc);
			excelData.add(zjxd);
		}
		ExcelEntity excel=new ExcelEntity("工程改造路面升级",title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, "工程改造路面升级-资金下达", getresponse());
	}
	
	public void importGcsj_jh(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader.readExcelContent(3,58,fs,Plan_gcsj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			String strVerify=null;
			boolean boolJh=false,boolLx=false;
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			System.out.println(data);
			Plan_flwbzbz defaultFlwje=null;//当无法找到对应计划类型的补助标准时，使用此默认值(只需要查一次，重复使用)
			for (Map map : data) {
				UUID jhId = UUID.randomUUID(); 
				System.out.println(jhId.toString());
				map.put("jhid", jhId.toString().replace("-", ""));
				map.put("gydwdm", getGydwdm());
				map.put("tbsj", new Date());
				map.put("1", map.get("1").toString().substring(0, map.get("1").toString().indexOf(".")));
				String xzqh = map.get("1").toString();
				if(xzqh.matches("^36[0-9][1-9]00$") || xzqh.matches("^36[1-9][0-9]00$")){
					map.put("jh_sbthcd", 2);
				}else if(xzqh.matches("^36[0-9]{2}[0-9][1-9]$") || xzqh.matches("^36[0-9]{2}[1-9][0-9]$")){
					map.put("jh_sbthcd", 0);
				}
				map.put("21", map.get("21").toString().substring(0, map.get("21").toString().indexOf(".")));
				map.put("28", map.get("28").toString().substring(0, map.get("28").toString().indexOf(".")));
				map.put("46", map.get("46").toString().substring(0, map.get("46").toString().indexOf(".")));
				map.put("47", map.get("47").toString().substring(0, map.get("47").toString().indexOf(".")));
				map.put("48", map.get("48").toString().substring(0, map.get("48").toString().indexOf(".")));
				map.put("tbbm", getTbbmbm2());
				Plan_lx_gcsj lx=new Plan_lx_gcsj();
				lx.setXzqhdm(map.get("1").toString());
				lx.setLxbm(map.get("3").toString());
				lx.setQdzh(map.get("7").toString());
				lx.setZdzh(map.get("9").toString());
				lx.setGydwdm(map.get("gydwdm").toString());
				lx.setYjsdj(map.get("5").toString());
				lx.setJhid(map.get("28").toString());//此处的Jhid存储的是 “上报年份”
				if(gcsjServer.queryJhExist(lx)==0){
					//内容验证
					strVerify=ImportVerify.gcsjVerify(map);
					//从计划中查询是否有此计划
					Plan_lx_gcsj queryGPSBylxbm = gcsjServer.queryGPSBylxbm(lx);
					if(queryGPSBylxbm==null){
						strVerify="路线【"+map.get("4").toString()+"】【"+map.get("7").toString()+"-"+map.get("9").toString()+"】不正确或不属于您的管辖内;";
					}else if(queryGPSBylxbm!=null && strVerify.equals("")){
						if(!map.get("4").toString().equals(queryGPSBylxbm.getLxmc())){
							strVerify+="【"+map.get("4").toString()+"】与计划内的路线名称不符<br/>";
						}
//						else if(!map.get("9").toString().equals(queryGPSBylxbm.getQzlc())){
//							strVerify+="【"+map.get("4").toString()+"】与计划内的起止里程不符<br/>";
//						}
						else{
							lx.setLxbm(lx.getLxbm().length()>6 ? lx.getLxbm().substring(0,lx.getLxbm().length()-6) 
									: lx.getLxbm());
							map.put("sfylsjl", gcsjServer.queryJlBylx(lx)>0 ? "是" : "否");
						}
						//根据行政区划查询是否有特殊地区  此处存储的为特殊地区名称
						lx.setTsdqbm(gcsjServer.queryTsdqByXzqh(lx.getXzqhdm()));
						//设置非路网项目的查询条件，注释，因为没有统一补助标准
//						Plan_flwbzbz flw=new Plan_flwbzbz();
//						flw.setXmlx("工程改造路面升级");//建设项目类型
//						flw.setGldj(lx.getLxbm().substring(0, 1));//公路等级
//						flw.setJsdj(lx.getYjsdj());//技术等级
//						flw.setTsdq(lx.getTsdqbm());
//						Plan_flwbzbz flwResult=gcsjServer.queryBzzj(flw);
//						Integer bzzj=null;//对应补助标准金额
//						if(flwResult==null && defaultFlwje==null){
//							flw.setXmlx(null);
//							flw.setGldj(null);
//							flw.setJsdj(null);
//							flw.setTsdq(null);
//							flwResult=gcsjServer.queryBzzj(flw);
//						}
//						bzzj = flwResult==null ? new Integer(defaultFlwje.getBzzj()) : new Integer(flwResult.getBzzj());
//						//验证金额
//						Double xmlc=new Double(map.get("12").toString());
//						double je=new Double(Math.rint(xmlc.doubleValue()*bzzj.intValue())).doubleValue();
//						Integer pfztz=new Integer(map.get("45").toString());
//						System.out.println("计算结果："+je+"  项目里程："+xmlc+"   补助金额："+bzzj);
//						int fdbz=new Integer(flwResult.getFdbz()).intValue();//浮动标准
//						if(!(pfztz.intValue()>=je-fdbz) || !(pfztz.intValue()<=je+fdbz)){
//							strVerify+="<br/>批复总投资不在计算结果的范围内<br/>";
//						}
					}
				}else{
					strVerify="路线【"+map.get("4").toString()+"】【"+map.get("7").toString()+"-"+map.get("8").toString()+"】已经存在计划！";
				}
				
				if(!strVerify.equals("")){
					break;
				}
			}
			if(strVerify.equals("")){
				boolJh=gcsjServer.insertGcsj_Jh(data);
				boolLx=gcsjServer.insertGcsj_lx(data);
			}
			//将数据插入到数据库
			if(boolJh && boolLx)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败！</br>"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void insertGcsj(){
		try{
			Map<String, String> result=new HashMap<String, String>();
			String strResult="false";
			if(jh.getTbbm().matches("^[0-9]{5}36[0-9][1-9]00$") || jh.getTbbm().matches("^[0-9]{5}36[1-9][0-9]00$")){
				jh.setJh_sbthcd("2");
			}else{ //if(jh.getTbbm().matches("^[0-9]{5}36[0-9]{2}[0-9][1-9]$") || jh.getTbbm().matches("^[0-9]{5}36[0-9]{2}[1-9][0-9]$"))
				jh.setJh_sbthcd("0");
			}
			Plan_lx_gcsj lx1=new Plan_lx_gcsj();
			lx1.setTsdq(lx.getTsdq());
			lx1.setXzqhdm(lx.getXzqhdm());
			lx1.setLxbm(lx.getLxbm());
			lx1.setQdzh(lx.getQdzh());
			lx1.setZdzh(lx.getZdzh());
			lx1.setGydwdm(lx.getGydwdm());
			lx1.setYjsdj(lx.getYjsdj());
			lx1.setJhid(jh.getJhnf());//此处的Jhid存储的是 “上报年份”
			//查询是否有此计划
			if(gcsjServer.queryJhExist(lx1)==0){
				if(gcsjServer.queryGPSBylxbm(lx1)!=null){
					UUID jhId = UUID.randomUUID(); 
					lx.setJhid(jhId.toString());
					jh.setId(jhId.toString());
					lx1.setLxbm(lx1.getLxbm().length()>6 ? lx1.getLxbm().substring(0,lx1.getLxbm().length()-6) 
							: lx1.getLxbm());
					jh.setSfylsjl(gcsjServer.queryJlBylx(lx1)>0 ? "是" : "否");
					boolean jhresult = gcsjServer.insertGcsj_Jh(jh);
					boolean lxresult = gcsjServer.insertGcsj_lx(lx);
					if(lxresult && jhresult){
						strResult="true";
					}
				}else{
					strResult="none";
				}
			}else{
				strResult="have";
			}
			result.put("result", strResult);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void insertGcsjlx(){
		try{
			Map<String, String> result=new HashMap<String, String>();
			String strResult="false";
			Plan_lx_gcsj lx1=new Plan_lx_gcsj();
			lx1.setXzqhdm(lx.getXzqhdm());
			lx1.setLxbm(lx.getLxbm());
			lx1.setQdzh(lx.getQdzh());
			lx1.setZdzh(lx.getZdzh());
			lx1.setGydwdm(lx.getGydwdm());
			lx1.setJhid(jh.getJhnf());//此处的Jhid存储的是 “上报年份”
			lx1.setYjsdj(lx.getYjsdj());
			//查询是否有此计划
			if(gcsjServer.queryJhExist(lx1)==0){
				if(gcsjServer.queryGPSBylxbm(lx1)!=null){
					UUID jhId = UUID.randomUUID(); 
					jh.setId(jhId.toString());
					jh.setSfylsjl("否");
					boolean lxresult = gcsjServer.insertGcsj_lx(lx);
					if(lxresult){
						strResult="true";
					}
				}else{
					strResult="none";
				}
			}else{
				strResult="have";
			}
			result.put("result", strResult);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 查询路线历史记录
	 */
	public void queryXjls(){
		try {
			lx.setLxbm(lx.getLxbm().length()>6 ? lx.getLxbm().substring(0,lx.getLxbm().length()-6) 
					: lx.getLxbm());
			List<Plan_lx_gcsj> ls=gcsjServer.queryXjls(lx);
			JsonUtils.write(ls, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 路线升级单次添加提醒
	 * @throws IOException
	 * @throws Exception
	 */
	public void sjAutoCompleteLxbm() throws IOException, Exception{
		List<Plan_lx_gcsj> list=gcsjServer.sjAutoCompleteLxbm(lx);
		JsonUtils.write(list, getresponse().getWriter());
	}
	/**
	 * 查询路线升降级记录
	 * @throws IOException
	 * @throws Exception
	 */
	public void querySjzh() throws IOException, Exception{
		List<Plan_lx_gcsj> list=gcsjServer.querySjzh(lx);
		JsonUtils.write(list, getresponse().getWriter());
	}
	public String gydwOrxzqhBm(String bh,String name){
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
			result = bh.indexOf(",")==-1 ? " lx."+name+" like '%"+bh+"%'": "lx."+name+" in ("+bh+")";
		}
		return result;
	}
	public void editZj() throws IOException, Exception{
		String Strresult="false";
		jh.setPftz(new Integer(new Integer(jh.getPftz()).intValue()+new Integer(zjzj.getZtz()).intValue()).toString());
		jh.setJhsybbzje(new Integer(new Integer(jh.getJhsybbzje()).intValue()+new Integer(zjzj.getBbzje()).intValue()).toString());
		jh.setJhsydfzczj(new Integer(new Integer(jh.getJhsydfzczj()).intValue()+new Integer(zjzj.getStz()).intValue()).toString());
		if(gcsjServer.editZjById(jh) && zjxdServer.insertZjzj(zjzj)){
			Strresult="true";
		}
		Map<String, String> result=new HashMap<String, String>();
		result.put("result", Strresult);
		JsonUtils.write(result, getresponse().getWriter());
	}
	//set get
	public int getPage() {
		return page;
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

	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public Plan_gcsjServer getGcsjServer() {
		return gcsjServer;
	}
	public void setGcsjServer(Plan_gcsjServer gcsjServer) {
		this.gcsjServer = gcsjServer;
	}
	public Plan_gcsj getJh() {
		return jh;
	}
	public void setJh(Plan_gcsj jh) {
		this.jh = jh;
	}
	public Plan_lx_gcsj getLx() {
		return lx;
	}
	public void setLx(Plan_lx_gcsj lx) {
		this.lx = lx;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
	public File getUploadGk() {
		return uploadGk;
	}
	public void setUploadGk(File uploadGk) {
		this.uploadGk = uploadGk;
	}
	public String getUploadGkFileName() {
		return uploadGkFileName;
	}
	public void setUploadGkFileName(String uploadGkFileName) {
		this.uploadGkFileName = uploadGkFileName;
	}
	public File getUploadSjt() {
		return uploadSjt;
	}
	public void setUploadSjt(File uploadSjt) {
		this.uploadSjt = uploadSjt;
	}
	public String getUploadSjtFileName() {
		return uploadSjtFileName;
	}
	public void setUploadSjtFileName(String uploadSjtFileName) {
		this.uploadSjtFileName = uploadSjtFileName;
	}
	public String getTbbmbm2() {
		return tbbmbm2;
	}
	public void setTbbmbm2(String tbbmbm2) {
		this.tbbmbm2 = tbbmbm2;
	}
	public Plan_zjzj getZjzj() {
		return zjzj;
	}
	public void setZjzj(Plan_zjzj zjzj) {
		this.zjzj = zjzj;
	}
}
