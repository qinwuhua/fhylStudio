package com.hdsx.jxzhpt.jhgl.controller;

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

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_abgcServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_wqgzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_yhdzxServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.util.lang.JsonUtil;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_yhdzxController extends BaseActionSupport{
	private int page=1;
	private int rows=10;
	private Plan_yhdzx jh;
	private Plan_lx_yhdzx lx;
	private String gydwdm;
	private String tbbmbm2;
	@Resource(name = "plan_yhdzxServerImpl")
	private Plan_yhdzxServer yhdzxServer;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	private String fileuploadFileName;
	private File fileupload;
	private String zjlx;
	
	public void querySumYhdzx(){
		try {
			lx.setGydwdm(gydwOrxzqhBm(lx.getGydwdm(),"gydwdm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			JsonUtils.write(yhdzxServer.querySumYhdzx(jh,lx), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryYhdzxList(){
		try {
			lx.setGydwdm(gydwOrxzqhBm(lx.getGydwdm(),"gydwdm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			jsonMap.put("total", yhdzxServer.queryYhdzxCount(jh,lx));
			jsonMap.put("rows", yhdzxServer.queryYhdzxList(page,rows,jh,lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 根据ID查询养护大中修
	 */
	public void queryYhdzxById(){
		try {
			Plan_yhdzx yhdzx = yhdzxServer.queryYhdzxById(jh.getId());
			JsonUtils.write(yhdzx, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 删除养护大中修计划
	 */
	public void dropYhdzxById(){
		try {
			Map<String, Object> result=new HashMap<String, Object>();
			result.put("jh", new Boolean(yhdzxServer.dropYhdzxById(jh.getId())));
			result.put("lx", new Boolean(yhdzxServer.dropYhdzxLxByJhid(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改养护大中修状态
	 */
	public void editYhdzxStatus(){
		try {
			System.out.println("设计批复问好："+jh.getDevisenumbder());
			Map<String,String> result=new HashMap<String, String>();
			result.put("result", new Boolean(yhdzxServer.editYhdzxStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改养护大中修
	 */
	public void editYhdzxById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(yhdzxServer.editYhdzxById(jh, lx)).toString());
			//result.put("lx", new Boolean(yhdzxServer.editYhdzxLxById(jh,lx)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void editYhdzxLxById() throws IOException, Exception{
		Map<String, String> result=new HashMap<String, String>();
		try{
			result.put("lx", new Boolean(yhdzxServer.editYhdzxLxById(lx)).toString());
			result.put("jh", new Boolean(yhdzxServer.editYhdzxById(jh, lx)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 导出养护大中修Excel
	 */
	public void exportExcel_yhdzx(){
		try{
			lx.setGydwdm(gydwOrxzqhBm(lx.getGydwdm(),"gydwdm"));
//			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			List<Plan_yhdzx> queryYhdzxList = yhdzxServer.queryYhdzxList(jh,lx);
			List<Map<String,String>> excelData=new ArrayList<Map<String,String>>();
			for (Plan_yhdzx item : queryYhdzxList) {
				List<Plan_lx_yhdzx> lxlist = item.getPlan_lx_yhdzxs();
				for (Plan_lx_yhdzx itemlx : lxlist) {
					Map<String, String> lxmap=new HashMap<String, String>();
					lxmap.put("0", itemlx.getGydwmc());
					lxmap.put("1", itemlx.getXzqhmc());
					lxmap.put("2", itemlx.getLxbm());
					lxmap.put("3", itemlx.getLxmc());
					lxmap.put("4", itemlx.getQdzh());
					lxmap.put("5", itemlx.getZdzh());
					lxmap.put("6", itemlx.getQzlc());
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
			excelTitle.add("隐患里程");
			String tableName="养护大中修项目";
			HttpServletResponse response= getresponse();
			ExcelUtil.excelWrite(excelData, excelTitle, tableName, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 导入养护大中修计划Excel
	 * @throws Exception 
	 */
	public void importYhdzx_jh() throws Exception{
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
		HttpServletResponse response = ServletActionContext.getResponse();
		if(!"xls".equals(fileType)){
			response.getWriter().print(fileuploadFileName+"不是excel文件");
			return ;
		}
		response.setCharacterEncoding("utf-8"); 
		FileInputStream fs = new FileInputStream(this.fileupload);
		List<Map>[] dataMapArray;
		try{
			dataMapArray = ExcelReader.readExcelContent(3,40,fs,Plan_gcsj.class);
		}catch(Exception e){
			response.getWriter().print(fileuploadFileName+"数据有误");
			return;
		}
		String strVerify=null;
		boolean boolJh=true,boolLx=true;
		List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
		for (Map map : data) {
			UUID jhId = UUID.randomUUID(); 
			map.put("jhid", jhId.toString().replace("-", ""));
			map.put("gydwdm", getGydwdm());
			map.put("tbsj", new Date());
			map.put("tbbm", tbbmbm2);
			map.put("1", map.get("1").toString().substring(0, map.get("1").toString().indexOf(".")));
			String xzqh = map.get("1").toString();
			if(xzqh.matches("^[0-9]{5}36[0-9][1-9]00$") || xzqh.matches("^[0-9]{5}36[1-9][0-9]00$")){
				map.put("jh_sbthcd", 2);
			}else if(xzqh.matches("^[0-9]{5}36[0-9]{2}[0-9][1-9]$") || xzqh.matches("^[0-9]{5}36[0-9]{2}[1-9][0-9]$")){
				map.put("jh_sbthcd", 0);
			}
			map.put("15", map.get("15").toString().substring(0, map.get("15").toString().indexOf(".")));
		}
		System.out.println(data);
		yhdzxServer.insertYhdzx_jh(data);
		yhdzxServer.insertYhdzx_lx(data);
		//将数据插入到数据库
		if(boolJh && boolLx)
			response.getWriter().print(fileuploadFileName+"导入成功");
		else 
			response.getWriter().print(fileuploadFileName+"导入失败"+strVerify);
	}
	/**
	 * 养护大中修资金下达导出
	 */
	public void exportYhdzxZjxdExcel(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[9];
		title[0]=new ExcelTitleCell("路线信息",false, new ExcelCoordinate(0, (short)0), null,50);
		title[1]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)1), null,15);
		title[2]=new ExcelTitleCell("填报单位",false, new ExcelCoordinate(0, (short)2), null,15);
		title[3]=new ExcelTitleCell("下达年份",false, new ExcelCoordinate(0, (short)3), null,15);
		title[4]=new ExcelTitleCell("总投资",false, new ExcelCoordinate(0, (short)4), null,15);
		title[5]=new ExcelTitleCell("车购税",false, new ExcelCoordinate(0, (short)5), null,15);
		title[6]=new ExcelTitleCell("省投资",false, new ExcelCoordinate(0, (short)6), null,15);
		title[7]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)7), null,15);
		title[8]=new ExcelTitleCell("ID",true, new ExcelCoordinate(0, (short)8), null,20);
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "lxxx");//路线信息
		attribute.put("1", "pfztz");//批复总投资
		attribute.put("2", "tbdw");//填报单位-即导出单位
		attribute.put("3", "xdnf");//下达年份
		attribute.put("4", "xdzj");//下达的总投资
		attribute.put("5", "btzzj");//下达的部投资
		attribute.put("6", "stz");//省投资
		attribute.put("7", "jhxdwh");//计划下达文号
		attribute.put("8", "xmid");
		//准备数据
		String gydwmc=zjxdServer.queryGydwmcById(lx.getTbbmdm());
		List<Object> excelData = new ArrayList<Object>();
		if(lx.getTbbmdm().equals("36")){
			lx.setTbbmdm(null);
		}
		lx.setGydwdm(gydwOrxzqhBm(lx.getGydwdm(),"gydwdm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
		for (Plan_yhdzx item : yhdzxServer.queryYhdzxList(jh, lx)) {
			Plan_zjxd zjxd=new Plan_zjxd();
			String strLx="";
			for (int i = 0; i <item.getPlan_lx_yhdzxs().size(); i++) {
				strLx+=item.getPlan_lx_yhdzxs().get(i).getLxmc()+"-"+
						item.getPlan_lx_yhdzxs().get(i).getLxbm()+"("+
						item.getPlan_lx_yhdzxs().get(i).getQdzh()+"-"+
						item.getPlan_lx_yhdzxs().get(i).getZdzh()+")";
				if(i!=item.getPlan_lx_yhdzxs().size()-1){
					strLx+="\r\n";
				}
			}
			zjxd.setLxxx(strLx);
			zjxd.setPfztz(item.getTotalinvest());
			zjxd.setXmid(item.getId());
			zjxd.setTbdw(gydwmc);
			excelData.add(zjxd);
		}
		ExcelEntity excel=new ExcelEntity("养护大中修",title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, "养护大中修-资金下达", getresponse());
	}
	/**
	 * 单次添加养护大中修计划
	 * @throws IOException
	 * @throws Exception
	 */
	public void insertYhdzx() throws IOException, Exception{
		Map<String, String> result=new HashMap<String, String>();
		String strResult="false";
		if(jh.getTbbm().matches("^[0-9]*[1-9]00$")){
			jh.setJh_sbthcd("2");
		}else if(jh.getTbbm().matches("^[0-9]*[1-9]0$") || jh.getTbbm().matches("^[0-9]*[1-9]$")){
			jh.setJh_sbthcd("0");
		}else if(jh.getTbbm().matches("^[0-9]*[1-9]0000$")){
			
		}
		UUID uuid=UUID.randomUUID();
		jh.setId(uuid.toString());
		lx.setJhid(uuid.toString());
		lx.setTbsj(new Date());
		boolean jhresult=yhdzxServer.insertYhdzx_jh(jh);
		boolean lxresult=yhdzxServer.insertYhdzx_lx(lx);
		if(lxresult && jhresult){
			strResult="true";
		}
		result.put("result", strResult);
		JsonUtils.write(result, getresponse().getWriter());
	}
	/**
	 * 单次添加养护大中修路线
	 * @throws IOException
	 * @throws Exception
	 */
	public void insertYhdzxLx(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			String strResult="false";
			lx.setTbsj(new Date());
			if(zjlx!=null && zjlx.equals("true")){
				Plan_yhdzx yhdzx = yhdzxServer.queryYhdzxById(lx.getJhid());
				yhdzx.setFee(new Double(new Double(yhdzx.getFee()).doubleValue()+new Double(jh.getFee())).toString());
				yhdzx.setNewfee(new Double(new Double(yhdzx.getNewfee()).doubleValue()+new Double(jh.getNewfee())).toString());
				yhdzx.setTotalsubsidyfund(new Double(new Double(yhdzx.getTotalsubsidyfund()).doubleValue()+new Double(jh.getTotalsubsidyfund())).toString());
				yhdzx.setTotalplacefund(new Double(new Double(yhdzx.getTotalinvest()).doubleValue()-new Double(jh.getTotalsubsidyfund())).toString());
				yhdzxServer.editYhdzxById(yhdzx, lx);
			}
			
			boolean lxresult=yhdzxServer.insertYhdzx_lx(lx);
			if(lxresult){
				strResult="true";
			}
			result.put("result", strResult);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 单次添加养护大中修德编码提示
	 * @throws IOException
	 * @throws Exception
	 */
	public void yhdzxAutoCompleteLxbm() throws IOException, Exception{
		List<Plan_lx_yhdzx> list=yhdzxServer.yhdzxAutoCompleteLxbm(lx);
		JsonUtils.write(list, getresponse().getWriter());
	}
	/**
	 * 管养单位或行政区划代码处理
	 * @param bh
	 * @param name
	 * @return
	 */
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
	/**
	 * 资金追加，修改养护大中修金额
	 */
	public void editYhZj(){
		
	}
	//set get
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
	public Plan_yhdzx getJh() {
		return jh;
	}
	public void setJh(Plan_yhdzx jh) {
		this.jh = jh;
	}
	public Plan_lx_yhdzx getLx() {
		return lx;
	}
	public void setLx(Plan_lx_yhdzx lx) {
		this.lx = lx;
	}
	public Plan_yhdzxServer getYhdzxServer() {
		return yhdzxServer;
	}
	public void setYhdzxServer(Plan_yhdzxServer yhdzxServer) {
		this.yhdzxServer = yhdzxServer;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
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
	public String getZjlx() {
		return zjlx;
	}

	public void setZjlx(String zjlx) {
		this.zjlx = zjlx;
	}
}
