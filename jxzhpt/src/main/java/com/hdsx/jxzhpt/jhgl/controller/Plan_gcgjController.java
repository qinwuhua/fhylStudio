package com.hdsx.jxzhpt.jhgl.controller;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_gcgjServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.webutil.struts.BaseActionSupport;


@Scope("prototype")
@Controller
public class Plan_gcgjController extends BaseActionSupport{
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcgjServerImpl")
	private Plan_gcgjServer gcgjServer;//工程改建
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	private Plan_gcgj jh;
	private Plan_lx_gcgj lx;
	private String gydwdm;
	private String tbbmbm2;
	private String xmlx;
	private String fileuploadFileName;
	private File fileupload;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	
	public void insertGcgjLx(){
		lx.setTbsj(new Date());
		try {
			String strResult="false";
			Map<String, String> result=new HashMap<String, String>();
			Plan_lx_gcgj gcgj=new Plan_lx_gcgj();
			gcgj.setLxbm(lx.getLxbm());
			gcgj.setQdzh(lx.getQdzh());
			gcgj.setZdzh(lx.getZdzh());
			//此处的Jhid存储的是 “上报年份”，因为路线表中无年份字段，为了省去计划对象的参数
			gcgj.setJhid(jh.getSbnf());
			gcgj.setGydwdm(lx.getGydwdm());
			if(gcgjServer.queryJhExist(gcgj)==0){
				if(gcgjServer.queryGPSBylxbm(gcgj)!=null){
					strResult="true";
					gcgjServer.insertPlan_lx_Gcgj(lx);
					
				}else{
					result.put("msg", "项目库中不包含此路线信息");
				}
			}else{
				result.put("msg", "此计划中已经包含有此路线信息");
			}
			result.put("result", strResult);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryGjwjById(){
		try {
			HttpServletResponse response = getresponse();
			response.setContentType("octets/stream");
			Plan_gcgj gcsj = gcgjServer.queryGjwjById(jh.getId());
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
	/**
	 * 上传文件到数据库
	 */
	public void uploadGkbg(){
		try {
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
			gcgjServer.uploadGcgjFile(jh);
			response.getWriter().write(uploadGkFileName==null ? uploadSjtFileName : uploadGkFileName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询总计信息
	 */
	public void querySumGcgj(){
		try {
			lx.setGydwdm(gydwOrxzqhBm(lx.getGydwdm(),"gydwdm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			JsonUtils.write(gcgjServer.querySumGcgj(jh,lx), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取工程改建项目列表
	 */
	public void queryGcgjList(){
		try {
			lx.setGydwdm(gydwOrxzqhBm(lx.getGydwdm(),"gydwdm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			jsonMap.put("total", gcgjServer.queryGcgjCount(jh,lx));
			jsonMap.put("rows", gcgjServer.queryGcgjList(page,rows,jh,lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 根据ID获取计划信息
	 */
	public void queryGcgjById(){
		try {
			JsonUtils.write(gcgjServer.queryGcgjById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 此方法弃用
	 */
	public void queryGcgjNfs(){
		try {
			List<TreeNode> queryGcgjNfs = gcgjServer.queryGcgjNfs();
			System.out.println("年份："+queryGcgjNfs.size());
			JsonUtils.write(gcgjServer.queryGcgjNfs(),getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据ID删除计划
	 */
	public void dropGcgjById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("jh", new Boolean(gcgjServer.dropGcgjById(jh.getId())).toString());
			result.put("lx", new Boolean(gcgjServer.dropGcgjLxByJhid(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改计划ID
	 */
	public void editGcgjById(){
		try {
			JsonUtils.write(gcgjServer.editGcgjById(jh), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 添加计划验证
	 */
	public void verifyLx(){
		Map<String, Object> result=new HashMap<String, Object>();
		boolean boolResult=false;
		try {
			lx.setTsdqbm(gcgjServer.queryTsdqByXzqh(lx.getXzqhdm()));
			Plan_flwbzbz flw=new Plan_flwbzbz();
			flw.setXmlx(xmlx);//建设项目类型
			System.out.println(lx.getLxbm()+"   "+lx.getYjsdj()+"    "+lx.getTsdqbm());
			flw.setGldj(lx.getLxbm().substring(0, 1));//公路等级
			flw.setJsdj(lx.getYjsdj());//技术等级
			flw.setTsdq(lx.getTsdqbm());
			Integer bzzj=null;
			Plan_flwbzbz flwResult=gcgjServer.queryBzzj(flw);
			if(flwResult==null){
				flw.setXmlx(null);
				flw.setGldj(null);
				flw.setJsdj(null);
				flw.setTsdq(null);
				flwResult=gcgjServer.queryBzzj(flw);
			}
			bzzj = new Integer(flwResult.getBzzj());
			//计算金额
			Double yhlc=new Double(lx.getYhlc());
			double je=new Double(yhlc.doubleValue()*bzzj.doubleValue()).doubleValue();
			je=new Double(new DecimalFormat("#.000").format(je));
			result.put("je", je);
			result.put("fdbz", flwResult.getFdbz());
			JsonUtils.write(result,getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改状态
	 */
	public void editGcgjStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(gcgjServer.editGcgjStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导入计划
	 */
	public void importGcgj_jh(){
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
				dataMapArray = ExcelReader.readExcelContent(3,43,fs,Plan_gcgj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			String strVerify="";
			boolean boolJh=false,boolLx=false;
			System.out.println(data);
			Plan_flwbzbz defaultFlwje=null;//当无法找到对应计划类型的补助标准时，使用此默认值(只需要查一次，重复使用)
			for (Map map : data) {
				UUID jhId = UUID.randomUUID(); 
				map.put("jhid", jhId.toString().replace("-", ""));
				map.put("tbsj", new Date());
				map.put("gydwdm", getGydwdm());
				map.put("1", map.get("1").toString().substring(0, map.get("1").toString().indexOf(".")));
				String xzqh = map.get("1").toString();
				if(xzqh.matches("^36[0-9][1-9]00$") || xzqh.matches("^36[1-9][0-9]00$")){
					map.put("jh_sbthcd", 2);
				}else if(xzqh.matches("^36[0-9]{2}[0-9][1-9]$") || xzqh.matches("^36[0-9]{2}[1-9][0-9]$")){
					map.put("jh_sbthcd", 0);
				}
				map.put("16", map.get("16").toString().substring(0, map.get("16").toString().indexOf(".")));
				map.put("22", map.get("22").toString().substring(0, map.get("22").toString().indexOf(".")));
				map.put("34", map.get("34").toString().substring(0, map.get("34").toString().indexOf(".")));
				map.put("35", map.get("35").toString().substring(0, map.get("35").toString().indexOf(".")));
				map.put("36", map.get("36").toString().substring(0, map.get("36").toString().indexOf(".")));
				map.put("tbbm", getTbbmbm2());
				Plan_lx_gcgj gcgj=new Plan_lx_gcgj();
				gcgj.setXzqhdm(map.get("1").toString());
				gcgj.setLxbm(map.get("3").toString());//路线编码
				gcgj.setQdzh(map.get("8").toString());//起点桩号
				gcgj.setZdzh(map.get("9").toString());//止点桩号
				gcgj.setQzlc(map.get("10").toString());//隐患里程
				gcgj.setGydwdm(map.get("gydwdm").toString());//管养单位代码
				gcgj.setJhid(map.get("22").toString());//此处的Jhid存储的是 “上报年份”，因为路线表中无年份字段，为了省去计划对象的参数
				if(gcgjServer.queryJhExist(gcgj)==0){
					strVerify+= ImportVerify.gcgjVerify(map);
					Plan_lx_gcgj queryGPSBylxbm = gcgjServer.queryGPSBylxbm(gcgj);
					if(queryGPSBylxbm==null){
						strVerify="路线【"+map.get("4").toString()+"】【"+map.get("8").toString()+"-"+map.get("9").toString()+"】不正确或不属于您的管辖内;";
					}else if(queryGPSBylxbm!=null && strVerify.equals("")){
						map.put("yjsdj",queryGPSBylxbm.getYjsdj());
						gcgj.setYjsdj(queryGPSBylxbm.getYjsdj());//技术等级
						//验证是否与计划相符
						if(!map.get("4").toString().equals(queryGPSBylxbm.getLxmc())){
							strVerify+="【"+map.get("4").toString()+"】与计划内的路线名称不符<br/>";
						}
//						else if(!map.get("10").toString().equals(queryGPSBylxbm.getQzlc())){
//							strVerify+="【"+map.get("4").toString()+"】与计划内的起止里程不符<br/>";
//						}
						else{
							map.put("sfylsjl", gcgjServer.queryJlBylx(gcgj)>0? "是" :"否");
						}
						//根据行政区划查询是否有特殊地区  此处存储的为特殊地区名称
						gcgj.setTsdqbm(gcgjServer.queryTsdqByXzqh(gcgj.getXzqhdm()));
						//设置非路网项目的查询条件，注释，因为没有统一标准
//						Plan_flwbzbz flw=new Plan_flwbzbz();
//						flw.setXmlx("工程改造路面改建");//建设项目类型
//						flw.setGldj(gcgj.getLxbm().substring(0, 1));//公路等级
//						flw.setJsdj(gcgj.getYjsdj());//技术等级
//						flw.setTsdq(gcgj.getTsdqbm());
//						Plan_flwbzbz flwResult=gcgjServer.queryBzzj(flw);
//						Integer bzzj=null;
//						if(flwResult==null && defaultFlwje==null){
//							flw.setXmlx(null);
//							flw.setGldj(null);
//							flw.setJsdj(null);
//							flw.setTsdq(null);
//							flwResult=gcgjServer.queryBzzj(flw);
//						}
//						bzzj = flwResult==null ? new Integer(defaultFlwje.getBzzj()) : new Integer(flwResult.getBzzj());
//						//验证金额
//						Double yhlc=new Double(map.get("11").toString());
//						double je=new Double(Math.rint(yhlc.doubleValue()*bzzj.intValue())).doubleValue();
//						Integer pfztz=new Integer(map.get("34").toString());
//						int fdbz=new Integer(flwResult.getFdbz()).intValue();//浮动标准
//						if(!(pfztz.intValue()>=je-fdbz) || !(pfztz.intValue()<=je+fdbz)){
//							strVerify+="<br/>"+gcgj.getLxbm()+"批复总投资不在计算结果的范围内<br/>";
//						}
					}
				}else{
					strVerify+="路线【"+map.get("4").toString()+"】【"+map.get("8").toString()+"-"+map.get("9").toString()+"】已经存在计划！";
				}
				
				if(!strVerify.equals("")){
					break;
				}
			}
			//将数据插入到数据库
			if(strVerify.equals("")){
				boolJh=gcgjServer.insertGcgj_jh(data);
				boolLx=gcgjServer.insertGcgj_lx(data);
			}
			
			if(boolJh && boolLx)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导出资金下达Excel
	 */
	public void exportGcgjZjxdExcel(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[10];
		title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
		title[1]=new ExcelTitleCell("路线信息",false, new ExcelCoordinate(0, (short)1), null,50);
		title[2]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)2), null,15);
		title[3]=new ExcelTitleCell("填报单位",false, new ExcelCoordinate(0, (short)3), null,15);
		title[4]=new ExcelTitleCell("下达年份",false, new ExcelCoordinate(0, (short)4), null,15);
		title[5]=new ExcelTitleCell("总投资",false, new ExcelCoordinate(0, (short)5), null,15);
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
		attribute.put("7", "stz");//下达的部投资
		attribute.put("8", "jhxdwh");//下达的部投资
		attribute.put("9", "xmid");
		//准备数据
		String gydwmc=zjxdServer.queryGydwmcById(lx.getGydwdm());
		List<Object> excelData = new ArrayList<Object>();
		if(lx.getGydwdm().equals("36")){
			lx.setGydwdm(null);
		}
		for (Plan_gcgj item : gcgjServer.queryGcgjList(jh, lx)) {
			Plan_zjxd zjxd=new Plan_zjxd();
			zjxd.setXmmc(item.getXmmc());
			String strLx="";
			for (int i = 0; i <item.getPlan_lx_gcgjs().size(); i++) {
				strLx+=item.getPlan_lx_gcgjs().get(i).getLxmc()+"-"+
						item.getPlan_lx_gcgjs().get(i).getLxbm()+"("+
						item.getPlan_lx_gcgjs().get(i).getQdzh()+"-"+
						item.getPlan_lx_gcgjs().get(i).getZdzh()+")";
				if(i!=item.getPlan_lx_gcgjs().size()-1){
					strLx+="\r\n";
				}
			}
			zjxd.setLxxx(strLx);
			zjxd.setPfztz(item.getPfztz());
			zjxd.setXmid(item.getId());
			zjxd.setTbdw(gydwmc);
			excelData.add(zjxd);
		}
		ExcelEntity excel=new ExcelEntity("工程改造路面改建",title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, "工程改造路面改建-资金下达", getresponse());
	}
	/**
	 * 单次添加计划
	 */
	public void insertGcgj(){
		try{
			Map<String, String> result=new HashMap<String, String>();
			UUID id=UUID.randomUUID();
			lx.setJhid(id.toString());
			jh.setId(id.toString());
			Plan_lx_gcgj gcgj=new Plan_lx_gcgj();
			gcgj.setXzqhdm(lx.getXzqhdm());
			gcgj.setLxbm(lx.getLxbm());//路线编码
			gcgj.setQdzh(lx.getQdzh());//起点桩号
			gcgj.setZdzh(lx.getZdzh());//止点桩号
			gcgj.setQzlc(lx.getQzlc());//隐患里程
			gcgj.setGydwdm(lx.getGydwdm());//管养单位代码
			gcgj.setYjsdj(lx.getYjsdj());
			gcgj.setJhid(jh.getSbnf());//此处的Jhid存储的是 “上报年份”
			String strResult="false";
			if(gcgjServer.queryJhExist(gcgj)==0){
				Plan_lx_gcgj queryGPSBylxbm = gcgjServer.queryGPSBylxbm(gcgj);
				if(queryGPSBylxbm!=null){
					jh.setSfylsjl(gcgjServer.queryJlBylx(gcgj) >0 ? "是" :"否");
					boolean lxresult = gcgjServer.insertPlan_lx_Gcgj(lx);
					boolean jhresult=gcgjServer.insertGcgjJh(jh);
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
	/**
	 * 单次添加计划时的编码提示
	 * @throws IOException
	 * @throws Exception
	 */
	public void gjAutoCompleteLxbm() throws IOException, Exception{
		List<Plan_lx_gcgj> list=gcgjServer.gjAutoCompleteLxbm(lx);
		JsonUtils.write(list, getresponse().getWriter());
	}
	/**
	 * 管养单位或行政区划代码处理
	 * @param bh
	 * @param name
	 * @return
	 */
	public String gydwOrxzqhBm(String bh,String name){
		if(bh.indexOf(",")==-1){
			int i=0;
			if(bh.matches("^[0-9]*[1-9]00$")){
				i=2;
			}else if(bh.matches("^[0-9]*[1-9]0000$")){
				i=4;
			}
			bh=bh.substring(0,bh.length()-i);
		}
		return bh.indexOf(",")==-1 ? " lx."+name+" like '%"+bh+"%'": "lx."+name+" in ("+bh+")";
	}
	//get set
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
	public Plan_gcgjServer getGcgjServer() {
		return gcgjServer;
	}
	public void setGcgjServer(Plan_gcgjServer gcgjServer) {
		this.gcgjServer = gcgjServer;
	}
	public Plan_gcgj getJh() {
		return jh;
	}
	public void setJh(Plan_gcgj jh) {
		this.jh = jh;
	}
	public Plan_lx_gcgj getLx() {
		return lx;
	}
	public void setLx(Plan_lx_gcgj lx) {
		this.lx = lx;
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
	public String getXmlx() {
		return xmlx;
	}
	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}
}
