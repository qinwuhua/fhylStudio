package com.hdsx.jxzhpt.jhgl.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
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

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_shuih;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_shuihServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.bean.Plan_flwbzbz;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_shuihController extends BaseActionSupport {
	private int page=1;
	private int rows=10;
	@Resource(name="plan_shuihServerImpl")
	private Plan_shuihServer shuihServer;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	private Plan_shuih jh;
	private Plan_lx_shuih lx;
	private String fileuploadFileName;
	private File fileupload;
	private String gydwdm;
	private String tbbmbm2;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	
	public void queryShuihwjById(){
		try {
			HttpServletResponse response = getresponse();
			response.setContentType("octets/stream");
			Plan_shuih shuih = shuihServer.queryShuihwjById(jh.getId());
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			byte[] file=null;
			if(jh.getGkbgmc()!=null){
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(jh.getGkbgmc().substring(0,jh.getGkbgmc().indexOf(".")).getBytes("gb2312"), "ISO-8859-1")+ jh.getGkbgmc().substring(jh.getGkbgmc().indexOf(".")));
				file=shuih.getGkbgwj();
			}else if(jh.getSjsgtmc()!=null){
				response.addHeader("Content-Disposition", "attachment;filename="+ new String(jh.getSjsgtmc().substring(0,jh.getSjsgtmc().indexOf(".")).getBytes("gb2312"), "ISO-8859-1")+ jh.getSjsgtmc().substring(jh.getSjsgtmc().indexOf(".")));
				file=shuih.getSjsgtwj();
			}
			out.write(file);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void uploadShuihFile(){
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
			shuihServer.uploadShuihFile(jh);
			response.getWriter().write(uploadGkFileName==null ? uploadSjtFileName : uploadGkFileName);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void querySumShuih(){
		try {
			JsonUtils.write(shuihServer.querySumShuih(jh,lx), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryShuihList(){
		Map<String, Object> jsonMap=new HashMap<String, Object>();
		try {
			jsonMap.put("total", shuihServer.queryShuihCount(jh, lx));
			jsonMap.put("rows",shuihServer.queryShuihList(page, rows, jh, lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryShuihById(){
		try {
			JsonUtils.write(shuihServer.queryShuihById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryShuihNfs(){
		try {
			JsonUtils.write(shuihServer.queryShuihNfs(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropShuihById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("jh", new Boolean(shuihServer.dropShuihById(jh.getId())).toString());
			result.put("lx", new Boolean(shuihServer.dropShuihLxByJhid(jh.getId())).toString());
			JsonUtils.write(result,getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editShuihById(){
		try {
			JsonUtils.write(shuihServer.editShuihById(jh), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editShuihStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(shuihServer.editShuihStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void exportExcel_shuih(){
		List<Plan_shuih> queryShuihList = shuihServer.queryShuihList(jh, lx);
		List<Map<String,String>> excelData=new ArrayList<Map<String,String>>();
		for (Plan_shuih item : queryShuihList) {
			List<Plan_lx_shuih> shuihs = item.getShuihs();
			for (Plan_lx_shuih itemlx: shuihs) {
				Map<String, String> lxmap=new HashMap<String, String>();
				lxmap.put("0", itemlx.getGydw());
				lxmap.put("1", itemlx.getXzqhmc());
				lxmap.put("2", itemlx.getLxbm());
				lxmap.put("3", itemlx.getLxmc());
				lxmap.put("4", itemlx.getQdzh());
				lxmap.put("5", itemlx.getZdzh());
				lxmap.put("6", itemlx.getQzlc());
				lxmap.put("7", itemlx.getYhlc());
				excelData.add(lxmap);
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
		String tableName="水毁项目";
		HttpServletResponse response= getresponse();
		ExcelUtil.excelWrite(excelData, excelTitle, tableName, response);
	}
	
	public void importShuih_jh(){
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
				dataMapArray = ExcelReader.readExcelContent(3,43,fs,Plan_gcsj.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			String strVerify="";
			boolean boolJh=false,boolLx=false;
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			Plan_flwbzbz defaultFlwje=null;//当无法找到对应计划类型的补助标准时，使用此默认值(只需要查一次，重复使用)
			for (Map map : data) {
				UUID jhId = UUID.randomUUID(); 
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
				map.put("16", map.get("16").toString().substring(0, map.get("16").toString().indexOf(".")));
				map.put("22", map.get("22").toString().substring(0, map.get("22").toString().indexOf(".")));
				map.put("34", map.get("34").toString().substring(0, map.get("34").toString().indexOf(".")));
				map.put("35", map.get("35").toString().substring(0, map.get("35").toString().indexOf(".")));
				map.put("36", map.get("36").toString().substring(0, map.get("36").toString().indexOf(".")));
				Plan_lx_shuih shuih=new Plan_lx_shuih();
				shuih.setXzqhdm(map.get("1").toString());
				shuih.setLxbm(map.get("3").toString());
				shuih.setQdzh(map.get("8").toString());
				shuih.setZdzh(map.get("9").toString());
				shuih.setGydwdm(map.get("gydwdm").toString());
				shuih.setJhid(map.get("22").toString());//此处的Jhid存储的是 “上报年份”
				if(shuihServer.queryJhExist(shuih)==0){
					strVerify=ImportVerify.shuihVerify(map);
					Plan_lx_shuih queryGPSBylxbm = shuihServer.queryGPSBylxbm(shuih);
					if(queryGPSBylxbm==null){
						strVerify+="路线【"+map.get("4").toString()+"】【"+map.get("8").toString()+"-"+map.get("9").toString()+"】不正确或不属于您的管辖内;";
					}else if(queryGPSBylxbm!=null && strVerify.equals("")){
						map.put("yjsdj", queryGPSBylxbm.getYjsdj());
						map.put("tbbm", getTbbmbm2());
						//验证路线名称、起止里程是否相符
						if(!map.get("4").toString().equals(queryGPSBylxbm.getLxmc())){
							strVerify+="【"+map.get("4").toString()+"】与计划内的路线名称不符<br/>";
						}
//						else if(!map.get("10").toString().equals(queryGPSBylxbm.getQzlc())){
//							strVerify+="【"+map.get("4").toString()+"】与计划内的起止里程不符<br/>";
//						}
						else{
							map.put("sfylsjl", shuihServer.queryJlBylx(shuih)>0 ?"是" :"否");
						}
						
						//根据行政区划查询是否有特殊地区  此处存储的为特殊地区名称
						shuih.setTsdqbm(shuihServer.queryTsdqByXzqh(shuih.getXzqhdm()));
						shuih.setYjsdj(queryGPSBylxbm.getYjsdj());
						//设置非路网项目的查询条件
						Plan_flwbzbz flw=new Plan_flwbzbz();
						flw.setXmlx("水毁项目");//建设项目类型
						flw.setGldj(shuih.getLxbm().substring(0, 1));//公路等级
						flw.setJsdj(shuih.getYjsdj());//技术等级
						flw.setTsdq(shuih.getTsdqbm());
						Plan_flwbzbz flwResult=shuihServer.queryBzzj(flw);
						Integer bzzj=null;//对应补助标准金额
						if(flwResult==null && defaultFlwje==null){
							flw.setXmlx(null);
							flw.setGldj(null);
							flw.setJsdj(null);
							flw.setTsdq(null);
							flwResult=shuihServer.queryBzzj(flw);
						}
						bzzj = flwResult==null ? new Integer(defaultFlwje.getBzzj()) : new Integer(flwResult.getBzzj());
						//验证金额
						Double yhlc=new Double(map.get("11").toString());
						double je=new Double(Math.rint(yhlc.doubleValue()*bzzj.intValue())).doubleValue();
						Integer pfztz=new Integer(map.get("34").toString());
						int fdbz=new Integer(flwResult.getFdbz()).intValue();//浮动标准
						System.out.println("总投资"+pfztz.intValue()+"   计算"+je+"   浮动"+fdbz+"  标准："+bzzj.intValue());
						if(!(pfztz.intValue()>=je-fdbz) || !(pfztz.intValue()<=je+fdbz)){
							strVerify+="<br/>批复总投资不在计算结果的范围内<br/>";
						}
					}
				}else{
					strVerify="路线【"+map.get("4").toString()+"】【"+map.get("8").toString()+"-"+map.get("9").toString()+"】已存在计划！";
				}
				if(!strVerify.equals("")){
					break;
				}
			}
			System.out.println(data);
			if(strVerify.equals("")){
				boolJh=shuihServer.insertShuih_Jh(data);
				boolLx=shuihServer.insertShuih_Lx(data);
			}
			//将数据插入到数据库
			if(boolJh && boolLx)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败\r\n"+strVerify);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void exportShuihZjxdExcel(){
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
		attribute.put("7", "stz");//省投资
		attribute.put("8", "jhxdwh");//计划下达文号
		attribute.put("9", "xmid");
		//准备数据
		String gydwmc=zjxdServer.queryGydwmcById(lx.getGydwdm());
		List<Object> excelData = new ArrayList<Object>();
		if(lx.getGydwdm().equals("36")){
			lx.setGydwdm(null);
		}
		for (Plan_shuih item : shuihServer.queryShuihList(jh, lx)) {
			Plan_zjxd zjxd=new Plan_zjxd();
			zjxd.setXmmc(item.getXmmc());
			String strLx="";
			for (int i = 0; i <item.getShuihs().size(); i++) {
				strLx+=item.getShuihs().get(i).getLxmc()+"-"+
						item.getShuihs().get(i).getLxbm()+"("+
						item.getShuihs().get(i).getQdzh()+"-"+
						item.getShuihs().get(i).getZdzh()+")";
				if(i!=item.getShuihs().size()-1){
					strLx+="\r\n";
				}
			}
			zjxd.setLxxx(strLx);
			zjxd.setPfztz(item.getPfztz());
			zjxd.setXmid(item.getId());
			zjxd.setTbdw(gydwmc);
			excelData.add(zjxd);
		}
		ExcelEntity excel=new ExcelEntity("水毁项目",title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, "水毁项目-资金下达", getresponse());
	}
	
	public void insertShuih() throws IOException, Exception{
		Map<String, String> result=new HashMap<String, String>();
		Plan_lx_shuih shuih=new Plan_lx_shuih();
		shuih.setXzqhdm(lx.getXzqhdm());
		shuih.setLxbm(lx.getLxbm());
		shuih.setQdzh(lx.getQdzh());
		shuih.setZdzh(lx.getZdzh());
		shuih.setGydwdm(lx.getGydwdm());
		shuih.setYjsdj(lx.getYjsdj());
		shuih.setJhid(jh.getSbnf());//此处的Jhid存储的是 “上报年份”
		String strResult="false";
		if(shuihServer.queryJhExist(shuih)==0){
			Plan_lx_shuih queryGPSBylxbm = shuihServer.queryGPSBylxbm(shuih);
			if(queryGPSBylxbm!=null){
				UUID jhId = UUID.randomUUID(); 
				lx.setJhid(jhId.toString());
				jh.setId(jhId.toString());
				jh.setSfylsjl(shuihServer.queryJlBylx(shuih)>0 ?"是" :"否");
				boolean lxresult = shuihServer.insertShuihLx(lx);
				boolean jhresult = shuihServer.insertShuihJh(jh);
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
	}
	public void insertShuihLx(){
		try{
			Map<String, String> result=new HashMap<String, String>();
			Plan_lx_shuih shuih=new Plan_lx_shuih();
			shuih.setXzqhdm(lx.getXzqhdm());
			shuih.setLxbm(lx.getLxbm());
			shuih.setQdzh(lx.getQdzh());
			shuih.setZdzh(lx.getZdzh());
			shuih.setGydwdm(lx.getGydwdm());
			shuih.setYjsdj(lx.getYjsdj());
			shuih.setJhid(jh.getSbnf());//此处的Jhid存储的是 “上报年份”
			String strResult="false";
			if(shuihServer.queryJhExist(shuih)==0){
				Plan_lx_shuih queryGPSBylxbm = shuihServer.queryGPSBylxbm(shuih);
				if(queryGPSBylxbm!=null){
					boolean lxresult = shuihServer.insertShuihLx(lx);
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
	public void shAutoCompleteLxbm() throws IOException, Exception{
		List<Plan_lx_shuih> list=shuihServer.shAutoCompleteLxbm(lx);
		JsonUtils.write(list, getresponse().getWriter());
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
	public Plan_shuihServer getShuihServer() {
		return shuihServer;
	}
	public void setShuihServer(Plan_shuihServer shuihServer) {
		this.shuihServer = shuihServer;
	}
	public Plan_shuih getJh() {
		return jh;
	}
	public void setJh(Plan_shuih jh) {
		this.jh = jh;
	}
	public Plan_lx_shuih getLx() {
		return lx;
	}
	public void setLx(Plan_lx_shuih lx) {
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
}
