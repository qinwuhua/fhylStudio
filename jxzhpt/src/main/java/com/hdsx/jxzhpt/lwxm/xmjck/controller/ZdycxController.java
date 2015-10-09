package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzgj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglgcgzsj;
import com.hdsx.jxzhpt.gcgl.bean.Gcglhsly;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Zdycx;
import com.hdsx.jxzhpt.lwxm.xmjck.server.ZdycxServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 数据查询——自定义查询Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class ZdycxController extends BaseActionSupport implements ModelDriven<Zdycx>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6215287293930608947L;
	@Resource(name="zdycxServerImpl")
	private ZdycxServer zdycxServer;
	private Zdycx zdycx=new Zdycx();
	private String xmlx;
	
	
	public void selwqgzsjZdy(){
		try {
		zdycx.setXzqhdm(zdycx.getXzqhdm().replaceAll("0*$",""));
		List<Gcglwqgz> list = zdycxServer.selwqgzsjZdy(zdycx);
		int count = zdycxServer.selwqgzsjZdyCount(zdycx);
		
		EasyUIPage<Gcglwqgz> eui=new EasyUIPage<Gcglwqgz>();
		eui.setRows(list);
		eui.setTotal(count);
		
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void gldjHandle() {
		String ylxbh = zdycx.getGldj()==null ? "" : zdycx.getGldj();
		if(ylxbh!=null && !ylxbh.equals("")){
			if(ylxbh.indexOf(",")>-1){
				String[] split = ylxbh.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						ylxbh = "(lxbm like '%"+split[i]+"%'";
					}else if(i==split.length-1){
						ylxbh += " or lxbm like '%"+split[i]+"%')";
					}else{
						ylxbh += " or lxbm like '%"+split[i]+"%'";
					}
				}
			}else{
				ylxbh = " lxbm like '%"+ylxbh+"%'";
			}
			zdycx.setGldj(ylxbh);
		}
	}
	private void jsdjHandle() {
		if(zdycx.getJsdj()!=null && !zdycx.getJsdj().equals("")){
			String xjsdj = zdycx.getJsdj();
			if(xjsdj.indexOf(",")>-1){
				String[] split = xjsdj.split(",");
				for (int i = 0; i < split.length; i++) {
					if(i==0){
						xjsdj = "(lxjsdj like '"+split[i]+"%'";
					}else if(i==split.length-1){
						xjsdj += " or lxjsdj like '"+split[i]+"%')";
					}else{
						xjsdj += " or lxjsdj like '"+split[i]+"%'";
					}
					if(split.length==1){
						xjsdj +=")";
					}
				}
			}else{
				xjsdj = "lxjsdj like '"+xjsdj+"%'";
			}
			zdycx.setJsdj(xjsdj);
		}
	}
	public void selZdy() throws IOException, Exception{
		xmlx=zdycx.getXmlx();
		gldjHandle();
		jsdjHandle();
		if("wqgz".equals(xmlx)){
			zdycx.getJsdj().replaceAll("lxjsdj", "jsdj");
			List<Gcglwqgz> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglwqgz> eui=new EasyUIPage<Gcglwqgz>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("abgc".equals(xmlx)){
			List<Gcglabgc> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglabgc> eui=new EasyUIPage<Gcglabgc>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("zhfz".equals(xmlx)){
			List<Gcglzhfz> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglzhfz> eui=new EasyUIPage<Gcglzhfz>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("lmsj".equals(xmlx)){
			List<Gcglgcgzsj> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglgcgzsj> eui=new EasyUIPage<Gcglgcgzsj>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("lmgj".equals(xmlx)){
			List<Gcglgcgzgj> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglgcgzgj> eui=new EasyUIPage<Gcglgcgzgj>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("yhdzx".equals(xmlx)){
			List<Gcglyhdzx> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglyhdzx> eui=new EasyUIPage<Gcglyhdzx>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else if("shxm".equals(xmlx)){
			List<Gcglsh> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglsh> eui=new EasyUIPage<Gcglsh>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}else{
			List<Gcglhsly> list = zdycxServer.selZdyList(zdycx);
			EasyUIPage<Gcglhsly> eui=new EasyUIPage<Gcglhsly>();
			int count = zdycxServer.selZdyCount(zdycx);
			eui.setRows(list);
			eui.setTotal(count);
			JsonUtils.write(eui, getresponse().getWriter());
		}	
	}
	public void exportExcel_zdy(){
		try {
			gldjHandle();
			jsdjHandle();
			//先得到导出的数据集
			List <SjbbMessage> list=zdycxServer.exportExcel_zdy(zdycx);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr>";
			String[] col=null;
			col=zdycx.getTableName().split(",");
			for(int i=0;i<col.length;i++){
				excelHtml+="<td>"+col[i]+"</td>";
			}
			excelHtml+="</tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName(zdycx.getXmName()+"项目自定义导出数据");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName(zdycx.getXmName()+"项目自定义表格");
			sheetb.setList(list);
			sheetb.setColnum((short)col.length);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName=zdycx.getXmName()+"项目自定义导出数据";//excel 文件的名字
			//导出excel
			ExportExcel_new ee = new ExportExcel_new();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}
	public void exportExcel_wqsjzdy(){
		try {
			//先得到导出的数据集
			zdycx.setXzqhdm(zdycx.getXzqhdm().replaceAll("0*$",""));
			List <SjbbMessage> list=zdycxServer.exportExcel_wqsjzdy(zdycx);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr>";
			String[] col=null;
			col=zdycx.getTableName().split(",");
			for(int i=0;i<col.length;i++){
				excelHtml+="<td>"+col[i]+"</td>";
			}
			excelHtml+="</tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥改造项目自定义导出数据");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥改造项目自定义表格");
			sheetb.setList(list);
			sheetb.setColnum((short)col.length);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName=zdycx.getXmName()+"项目自定义导出数据";//excel 文件的名字
			//导出excel
			ExportExcel_new ee = new ExportExcel_new();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
		}
	}

	
	@Override
	public Zdycx getModel() {
		return zdycx;
	}
}
