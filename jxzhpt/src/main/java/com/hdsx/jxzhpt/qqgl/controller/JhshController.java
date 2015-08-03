package com.hdsx.jxzhpt.qqgl.controller;


import java.io.ByteArrayOutputStream;
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
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.module.ExcelModule;
import com.hdsx.jxzhpt.qqgl.bean.Jhsh;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Kxxyj;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.qqgl.server.CbsjServer;
import com.hdsx.jxzhpt.qqgl.server.JhshServer;
import com.hdsx.jxzhpt.qqgl.server.impl.CbsjServerImpl;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.util.io.FileUtil;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Scope("prototype")
@Controller
public class JhshController extends BaseActionSupport implements ModelDriven<Jhsh>{
	//回复数据集合
	private Map<String, Object> result=new HashMap<String, Object>();
	//计划审核对象
	private Jhsh jhsh=new Jhsh();
	private Lx lx;
	@Override
	public Jhsh getModel() {
		return jhsh;
	}
	//分页参数
	private int page = 1;
	private int rows = 10;
	//上传文件对象参数
	private File uploadJhxd;
	private String uploadJhxdFileName;
	private File fileupload;
	private String fileuploadFileName;
	//数据访问对象
	@Resource(name="jhshServerImpl")
	private JhshServer jhshServer;
	//其他参数
	private String jdbs;//阶段标示，用于表明在计划的哪一阶段
	
	/**
	 * 查询计划审核列表
	 * @throws Exception 
	 */
	public void queryJhsh() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try {
			jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(),"xzqhdm"));
			if(jhsh.getXmlx()==1){
				listData=jhshServer.queryJhshLmsj(jhsh,page,rows);
				total=jhshServer.queryJhshCountLmsj(jhsh);
			}else if(jhsh.getXmlx()==2){
				listData=jhshServer.queryJhshLmgz(jhsh,page,rows);
				total=jhshServer.queryJhshCountLmgz(jhsh);
			}else if(jhsh.getXmlx()==3){
				listData=jhshServer.queryJhshXj(jhsh,page,rows);
				total=jhshServer.queryJhshCountXj(jhsh);
			}
			result.put("total", total);
			result.put("rows", listData);
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 查询计划审核列表 养护和水毁
	 * @throws Exception
	 */
	public void queryJhsh2() throws Exception{
		List<Jhsh> listData=null;
		int total=0;
		try{
			jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(), "xzqhdm"));
			if(jhsh.getXmlx()==4){
				listData=jhshServer.queryJhshYhdzx(jhsh,page,rows);
				total=jhshServer.queryJhshYhdzxCount(jhsh);
			}else if(jhsh.getXmlx()==5){
				listData=jhshServer.queryJhshSh(jhsh,page,rows);
				total=jhshServer.queryJhshShCount(jhsh);
			}
			result.put("rows", listData);
			result.put("total", total);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 计划下达，补充计划下达信息
	 * @throws Exception
	 */
	public void updateJhshxx() throws Exception{
		boolean b=false;
		try {
			List<Jhsh> list=new ArrayList<Jhsh>();
			list.add(jhsh);
			//准备路线桩号信息
			Lx lx=new Lx();
			lx.setQdzh(jhsh.getQdzh());
			lx.setZdzh(jhsh.getZdzh());
			lx.setXmid(jhsh.getXmbm());
			lx.setSffirst("1");
			lx.setJdbs(jdbs);
			
			if(jhsh.getXmlx()==1){
				b=jhshServer.updateJhshxxLmsj(list);
			}else if(jhsh.getXmlx()==2){
				b=jhshServer.updateJhshxxLmgz(list);
			}else if(jhsh.getXmlx()==3){
				b=jhshServer.updateJhshxxXj(list);
			}
			/*错误if(b){
				jhshServer.updateLx(lx);
			}*/
			result.put("result", new Boolean(b));
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 养护大中修和水毁的计划下达
	 * @throws Exception
	 */
	public void updateJhshxx2() throws Exception{
		try{
			boolean b=true;
			//准备路线桩号信息
			Lx lx=new Lx();
			lx.setQdzh(jhsh.getQdzh());
			lx.setZdzh(jhsh.getZdzh());
			lx.setQdmc(jhsh.getQdmc());
			lx.setZdmc(jhsh.getZdmc());
			lx.setXmid(jhsh.getXmbm());
			lx.setYilc(jhsh.getYilc());
			lx.setErlc(jhsh.getErlc());
			lx.setSanlc(jhsh.getSanlc());
			lx.setSilc(jhsh.getSilc());
			lx.setDwlc(jhsh.getDwlc());
			lx.setWllc(jhsh.getWllc());
			lx.setSffirst("1");
			lx.setJdbs(jdbs);
			
			if(jhsh.getXmlx()==4){
				b = jhshServer.updateJhshxxYhdzx(jhsh);
			}else if(jhsh.getXmlx()==5){
				b = jhshServer.updateJhshxxSh(jhsh);
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
	 * 上传计划下达文件
	 * @throws Exception
	 */
	@SuppressWarnings("resource")
	public void uploadJhsh(){
		HttpServletResponse response = ServletActionContext.getResponse();
		try {
			File file =new File(this.getClass().getResource("/").getPath()+"jhxdwj/"+jhsh.getXmbm().substring(0,4)+"/");
			if(uploadJhxd!=null){
				String fid=UUID.randomUUID().toString();
				Plan_upload uploads =new Plan_upload(fid,uploadJhxdFileName, "计划下达文件", jhsh.getXmbm(), 
						"jhxdwj/"+jhsh.getXmbm().substring(0,4)+"/"+jhsh.getXdwh() + uploadJhxdFileName.substring(uploadJhxdFileName.lastIndexOf(".")), jhsh.getXdwh());
				CbsjServer cbsjServer =new CbsjServerImpl();
				uploads.setFid(fid);
				Plan_upload result = cbsjServer.queryFileByWh(uploads);
				if(result==null && cbsjServer.insertFile(uploads) && cbsjServer.insertFileJl(uploads)){
					uploadFile(file,jhsh.getXdwh() + uploadJhxdFileName.substring(uploadJhxdFileName.lastIndexOf(".")));
					response.getWriter().print(uploadJhxdFileName+"上传成功！");
				}else{
					uploads.setFid(result.getId());
					cbsjServer.insertFileJl(uploads);
					response.getWriter().print(uploadJhxdFileName+"上传成功！");
				}
			}else{
				System.out.println("已存在");
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				response.getWriter().print(uploadJhxdFileName+"上传失败！");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
	}
	private void uploadFile(File file,String fileName) throws FileNotFoundException,
			IOException {
		if(!file.exists()){
			file.mkdirs();
		}
		InputStream is = new FileInputStream(uploadJhxd); 
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
	
	/**
	 * 根据项目编码查询计划审核信息
	 * @throws Exception
	 */
	public void queryJhshxxByXmbm2() throws Exception{
		try{
			Jhsh obj=null;
			if(jhsh.getXmlx()==4){
				obj = jhshServer.queryJhshxxYhdzxByXmbm(jhsh);
			}else if(jhsh.getXmlx()==5){
				obj = jhshServer.queryJhshxxShByXmbm(jhsh);
			}
			JsonUtils.write(obj, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据路线编码和起止点桩号，查询技术等级以及里程
	 * @throws Exception 
	 */
	public void queryJsdjAndLcByStartAndEnd() throws Exception{
		try{
			Lx result = jhshServer.queryJsdjAndLcByStartAndEnd(lx);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码查询立项审核信息
	 * @throws Exception
	 */
	public void queryLxshByXmbm() throws Exception{
		try {
			Lxsh obj=null;
			if(jhsh.getXmlx()==1)
				obj=jhshServer.queryLxshLmsjByXmbm(jhsh.getXmbm());
			else if(jhsh.getXmlx()==2)
				obj=jhshServer.queryLxshLmgzByXmbm(jhsh.getXmbm());
			else if(jhsh.getXmlx()==3)
				obj=jhshServer.queryLxshXjByXmbm(jhsh.getXmbm());
			JsonUtils.write(obj, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码查询计划审核信息
	 * @throws Exception
	 */
	public void queryJhshxxByXmbm() throws Exception{
		try {
			Jhsh obj=new Jhsh();
			if(jhsh.getXmlx()==1){
				obj=jhshServer.queryJhshxxLmsjByXmbm(jhsh.getXmbm());
			}else if(jhsh.getXmlx()==2){
				obj=jhshServer.queryJhshxxLmgzByXmbm(jhsh.getXmbm());
			}else if(jhsh.getXmlx()==3){
				obj=jhshServer.queryJhshxxXjByXmbm(jhsh.getXmbm());
			}
			JsonUtils.write(obj, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 导出计划审核信息
	 */
	public void exportJhshxx(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[15];
		title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
		title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
		title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
		title[3]=new ExcelTitleCell("起点桩号",false, new ExcelCoordinate(0, (short)3), null,20);
		title[4]=new ExcelTitleCell("讫点桩号",false, new ExcelCoordinate(0, (short)4), null,20);
		title[5]=new ExcelTitleCell("开工时间",false, new ExcelCoordinate(0, (short)5), null,20);
		title[6]=new ExcelTitleCell("完工时间",false, new ExcelCoordinate(0, (short)6), null,20);
		title[7]=new ExcelTitleCell("工期",false, new ExcelCoordinate(0, (short)7), null,20);
		title[8]=new ExcelTitleCell("工可批复文号",false, new ExcelCoordinate(0, (short)8), null,20);
		title[9]=new ExcelTitleCell("设计批复文号",true, new ExcelCoordinate(0, (short)9), null,20);
		title[10]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)10), null,20);
		title[11]=new ExcelTitleCell("计划下达时间",false, new ExcelCoordinate(0, (short)11), null,20);
		title[12]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)12), null,20);
		title[13]=new ExcelTitleCell("部补助资金",false, new ExcelCoordinate(0, (short)13), null,20);
		title[14]=new ExcelTitleCell("省补助资金",false, new ExcelCoordinate(0, (short)14), null,20);
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "qdzh");//起点桩号
		attribute.put("4", "zdzh");//止点桩号
		attribute.put("5", "kgsj");//开工时间
		attribute.put("6", "wgsj");//完工时间
		attribute.put("7", "gq");//工期
		attribute.put("8", "gkpfwh");//工可批复文号
		attribute.put("9", "sjpfwh");//设计批复文号
		attribute.put("10", "xdwh");//计划下达文号
		attribute.put("11", "xdsj");//计划下达时间
		attribute.put("12", "pfztz");//批复总投资
		attribute.put("13", "bbzzj");//部补助资金
		attribute.put("14", "sbzzj");//省补助资金
		jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(),"xzqhdm"));
		List<Object> excelData=new ArrayList<Object>();
		String titleName="";
		String fileName="";
		if(jhsh.getXmlx()==1){
			excelData.addAll(jhshServer.queryJhshLmsj(jhsh, 0, 0));
			titleName="升级改造工程项目";
			fileName="升级改造工程项目-计划下达";
		}
		else if(jhsh.getXmlx()==2){
			excelData.addAll(jhshServer.queryJhshLmgz(jhsh, 0, 0));
			titleName="路面改造工程项目";
			fileName="路面改造工程项目-计划下达";
		}
		else if(jhsh.getXmlx()==3){
			excelData.addAll(jhshServer.queryJhshXj(jhsh, 0, 0));
			titleName="新建工程项目";
			fileName="新建工程项目-计划下达";
		}
		ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, fileName, getresponse());
	}
	public void exportJhshYhdzx(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[32];
		title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
		title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
		title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
		title[3]=new ExcelTitleCell("开工时间",false, new ExcelCoordinate(0, (short)3), null,20);
		title[4]=new ExcelTitleCell("完工时间",false, new ExcelCoordinate(0, (short)4), null,20);
		title[5]=new ExcelTitleCell("工期",false, new ExcelCoordinate(0, (short)5), null,20);
		title[6]=new ExcelTitleCell("设计批复文号",true, new ExcelCoordinate(0, (short)6), null,20);
		title[7]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)7), null,20);
		title[8]=new ExcelTitleCell("计划下达时间",false, new ExcelCoordinate(0, (short)8), null,20);
		title[9]=new ExcelTitleCell("总投资",false, new ExcelCoordinate(0, (short)9), null,20);
		title[10]=new ExcelTitleCell("省以上助资金",false, new ExcelCoordinate(0, (short)10), null,20);
		title[11]=new ExcelTitleCell("已确定部车购税",false, new ExcelCoordinate(0, (short)11), null,20);
		title[12]=new ExcelTitleCell("原路线编号",false, new ExcelCoordinate(0, (short)12), null,20);
		title[13]=new ExcelTitleCell("起点名称",false, new ExcelCoordinate(0, (short)13), null,20);
		title[14]=new ExcelTitleCell("止点名称",false, new ExcelCoordinate(0, (short)14), null,20);
		title[15]=new ExcelTitleCell("起点桩号",false, new ExcelCoordinate(0, (short)15), null,20);
		title[16]=new ExcelTitleCell("止点桩号",false, new ExcelCoordinate(0, (short)16), null,20);
		title[17]=new ExcelTitleCell("里程",false, new ExcelCoordinate(0, (short)17), null,20);
		title[18]=new ExcelTitleCell("面层路面类型",false, new ExcelCoordinate(0, (short)18), null,20);
		title[19]=new ExcelTitleCell("面层材料类型",false, new ExcelCoordinate(0, (short)19), null,20);
		title[20]=new ExcelTitleCell("面层数量",false, new ExcelCoordinate(0, (short)20), null,20);
		title[21]=new ExcelTitleCell("面层金额",false, new ExcelCoordinate(0, (short)21), null,20);
		title[22]=new ExcelTitleCell("基层类型",false, new ExcelCoordinate(0, (short)22), null,20);
		title[23]=new ExcelTitleCell("基层数量",false, new ExcelCoordinate(0, (short)23), null,20);
		title[24]=new ExcelTitleCell("基层金额",false, new ExcelCoordinate(0, (short)24), null,20);
		title[25]=new ExcelTitleCell("下封层数量",false, new ExcelCoordinate(0, (short)25), null,20);
		title[26]=new ExcelTitleCell("下封层金额",false, new ExcelCoordinate(0, (short)26), null,20);
		title[27]=new ExcelTitleCell("标线数量",false, new ExcelCoordinate(0, (short)27), null,20);
		title[28]=new ExcelTitleCell("标线金额",false, new ExcelCoordinate(0, (short)28), null,20);
		title[29]=new ExcelTitleCell("灌缝数量",false, new ExcelCoordinate(0, (short)29), null,20);
		title[30]=new ExcelTitleCell("灌缝金额",false, new ExcelCoordinate(0, (short)30), null,20);
		title[31]=new ExcelTitleCell("老路处理",false, new ExcelCoordinate(0, (short)31), null,20);
		
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "kgsj");//开工时间
		attribute.put("4", "wgsj");//完工时间
		attribute.put("5", "gq");//工期
		attribute.put("6", "sjpfwh");//设计批复文号
		attribute.put("7", "xdwh");//计划下达文号
		attribute.put("8", "xdsj");//计划下达时间
		attribute.put("9", "ztz");//总投资
		attribute.put("10", "sysbbzj");//省以上资金
		attribute.put("11", "yqdbcgs");//以确定资金
		attribute.put("12", "ylxbh");
		attribute.put("13", "qdmc");
		attribute.put("14", "zdmc");
		attribute.put("15", "qdzh");
		attribute.put("16", "zdzh");
		attribute.put("17", "lc");
		attribute.put("18", "mclmlx");
		attribute.put("19", "mclx");
		attribute.put("20", "mcsl");
		attribute.put("21", "mcje");
		attribute.put("22", "jclx");
		attribute.put("23", "jcsl");
		attribute.put("24", "jcje");
		attribute.put("25", "xfcsl");
		attribute.put("26", "xfcje");
		attribute.put("27", "bxsl");
		attribute.put("28", "bxje");
		attribute.put("29", "gfcd");
		attribute.put("30", "gfje");
		attribute.put("31", "llcl");
		
		jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(),"xzqhdm"));
		List<Object> excelData=new ArrayList<Object>();
		String titleName="";
		String fileName="";
		if(jhsh.getXmlx()==4){
			excelData.addAll(jhshServer.queryJhshYhdzx(jhsh, 0, 0));
			titleName="养护大中修项目";
			fileName="养护大中修项目-计划下达";
		}
		ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, fileName, getresponse());
	}
	/**
	 * 导入养护大中修计划审核信息
	 */
	@SuppressWarnings("unchecked")
	public void importExcelJhxdYhdzx(){
		ExcelEntity excel=new ExcelEntity();
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "kgsj");//开工时间
		attribute.put("4", "wgsj");//完工时间
		attribute.put("5", "gq");//工期
		attribute.put("6", "sjpfwh");//设计批复文号
		attribute.put("7", "xdwh");//计划下达文号
		attribute.put("8", "xdsj");//计划下达时间
		attribute.put("9", "ztz");//总投资
		attribute.put("10", "sysbbzj");//省以上资金
		attribute.put("11", "yqdbcgs");//以确定资金
		attribute.put("12", "ylxbh");
		attribute.put("13", "qdmc");
		attribute.put("14", "zdmc");
		attribute.put("15", "qdzh");
		attribute.put("16", "zdzh");
		attribute.put("17", "lc");
		attribute.put("18", "mclmlx");
		attribute.put("19", "mclx");
		attribute.put("20", "mcsl");
		attribute.put("21", "mcje");
		attribute.put("22", "jclx");
		attribute.put("23", "jcsl");
		attribute.put("24", "jcje");
		attribute.put("25", "xfcsl");
		attribute.put("26", "xfcje");
		attribute.put("27", "bxsl");
		attribute.put("28", "bxje");
		attribute.put("29", "gfcd");
		attribute.put("30", "gfje");
		attribute.put("31", "llcl");
		excel.setAttributes(attribute);
		try {
			List<Jhsh> readerExcel = ExcelImportUtil.readerExcel(fileupload, Jhsh.class, 1, excel);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Jhsh item : readerExcel) {
				item.setXdzt(1);
				//准备路线桩号信息
				Lx lx=new Lx();
				lx.setQdmc(item.getQdmc());
				lx.setZdmc(item.getZdmc());
				lx.setQdzh(item.getQdzh());
				lx.setZdzh(item.getZdzh());
				lx.setXmid(item.getXmbm());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(jhshServer.updateJhshxxYhdzx(readerExcel) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导出灾毁重建Excel
	 */
	public void exportJhshSh(){
		//设置表头
				ExcelTitleCell [] title=new ExcelTitleCell[18];
				title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
				title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
				title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
				title[3]=new ExcelTitleCell("开工时间",false, new ExcelCoordinate(0, (short)3), null,20);
				title[4]=new ExcelTitleCell("完工时间",false, new ExcelCoordinate(0, (short)4), null,20);
				title[5]=new ExcelTitleCell("工期",false, new ExcelCoordinate(0, (short)5), null,20);
				title[6]=new ExcelTitleCell("设计批复文号",true, new ExcelCoordinate(0, (short)6), null,20);
				title[7]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)7), null,20);
				title[8]=new ExcelTitleCell("计划下达时间",false, new ExcelCoordinate(0, (short)8), null,20);
				title[9]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)9), null,20);
				title[10]=new ExcelTitleCell("省补助资金",false, new ExcelCoordinate(0, (short)10), null,20);
				title[11]=new ExcelTitleCell("部补助资金",false, new ExcelCoordinate(0, (short)11), null,20);
				title[12]=new ExcelTitleCell("原路线编号",false, new ExcelCoordinate(0, (short)12), null,20);
				title[13]=new ExcelTitleCell("起点名称",false, new ExcelCoordinate(0, (short)13), null,20);
				title[14]=new ExcelTitleCell("止点名称",false, new ExcelCoordinate(0, (short)14), null,20);
				title[15]=new ExcelTitleCell("起点桩号",false, new ExcelCoordinate(0, (short)15), null,20);
				title[16]=new ExcelTitleCell("止点桩号",false, new ExcelCoordinate(0, (short)16), null,20);
				title[17]=new ExcelTitleCell("里程",false, new ExcelCoordinate(0, (short)17), null,20);
				
				//设置列与字段对应
				Map<String, String> attribute=new HashMap<String, String>();
				attribute.put("0", "xmmc");//项目名称
				attribute.put("1", "xmbm");//项目编码
				attribute.put("2", "xzqh");//行政区划
				attribute.put("3", "kgsj");//开工时间
				attribute.put("4", "wgsj");//完工时间
				attribute.put("5", "gq");//工期
				attribute.put("6", "sjpfwh");//设计批复文号
				attribute.put("7", "xdwh");//计划下达文号
				attribute.put("8", "xdsj");//计划下达时间
				attribute.put("9", "pfztz");//批复总投资
				attribute.put("10", "bbzzj");//部补助资金
				attribute.put("11", "sbzzj");//省补助资金
				attribute.put("12", "ylxbh");
				attribute.put("13", "qdmc");
				attribute.put("14", "zdmc");
				attribute.put("15", "qdzh");
				attribute.put("16", "zdzh");
				attribute.put("17", "lc");
				
				jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(),"xzqhdm"));
				List<Object> excelData=new ArrayList<Object>();
				String titleName="";
				String fileName="";
				excelData.addAll(jhshServer.queryJhshSh(jhsh, 0, 0));
				titleName="灾毁重建项目";
				fileName="灾毁重建项目-计划下达";
				ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
				ExcelExportUtil.excelWrite(excel, fileName, getresponse());
	}
	/**
	 * 导入水毁计划审核
	 */
	@SuppressWarnings("unchecked")
	public void importExcelJhxdSh(){
		ExcelEntity excel=new ExcelEntity();
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "kgsj");//开工时间
		attribute.put("4", "wgsj");//完工时间
		attribute.put("5", "gq");//工期
		attribute.put("6", "sjpfwh");//设计批复文号
		attribute.put("7", "xdwh");//计划下达文号
		attribute.put("8", "xdsj");//计划下达时间
		attribute.put("9", "pfztz");//批复总投资
		attribute.put("10", "bbzzj");//部补助资金
		attribute.put("11", "sbzzj");//省补助资金
		attribute.put("12", "ylxbh");
		attribute.put("13", "qdmc");
		attribute.put("14", "zdmc");
		attribute.put("15", "qdzh");
		attribute.put("16", "zdzh");
		attribute.put("17", "lc");
		excel.setAttributes(attribute);
		try {
			List<Jhsh> readerExcel = ExcelImportUtil.readerExcel(fileupload, Jhsh.class, 1, excel);
			List<Lx> lxlist =new ArrayList<Lx>();
			for (Jhsh item : readerExcel) {
				item.setXdzt(1);
				//准备路线桩号信息
				Lx lx=new Lx();
				lx.setQdmc(item.getQdmc());
				lx.setZdmc(item.getZdmc());
				lx.setQdzh(item.getQdzh());
				lx.setZdzh(item.getZdzh());
				lx.setXmid(item.getXmbm());
				lx.setSffirst("1");
				lx.setJdbs("2");
				lxlist.add(lx);
			}
			if(jhshServer.updateJhshxxSh(readerExcel) && jhshServer.updateLx(lxlist)){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 导出资金下达Excel
	 */
	public void exportZjxd(){
		//设置表头
		ExcelTitleCell [] title=new ExcelTitleCell[12];
		title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,20);
		title[1]=new ExcelTitleCell("项目编码",false, new ExcelCoordinate(0, (short)1), null,20);
		title[2]=new ExcelTitleCell("行政区划",false, new ExcelCoordinate(0, (short)2), null,20);
		title[3]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)3), null,20);
		title[4]=new ExcelTitleCell("计划下达时间",false, new ExcelCoordinate(0, (short)4), null,20);
		title[5]=new ExcelTitleCell("批复总投资",false, new ExcelCoordinate(0, (short)5), null,20);
		title[6]=new ExcelTitleCell("部补助资金",false, new ExcelCoordinate(0, (short)6), null,20);
		title[7]=new ExcelTitleCell("省补助资金",false, new ExcelCoordinate(0, (short)7), null,20);
		title[8]=new ExcelTitleCell("下达年份",false, new ExcelCoordinate(0, (short)8), null,20);
		title[9]=new ExcelTitleCell("下达总投资",false, new ExcelCoordinate(0, (short)9), null,20);
		title[10]=new ExcelTitleCell("下达车购税",false, new ExcelCoordinate(0, (short)10), null,20);
		title[11]=new ExcelTitleCell("下达省投资",false, new ExcelCoordinate(0, (short)11), null,20);
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "xdwh");//计划下达文号
		attribute.put("4", "xdsj");//计划下达时间
		attribute.put("5", "pfztz");//批复总投资
		attribute.put("6", "bbzzj");//部补助资金
		attribute.put("7", "sbzzj");//省补助资金
		jhsh.setXzqhdm(xzqhBm(jhsh.getXzqhdm(),"xzqhdm"));
		List<Object> excelData=new ArrayList<Object>();
		String titleName="";
		String fileName="";
		if(jhsh.getXmlx()==1){
			excelData.addAll(jhshServer.queryJhshLmsj(jhsh, 0, 0));
			titleName="升级改造工程项目";
			fileName="升级改造工程项目-资金下达";
		}
		else if(jhsh.getXmlx()==2){
			excelData.addAll(jhshServer.queryJhshLmgz(jhsh, 0, 0));
			titleName="路面改造工程项目";
			fileName="路面改造工程项目-资金下达";
		}
		else if(jhsh.getXmlx()==3){
			excelData.addAll(jhshServer.queryJhshXj(jhsh, 0, 0));
			titleName="新建工程项目";
			fileName="新建工程项目-资金下达";
		}
		ExcelEntity excel=new ExcelEntity(titleName,title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, fileName, getresponse());
	}
	/**
	 * 导入计划审核信息
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public void importExcelJhxd() throws Exception{
		ExcelEntity excel=new ExcelEntity();
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xmmc");//项目名称
		attribute.put("1", "xmbm");//项目编码
		attribute.put("2", "xzqh");//行政区划
		attribute.put("3", "qdzh");//起点桩号
		attribute.put("4", "zdzh");//止点桩号
		attribute.put("5", "kgsj");//开工时间
		attribute.put("6", "wgsj");//完工时间
		attribute.put("7", "gq");//工期
		attribute.put("8", "gkpfwh");//工可批复文号
		attribute.put("9", "sjpfwh");//设计批复文号
		attribute.put("10", "xdwh");//计划下达文号
		attribute.put("11", "xdsj");//计划下达时间
		attribute.put("12", "pfztz");//批复总投资
		attribute.put("13", "bbzzj");//部补助资金
		attribute.put("14", "sbzzj");//省补助资金
		excel.setAttributes(attribute);
		try {
			boolean b=false;
			List<Jhsh> readerExcel = ExcelImportUtil.readerExcel(fileupload, Jhsh.class, 1, excel);
			for (Jhsh item : readerExcel) {
				item.setXdzt(1);
			}
			if(jhsh.getXmlx()==1){
				b=jhshServer.updateJhshxxLmsj(readerExcel);
			}else if(jhsh.getXmlx()==2){
				b=jhshServer.updateJhshxxLmgz(readerExcel);
			}else if(jhsh.getXmlx()==3){
				b=jhshServer.updateJhshxxXj(readerExcel);
			}
			if(b){
				getresponse().getWriter().print(fileuploadFileName+"导入成功！");
			}else{
				getresponse().getWriter().print(fileuploadFileName+"导入失败！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 修改路线信息
	 * @param lx 路线信息
	 * @return 执行结果
	 */
	public void updateLx(){
		try{
			result.put("result", new Boolean(jhshServer.updateLx(lx)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 添加路线
	 * @throws Exception
	 */
	public void insertLx() throws Exception{
		try {
			lx.setSffirst("0");
			Lx queryHaveLx = jhshServer.queryHaveLx(lx);
			if(queryHaveLx==null){
				boolean b = jhshServer.insertLx(lx);
				result.put("result", new Boolean(b).toString());
			}else{
				result.put("result", "have");
				result.put("lx", queryHaveLx);
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 删除路线
	 * @throws Exception
	 */
	public void deleteLx() throws Exception{
		try {
			lx.setSffirst("0");
			boolean b = jhshServer.deleteLx(lx);
			result.put("result", new Boolean(b).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 根据项目编码等查询路线列表
	 * @throws Exception
	 */
	public void selectlxList() throws Exception{
		try {
			System.out.println("是否"+lx.getSffirst());
			JsonUtils.write(jhshServer.selectlxList(lx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 查询历史数据信息
	 */
	public void queryLsxx(){
		try{
			JsonUtils.write(jhshServer.queryLsxx(jhsh), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**
	 * 查询历史数据信息
	 */
	public void queryLsxx2(){
		try{
			JsonUtils.write(jhshServer.queryLsxx2(lx), getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void queryKxxyjByXmbm() throws Exception{
		try {
			Kxxyj kxxyj=new Kxxyj();
			if(jhsh.getXmlx()==1){
				kxxyj = jhshServer.queryLmsjKxxyjByXmbm(jhsh);
			}else if(jhsh.getXmlx()==2){
				kxxyj = jhshServer.queryLmgzKxxyjByXmbm(jhsh);
			}else if(jhsh.getXmlx()==3){
				kxxyj = jhshServer.queryXjKxxyjByXmbm(jhsh);
			}
			JsonUtils.write(kxxyj, getresponse().getWriter());
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
	//get set 方法
	public Jhsh getJhsh() {
		return jhsh;
	}
	public void setJhsh(Jhsh jhsh) {
		this.jhsh = jhsh;
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
	public File getUploadJhxd() {
		return uploadJhxd;
	}
	public void setUploadJhxd(File uploadJhxd) {
		this.uploadJhxd = uploadJhxd;
	}
	public String getUploadJhxdFileName() {
		return uploadJhxdFileName;
	}
	public void setUploadJhxdFileName(String uploadJhxdFileName) {
		this.uploadJhxdFileName = uploadJhxdFileName;
	}
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	public Lx getLx() {
		return lx;
	}
	public void setLx(Lx lx) {
		this.lx = lx;
	}
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
}
