package com.hdsx.jxzhpt.jhgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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

import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjzj;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_zhfzServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.impl.CbsjServerImpl;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.MyUtil;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_zhfzController  extends BaseActionSupport{
	private int page=1;
	private int rows=10;
	@Resource(name = "plan_zhfzServerImpl")
	private Plan_zhfzServer zhfzServer;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	private Plan_zhfz jh;
	private Plan_upload uploads;
	private Jckzhfz lx;
	private Sckzhfz sc;
	private Plan_zjzj zjzj;
	private String fileuploadFileName;
	private File fileupload;
	private File uploadGk;
	private String uploadGkFileName;
	private File uploadSjt;
	private String uploadSjtFileName;
	//批量审批
	public void editZhfzStatusBatch(){
		try {
			lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			Map<String, String> result=new HashMap<String, String>();
			List<Plan_zhfz> splist = zhfzServer.queryZhfzByStatus(jh,lx);
			for (Plan_zhfz item : splist) {
				item.setJh_sbthcd(""+(new Integer(item.getJh_sbthcd())+2));
				item.setSpzt("1");
				item.setSpsj(new Date());
				item.setSpbmdm(lx.getXzqhdm());//这里行政区划代码保存的是管养单位编码
			}
			result.put("result", new Boolean(zhfzServer.updateStatusBatch(splist)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryZhfzByStatus(){
		try {
			lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
//			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			JsonUtils.write(zhfzServer.queryZhfzByStatus(jh, lx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void querySumZhfz(){
		try {
			lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
			if(lx.getGydwlx()!=null&&!"".equals(lx.getGydwlx())){
				lx.setGydwbm(lx.getGydwbm()+"  and lx.gydwbm like '"+lx.getGydwlx()+"%'");
			}
			if(lx.getGldj()!=null)
				if(lx.getGldj().length()>0){
					String[] tsdqs=lx.getLxbm().split(",");
					String tsdq="and substr(lxbm,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					lx.setGldj(tsdq);
				}
			if(jh.getSbnf()!=null)
				if(jh.getSbnf().length()>0){
					String[] sbnfs=jh.getSbnf().split(",");
					String sbnf="and jh.sbnf in (";
					for (int i = 0; i < sbnfs.length; i++) {
						if("全部".equals(sbnfs[i])){
							sbnf="";
							break;
						}
						if(i==0)
							sbnf+="'"+sbnfs[i]+"'";
						else
							sbnf+=",'"+sbnfs[i]+"'";
					}
					if(sbnf==""){
						sbnf="";
					}else{
						sbnf+=")";
					}
					jh.setSbnf(sbnf);
				}
			lx.setLxbm(MyUtil.getQueryTJ(lx.getLxbm(), "lxbm"));
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			JsonUtils.write(zhfzServer.querySumZhfz(jh,lx), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * excel导出
	 * 通过flag来区分导出哪个excel
	 * 导出的excel将要设置sheet名，数据，表头，以及excel文件名
	 */
	public void exportExcel_jh_zhfz(){
		lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
		lx.setLxbm(MyUtil.getQueryTJ(lx.getLxbm(), "lxbm"));
		List<Excel_list> list = new ArrayList<Excel_list>();
		if(jh.getSbnf()!=null)
			if(jh.getSbnf().length()>0){
				String[] sbnfs=jh.getSbnf().split(",");
				String sbnf="and jh.sbnf in (";
				for (int i = 0; i < sbnfs.length; i++) {
					if("全部".equals(sbnfs[i])){
						sbnf="";
						break;
					}
					if(i==0)
						sbnf+="'"+sbnfs[i]+"'";
					else
						sbnf+=",'"+sbnfs[i]+"'";
				}
				if(sbnf==""){
					sbnf="";
				}else{
					sbnf+=")";
				}
				jh.setSbnf(sbnf);
			}
		list = zhfzServer.exportExcel_jh(jh, lx);
		
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("普通公路路网结构改造工程计划表（灾害防治工程）");//设置第一行
		eldata.setSheetName("灾害防治工程");//设置sheeet名
		eldata.setFileName("普通公路路网结构改造工程计划表（灾害防治工程）");//设置文件名
		
		eldata.setEl(list);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("序号",1,2,0,0));
		et.add(new Excel_tilte("设区市",1,2,1,1));
		et.add(new Excel_tilte("县（市、区）",1,2,2,2));
		et.add(new Excel_tilte("最新年报桩号",1,1,3,6));
		et.add(new Excel_tilte("路网规划前",1,1,7,10));
		et.add(new Excel_tilte("总里程（公里）",1,2,11,11));
		et.add(new Excel_tilte("隐患里程（ 公 里 ）",1,2,12,12));
		et.add(new Excel_tilte("总投资（万元）",1,2,13,13));
		et.add(new Excel_tilte("中央车购税资金（万元）",1,2,14,14));
		et.add(new Excel_tilte("地方自筹",1,2,15,15));
		et.add(new Excel_tilte("建设性质",1,2,16,16));
		et.add(new Excel_tilte("建设内容",1,2,17,17));
		et.add(new Excel_tilte("批复文号",1,2,18,18));
		et.add(new Excel_tilte("建设年度",1,2,19,19));
		et.add(new Excel_tilte("管养单位",1,2,20,20));
		et.add(new Excel_tilte("备注",1,2,21,21));
		et.add(new Excel_tilte("特殊地区",1,2,22,22));
		et.add(new Excel_tilte("路线编码",2,2,3,3));
		et.add(new Excel_tilte("路线名称",2,2,4,4));
		et.add(new Excel_tilte("起点桩号",2,2,5,5));
		et.add(new Excel_tilte("讫点桩号",2,2,6,6));
		et.add(new Excel_tilte("路线编码",2,2,7,7));
		et.add(new Excel_tilte("路线名称",2,2,8,8));
		et.add(new Excel_tilte("起点桩号",2,2,9,9));
		et.add(new Excel_tilte("讫点桩号",2,2,10,10));
		
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export(eldata,response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		/*excelHtml="<tr><td>计划状态</td><td>上报年份</td><td>计划开工时间</td><td>计划完工时间</td><td>管养单位</td><td>行政区划名称</td><td>路线编码</td><td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>建设规模</td><td>批复总投资</td></tr>";
		sheetb.setTableName("灾害防治项目");
		sheetb.setHeader(excelHtml);
		sheetb.setSheetName("灾害");
		tableName="灾害防治项目";//excel 文件的名字
		sheetb.setColnum((short)12);
		sheetb.setList(list);
		sheetb.setFooter(null);
		sheetBeans.add(sheetb);
		String stylefileName="module.xls";
		//导出excel
		ee.initStyle(ee.workbook, stylefileName);
		HttpServletResponse response= getresponse();
		ee.makeExcel(tableName, sheetBeans, response);*/
	}
	/**
	 * 导入灾害计划
	 */
	public void importZhfz_jh(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
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
				dataMapArray = ExcelReader.readExcelContent(4,23,fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			//将数据插入到数据库
			boolean b=zhfzServer.importZhfz_jh(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void queryZhfzList(){
		try {
			lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
			if(lx.getGydwlx()!=null&&!"".equals(lx.getGydwlx())){
				lx.setGydwbm(lx.getGydwbm()+"  and lx.gydwbm like '"+lx.getGydwlx()+"%'");
			}
			lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
			if(lx.getGldj()!=null)
				if(lx.getGldj().length()>0){
					String[] tsdqs=lx.getLxbm().split(",");
					String tsdq="and substr(lxbm,0,1) in (";
					for (int i = 0; i < tsdqs.length; i++) {
						if("全部".equals(tsdqs[i])){
							tsdq="";
							break;
						}
						if(i==0)
							tsdq+="'"+tsdqs[i]+"'";
						else
							tsdq+=",'"+tsdqs[i]+"'";
					}
					if(tsdq==""){
						tsdq="";
					}else{
						tsdq+=")";
					}
					lx.setGldj(tsdq);
				}
			
			if(jh.getSbnf()!=null)
				if(jh.getSbnf().length()>0){
					String[] sbnfs=jh.getSbnf().split(",");
					String sbnf="and jh.sbnf in (";
					for (int i = 0; i < sbnfs.length; i++) {
						if("全部".equals(sbnfs[i])){
							sbnf="";
							break;
						}
						if(i==0)
							sbnf+="'"+sbnfs[i]+"'";
						else
							sbnf+=",'"+sbnfs[i]+"'";
					}
					if(sbnf==""){
						sbnf="";
					}else{
						sbnf+=")";
					}
					jh.setSbnf(sbnf);
				}
			lx.setLxbm(MyUtil.getQueryTJ(lx.getLxbm(), "lxbm"));
			
			
			List<Plan_zhfz> list = zhfzServer.queryZhfzList(page, rows, jh, lx);
			System.out.println("个数："+list.size());
			Map<String, Object> jsonMap=new HashMap<String, Object>();
			jsonMap.put("rows", zhfzServer.queryZhfzList(page, rows, jh, lx));
			jsonMap.put("total", zhfzServer.queryZhfzCount(jh, lx));
			JsonUtils.write(jsonMap, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void queryZhfaById(){
		try {
			JsonUtils.write(zhfzServer.queryZhfzById(jh.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 方法弃用
	 */
	public void queryZhfaNfs(){
		try {
			JsonUtils.write(zhfzServer.queryZhfaNfs(),getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropZhfzById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("edit", new Boolean(zhfzServer.updateLrztBySckid(jh.getId())).toString());
			result.put("drop", new Boolean(zhfzServer.dropZhfzById(jh.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editZhfzById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("jh", new Boolean((zhfzServer.editZhfzById(jh)>0)).toString());
			result.put("sc", new Boolean(zhfzServer.editZhfzSckBysckid(sc)).toString());
			JsonUtils.write(result, getresponse().getWriter());
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editZhfzStatus(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(zhfzServer.editZhfzStatus(jh)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void uploadZhfzFile() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			response.setCharacterEncoding("utf-8"); 	
			String fid=UUID.randomUUID().toString();
			if((uploadGk!=null)){
				String fileurl = "E:\\江西综合平台上传文件\\kgbg\\"+ jh.getSbnf() +"\\";
				File file =new File(fileurl);
				Plan_upload upload =new Plan_upload(fid,uploadGkFileName, "工可报告", uploads.getParentid(), fileurl+uploadGkFileName, null);
				CbsjServer cbsjServer =new CbsjServerImpl();
				upload.setFid(fid);
				if(cbsjServer.insertFile(upload) && cbsjServer.insertFileJl(upload)){
					uploadFile(file,uploadGkFileName,uploadGk);
					response.getWriter().print(uploadGkFileName+"上传成功！");
				}
			}else{
				String fileurl = "E:\\江西综合平台上传文件\\sjsgt\\"+ jh.getSbnf() +"\\";
				File file =new File(fileurl);
				Plan_upload upload =new Plan_upload(fid,uploadSjtFileName, "设计施工图", uploads.getParentid(), fileurl+uploadSjtFileName, null);
				CbsjServer cbsjServer =new CbsjServerImpl();
				upload.setFid(fid);
				if(cbsjServer.insertFile(upload) && cbsjServer.insertFileJl(upload)){
					uploadFile(file,uploadSjtFileName,uploadSjt);
					response.getWriter().print(uploadSjtFileName+"上传成功！");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print((uploadSjtFileName==null ? uploadGkFileName : uploadSjtFileName) +"上传成功！");
		}
	}
	private void uploadFile(File file,String fileName,File filewj) throws FileNotFoundException,IOException {
		if(!file.exists()){
			file.mkdirs();
		}
		InputStream is = new FileInputStream(filewj); 
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
	public void downZhfzFile(){
        try {
        	Plan_zhfz zhfz =zhfzServer.queryZhfzFjById(jh.getId());
        	HttpServletResponse response = getresponse();
        	response.setContentType("application/x-download"); 
        	if("gkbg".equals(jh.getGkbgmc())){
        		OutputStream output = response.getOutputStream();
        		response.addHeader("Content-Disposition", "attachment;filename="+new String(zhfz.getGkbgmc().getBytes("gb2312"),"ISO-8859-1"));
        		byte[]  buffer= zhfz.getGkbgdata();
                output.write(buffer);
                output.flush();
                output.close();
        	}else{
        		OutputStream output = response.getOutputStream();
        		response.addHeader("Content-Disposition", "attachment;filename="+new String(zhfz.getSjsgtmc().getBytes("gb2312"),"ISO-8859-1"));
        		byte[]  buffer= zhfz.getSjsgtdata();
                output.write(buffer);
                output.flush();
                output.close();
        	}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void exportZhfzZjxdExcel(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[10];
		title[0]=new ExcelTitleCell("路线信息",false, new ExcelCoordinate(0, (short)0), null,50);
		title[1]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)1), null,15);
		title[2]=new ExcelTitleCell("填报单位",false, new ExcelCoordinate(0, (short)2), null,15);
		title[3]=new ExcelTitleCell("下达年份",false, new ExcelCoordinate(0, (short)3), null,15);
		title[4]=new ExcelTitleCell("总补助资金",false, new ExcelCoordinate(0, (short)4), null,15);
		title[5]=new ExcelTitleCell("车购税",false, new ExcelCoordinate(0, (short)5), null,15);
		title[6]=new ExcelTitleCell("省投资",false, new ExcelCoordinate(0, (short)6), null,15);
		title[7]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)7), null,15);
		title[8]=new ExcelTitleCell("总投资",false, new ExcelCoordinate(0, (short)8), null,20);
		title[9]=new ExcelTitleCell("ID",true, new ExcelCoordinate(0, (short)9), null,20);
		//设置列与字段对应7
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "lxxx");//路线信息
		attribute.put("1", "pfztz");//批复总投资
		attribute.put("2", "tbdw");//填报单位-即导出单位
		attribute.put("3", "xdnf");//下达年份
		attribute.put("4", "xdzj");//下达的总投资
		attribute.put("5", "btzzj");//下达的部投资
		attribute.put("6", "stz");//省投资
		attribute.put("7", "jhxdwh");//计划下达文号
		attribute.put("8", "ztz");//下达的部投资
		attribute.put("9", "xmid");
		//准备数据
		String gydwmc=zjxdServer.queryGydwmcById(lx.getGydwdm());
		List<Object> excelData = new ArrayList<Object>();
		if(lx.getGydwdm().equals("36")){
			lx.setGydwdm(null);
		}
		//此处遍历查询计划资金下达模块的所有项目
		lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
		for (Plan_zhfz item : zhfzServer.queryZhfzList(jh, lx)) {
			Plan_zjxd zjxd=new Plan_zjxd();
			String strLx=item.getJckzhfz().getLxmc()+"-"+
					item.getJckzhfz().getLxbm()+"("+
					item.getJckzhfz().getQdzh()+"-"+
					item.getJckzhfz().getZdzh()+")";
			zjxd.setLxxx(strLx);
			zjxd.setPfztz(item.getPfztz());
			zjxd.setXmid(item.getId());
			zjxd.setTbdw(gydwmc);
			excelData.add(zjxd);
		}
		ExcelEntity excel=new ExcelEntity("灾害防治",title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, "灾害防治-计划资金下达", getresponse());
	}
	public void exportExcelZhfzJhSh(){
		lx.setGydwbm(gydwBm(lx.getGydwbm(),"gydwbm"));
		lx.setXzqhdm(gydwOrxzqhBm(lx.getXzqhdm(),"xzqhdm"));
		String fileTitle="<title=行政区划,fieid=xzqhmc>,<title=管养单位,fieid=gydw>,<title=路线编码,fieid=lxbm>,<title=路线名称,fieid=lxmc>,<title=审查起点桩号,fieid=scqdzh>,<title=审查止点桩号,fieid=sczdzh>,<title=审查总里程,fieid=sczlc>,<title=审查隐患里程,fieid=scyhlc>,<title=方案评估单位,fieid=fapgdw>,<title=方案审查单位,fieid=fascdw>,<title=方案审批时间,fieid=faspsj>,<title=审批文号,fieid=spwh>,<title=投资估算,fieid=tzgs>,<title=建设性质,fieid=jsxz>,<title=建设内容,fieid=jsnr>,<title=审查备注,fieid=scbz>,<title=上报年份,fieid=sbnf>,<title=计划开工时间,fieid=jhkgsj1>,<title=计划完工时间,fieid=jhwgsj1>,<title=设计单位,fieid=sjdw>,<title=设计批复单位,fieid=sjpfdw>,<title=批复文号,fieid=pfwh>,<title=批复时间,fieid=pfsj1>,<title=是否申请按比例补助,fieid=sfsqablbz>,<title=按比例补助申请文号,fieid=ablbzsqwh>,<title=批复总投资,fieid=pfztz>,<title=部补助资金,fieid=jhsybzje>,<title=地方自筹,fieid=jhsydfzcje>,<title=备注,fieid=bz>,<title=计划ID,fieid=id,hidden=true>,<title=审查库ID,fieid=sckid,hidden=true>";
		String fileName="灾害防治计划库审核";
		List<Object> excelData=new ArrayList<Object>();
		excelData =zhfzServer.exportExcelZhfzJhSh(jh, lx);
		ExcelExportUtil.excelWrite(excelData, fileName, fileTitle,getresponse());
	}
	public void importExcelZhfzJhSh(){
		String str="xzqhmc,gydw,lxbm,lxmc,scqdzh,sczdzh,sczlc,scyhlc,fapgdw,fascdw,faspsj,spwh,tzgs,jsxz,jsnr,scbz,sbnf,jhkgsj1,jhwgsj1,sjdw,sjpfdw,pfwh,pfsj1,sfsqablbz,ablbzsqwh,pfztz,jhsybzje,jhsydfzcje,bz,id,sckid";
		try {
			List<Plan_zhfz> list = ExcelImportUtil.readExcel(str, 0, Plan_zhfz.class,fileupload);
			if(zhfzServer.updateimportExcelZhfzJhSh(list)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
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
			result= bh.indexOf(",")==-1 ? " lx."+name+" like '%"+bh+"%'": "lx."+name+" in ("+bh+")";
		}
		return result;
	}
	public String gydwBm(String bh,String name){
		String result=null;
		if(bh!=null){
			if(bh.indexOf(",")==-1){
				int i=0;
				if(bh.matches("^[0-9]*[1-9]00$") || bh.matches("^[0-9]*[1-9][0-9]00$")){
					i=2;
				}else if(bh.matches("^[0-9]*[1-9]0000$")){
					i=4;
				}
				bh=bh.substring(0,bh.length()-i);
			}
		result = bh.indexOf(",")==-1 ?  " lx."+name+" like '%'||substr('"+bh+"',0,4)||'_'||substr('"+bh+"',6)||'%'" : "lx."+name+" in ("+bh+")";
		}
		return result;
	}
	/**
	 * 资金追加修改计划金额
	 * @throws Exception 
	 */
	public void editZhZj() throws Exception {
		try {
			String Strresult="false";
			jh.setPfztz(new Double(new Double(jh.getPfztz()).doubleValue()+new Double(zjzj.getZtz()).doubleValue()).toString());
			jh.setJhsybzje(new Double(new Double(jh.getJhsybzje()).doubleValue()+new Double(zjzj.getBbzje()).doubleValue()).toString());
			jh.setJhsydfzcje(new Double(new Double(jh.getJhsydfzcje().equals("")?"0":jh.getJhsydfzcje()).doubleValue()-new Double(zjzj.getStz()).doubleValue()).toString());
			if(zhfzServer.editZjById(jh) && zjxdServer.insertZjzj(zjzj)){
				Strresult="true";
			}
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", Strresult);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	//set get
	public int getPage() {
		return page;
	}
	public Plan_zjzj getZjzj() {
		return zjzj;
	}
	public void setZjzj(Plan_zjzj zjzj) {
		this.zjzj = zjzj;
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
	public Plan_zhfzServer getZhfzServer() {
		return zhfzServer;
	}
	public void setZhfzServer(Plan_zhfzServer zhfzServer) {
		this.zhfzServer = zhfzServer;
	}
	public Plan_zhfz getJh() {
		return jh;
	}
	public void setJh(Plan_zhfz jh) {
		this.jh = jh;
	}
	public Jckzhfz getLx() {
		return lx;
	}
	public void setLx(Jckzhfz lx) {
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
	public Sckzhfz getSc() {
		return sc;
	}
	public void setSc(Sckzhfz sc) {
		this.sc = sc;
	}
	public Plan_upload getUploads() {
		return uploads;
	}
	public void setUploads(Plan_upload uploads) {
		this.uploads = uploads;
	}
}
