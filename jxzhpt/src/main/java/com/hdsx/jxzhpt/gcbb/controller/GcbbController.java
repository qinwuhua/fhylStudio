package com.hdsx.jxzhpt.gcbb.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcbb.bean.Gcbb5;
import com.hdsx.jxzhpt.gcbb.bean.GcgjJd;
import com.hdsx.jxzhpt.gcbb.bean.GcsjJd;
import com.hdsx.jxzhpt.gcbb.server.GcbbServer;
import com.hdsx.jxzhpt.gcxmybb.bean.Xmbb;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
public class GcbbController extends BaseActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8781627913390367320L;
	@Resource(name="gcbbServerImpl")
	private GcbbServer gcbbServer;
	private Jckwqgz jckwqgz=new Jckwqgz();
	private Xmbb xmbb;
	private String nameValue;
	private String colValue;
	public String getcxtj(String id,String param){
		String tj="";
		if(param!=null&&!"".equals(param)){
			String[] s=param.split(",");
			for (int i = 0; i < s.length; i++) {
				if(i==0)
				tj+=" ("+id+" like '%"+s[i]+"%'";
				else
				tj+=" or "+id+" like '%"+s[i]+"%'";
			}
			tj+=")";
		}
		return tj;
	}
	public String getNameValue() {
		return nameValue;
	}

	public void setNameValue(String nameValue) {
		this.nameValue = nameValue;
	}

	public String getColValue() {
		return colValue;
	}

	public void setColValue(String colValue) {
		this.colValue = colValue;
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
		return bh.indexOf(",")==-1 ? name+" like '%"+bh+"%'": name+" in ("+bh+")";
	}
	
	public void selGcgjJdbb() {
		try{
			String tiaojian1="";
			String tiaojian2="";
			String gydwdm = "";
			String xzqhdm = "";
			String sql = "";
			String nameValue="";
			String colValue="";
			if("flag".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
				sql=(String) session.getAttribute("sql");
				nameValue=(String) session.getAttribute("nameValue");
				colValue=(String) session.getAttribute("colValue");
			}else{
			gydwdm = xmbb.getGydw();
			xzqhdm	= xmbb.getXzqh();
			sql = xmbb.getSql();
			nameValue=xmbb.getNameValue();
			colValue=xmbb.getColValue();
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and l.gydwdm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and l.gydwdm in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and l.xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and l.xzqhdm in ("+xzqhdm+")";
			}
			xmbb.setGydw(tiaojian1);
			xmbb.setXzqh(tiaojian2);
			xmbb.setSql(sql.substring(0, sql.length()-1));
			xmbb.setNameValue(nameValue);
			xmbb.setColValue(colValue);
			xmbb.setTiaojian(getcxtj("substr(lx.lxbm,0,1)",xmbb.getTiaojian()));
			xmbb.setSbnf(getcxtj("substr(gj.xmbm,0,4)",xmbb.getSbnf()));
			
			List<Excel_list> gcgj=gcbbServer.selGcgjJdbb(xmbb);
			
		
		//List<GcgjJd> selGcgjJdbb = gcbbServer.selGcgjJdbb(xmbb);
		if("flag".equals(flag)){
			/*		List<Excel_list> elist=new ArrayList<Excel_list>();
			for (GcgjJd gcgjJd : selGcgjJdbb) {
				Excel_list l=new Excel_list();
				l.setV_0(gcgjJd.getXmmc());
				l.setV_1(gcgjJd.getSfgyhbm());
				l.setV_2(gcgjJd.getJsdd());
				l.setV_3(gcgjJd.getLxbm());
				l.setV_4(gcgjJd.getQdzh()+"-"+gcgjJd.getZdzh());
				l.setV_5(gcgjJd.getYhlc());
				if("大修".equals(gcgjJd.getYhlb()))
				l.setV_6(gcgjJd.getYhlb());
				else{
					l.setV_6("");
				}
				if("中修".equals(gcgjJd.getYhlb()))
				l.setV_7(gcgjJd.getYhlb());
				else{
					l.setV_7("");
				}
				if("防御性养护".equals(gcgjJd.getYhlb()))
				l.setV_8(gcgjJd.getYhlb());
				else{
					l.setV_8("");
				}
				SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
				String kgrq="";
				String wgrq="";
				if(gcgjJd.getSjkgsj()!=null)
					kgrq=sdf.format(gcgjJd.getSjkgsj());
				if(gcgjJd.getSjwgsj()!=null)
					wgrq=sdf.format(gcgjJd.getSjwgsj());
				
				l.setV_9(kgrq+" "+wgrq);
				l.setV_10(gcgjJd.getYlmlx());
				l.setV_11(gcgjJd.getSjlmlx());
				l.setV_12(gcgjJd.getDc());
				l.setV_13(gcgjJd.getBywcdc());
				l.setV_14(gcgjJd.getBnwcdc());
				l.setV_15(gcgjJd.getZjwcdc());
				if("0".equals(gcgjJd.getDc())||" ".equals(gcgjJd.getDc()))
				l.setV_16("0");
				else
					l.setV_16(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcdc())/Double.parseDouble(gcgjJd.getDc())*100)+"");
				l.setV_17(gcgjJd.getJc());
				l.setV_18(gcgjJd.getBywcjc());
				l.setV_19(gcgjJd.getBnwcjc());
				l.setV_20(gcgjJd.getZjwcjc());
				if("0".equals(gcgjJd.getJc())||" ".equals(gcgjJd.getJc()))
					l.setV_21("0");
					else
						l.setV_21(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcjc())/Double.parseDouble(gcgjJd.getJc())*100)+"");
				l.setV_22(gcgjJd.getMc());
				l.setV_23(gcgjJd.getBywcmc());
				l.setV_24(gcgjJd.getBnwcmc());
				l.setV_25(gcgjJd.getZjwcmc());
				if("0".equals(gcgjJd.getMc())||" ".equals(gcgjJd.getMc()))
					l.setV_26("0");
					else
						l.setV_26(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcmc())/Double.parseDouble(gcgjJd.getMc())*100)+"");
				l.setV_27(gcgjJd.getPfztz());
				l.setV_28(gcgjJd.getGys());
				l.setV_29(gcgjJd.getBywcje());
				l.setV_30(gcgjJd.getBnwcje());
				l.setV_31(gcgjJd.getZjwcje());
				if("0".equals(gcgjJd.getPfztz())||" ".equals(gcgjJd.getPfztz())){
					l.setV_32("0");
				}else{
					l.setV_32(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcje())/Double.parseDouble(gcgjJd.getPfztz())*100)+"");
				}
				if("0".equals(gcgjJd.getKgzt())){
					l.setV_33("未开工");
				}else if("1".equals(gcgjJd.getJgzt())){
					l.setV_33("完工");
				}else{
					l.setV_33("在建");
				}
				l.setV_34(gcgjJd.getBz());
				
				elist.add(l);
			}
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("路面改造进度报表");//设置第一行
			eldata.setSheetName("路面改造进度报表");//设置sheeet名
			eldata.setFileName("路面改造进度报表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("项目名称",1,4,0,0));
			et.add(new Excel_tilte("是否归口市局养护部门",1,4,1,1));
			et.add(new Excel_tilte("建设地点",1,4,2,2));
			et.add(new Excel_tilte("路线编码",1,4,3,3));
			et.add(new Excel_tilte("起讫点桩号",1,4,4,4));
			et.add(new Excel_tilte("里程长度（km）",1,4,5,5));
			et.add(new Excel_tilte("养护类别（KM）",1,1,6,8));
			et.add(new Excel_tilte("开工日--竣工日",1,4,9,9));
			et.add(new Excel_tilte("原路面类型",1,4,10,10));
			et.add(new Excel_tilte("设计路面类型",1,4,11,11));
			et.add(new Excel_tilte("主 要 工 程 数 量 完 成 情 况",1,1,12,26));
			et.add(new Excel_tilte("投 资 额 完 成 情 况 ",1,1,27,32));
			et.add(new Excel_tilte("形象进度（未开工\\在建\\完工）",1,4,33,33));
			et.add(new Excel_tilte("备注",1,4,34,34));
			et.add(new Excel_tilte("大修（KM）",2,4,6,6));
			et.add(new Excel_tilte("中修（KM）",2,4,7,7));
			et.add(new Excel_tilte("预防性养护",2,4,8,8));
			et.add(new Excel_tilte("垫层",2,2,12,16));
			et.add(new Excel_tilte("基层",2,2,17,21));
			et.add(new Excel_tilte("面层",2,2,22,26));
			et.add(new Excel_tilte("计划（万元）",2,4,27,27));
			et.add(new Excel_tilte("批准预算（万元）",2,4,28,28));
			et.add(new Excel_tilte("本月完成（万元）",2,4,29,29));
			et.add(new Excel_tilte("累计",2,2,30,32));
			et.add(new Excel_tilte("计划数量（M³）",3,4,12,12));
			et.add(new Excel_tilte("本月完成数量（M³）",3,4,13,13));
			et.add(new Excel_tilte("累计",3,3,14,16));
			et.add(new Excel_tilte("计划数量（M³）",3,4,17,17));
			et.add(new Excel_tilte("本月完成数量（M³）",3,4,18,18));
			et.add(new Excel_tilte("累计",3,3,19,21));
			et.add(new Excel_tilte("计划数量（M³）",3,4,22,22));
			et.add(new Excel_tilte("本月完成数量（M³）",3,4,23,23));
			et.add(new Excel_tilte("累计",3,3,24,26));
			et.add(new Excel_tilte("年初至本月完成（万元）",3,4,30,30));
			et.add(new Excel_tilte("自开工累计完成（万元）",3,4,31,31));
			et.add(new Excel_tilte("完成比例(%)",3,4,32,32));
			et.add(new Excel_tilte("年初至本月完成数量（M³）",4,4,14,14));
			et.add(new Excel_tilte("自开工累计完成数量（M³）",4,4,15,15));
			et.add(new Excel_tilte("完成比例(%)",4,4,16,16));
			et.add(new Excel_tilte("年初至本月完成数量（M³）",4,4,19,19));
			et.add(new Excel_tilte("自开工累计完成数量（M³）",4,4,20,20));
			et.add(new Excel_tilte("完成比例(%)",4,4,21,21));
			et.add(new Excel_tilte("年初至本月完成数量（M³）",4,4,24,24));
			et.add(new Excel_tilte("自开工累计完成数量（M³）",4,4,25,25));
			et.add(new Excel_tilte("完成比例(%)",4,4,26,26));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);*/
		}else{
			JsonUtils.write(gcgj, getresponse().getWriter());
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void selShuihJdbb() throws IOException, Exception{
		String tiaojian1="";
		String tiaojian2="";
		String gydwdm = "";
		String xzqhdm = "";
		String sql = "";
		String nameValue="";
		String colValue="";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
			sql=(String) session.getAttribute("sql");
			nameValue=(String) session.getAttribute("nameValue");
			colValue=(String) session.getAttribute("colValue");
		}else{
		gydwdm = xmbb.getGydw();
		xzqhdm	= xmbb.getXzqh();
		sql = xmbb.getSql();
		nameValue=xmbb.getNameValue();
		colValue=xmbb.getColValue();
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and l.gydwdm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
		}else{
			tiaojian1="and l.gydwdm in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and l.xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and l.xzqhdm in ("+xzqhdm+")";
		}
		xmbb.setGydw(tiaojian1);
		xmbb.setXzqh(tiaojian2);
		xmbb.setSql(sql.substring(0, sql.length()-1));
		xmbb.setNameValue(nameValue);
		xmbb.setColValue(colValue);
		xmbb.setTiaojian(getcxtj("substr(lx.lxbm,0,1)",xmbb.getTiaojian()));
		xmbb.setSbnf(getcxtj("substr(sh.xmbm,0,4)",xmbb.getSbnf()));
		
		
		List<Excel_list> selShuihJdbb=gcbbServer.selShuihJdbb(xmbb);
		
		if("flag".equals(flag)){
			/*List<Excel_list> elist=new ArrayList<Excel_list>();
			for (GcgjJd gcgjJd : selShuihJdbb) {
				Excel_list l=new Excel_list();
				l.setV_0(gcgjJd.getXmmc());
				l.setV_1(gcgjJd.getSfgyhbm());
				l.setV_2(gcgjJd.getJsdd());
				l.setV_3(gcgjJd.getLxbm());
				l.setV_4(gcgjJd.getQdzh()+"-"+gcgjJd.getZdzh());
				l.setV_5(gcgjJd.getYhlc());
				if("大修".equals(gcgjJd.getYhlb()))
				l.setV_6(gcgjJd.getYhlb());
				else{
					l.setV_6("");
				}
				if("中修".equals(gcgjJd.getYhlb()))
				l.setV_7(gcgjJd.getYhlb());
				else{
					l.setV_7("");
				}
				if("防御性养护".equals(gcgjJd.getYhlb()))
				l.setV_8(gcgjJd.getYhlb());
				else{
					l.setV_8("");
				}
				SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
				String kgrq="";
				String wgrq="";
				if(gcgjJd.getSjkgsj()!=null)
					kgrq=sdf.format(gcgjJd.getSjkgsj());
				if(gcgjJd.getSjwgsj()!=null)
					wgrq=sdf.format(gcgjJd.getSjwgsj());
				
				l.setV_9(kgrq+" "+wgrq);
				l.setV_10(gcgjJd.getYlmlx());
				l.setV_11(gcgjJd.getSjlmlx());
				l.setV_12(gcgjJd.getDc());
				l.setV_13(gcgjJd.getBywcdc());
				l.setV_14(gcgjJd.getBnwcdc());
				l.setV_15(gcgjJd.getZjwcdc());
				if("0".equals(gcgjJd.getDc())||" ".equals(gcgjJd.getDc()))
				l.setV_16("0");
				else
					l.setV_16(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcdc())/Double.parseDouble(gcgjJd.getDc())*100)+"");
				l.setV_17(gcgjJd.getJc());
				l.setV_18(gcgjJd.getBywcjc());
				l.setV_19(gcgjJd.getBnwcjc());
				l.setV_20(gcgjJd.getZjwcjc());
				if("0".equals(gcgjJd.getJc())||" ".equals(gcgjJd.getJc()))
					l.setV_21("0");
					else
						l.setV_21(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcjc())/Double.parseDouble(gcgjJd.getJc())*100)+"");
				l.setV_22(gcgjJd.getMc());
				l.setV_23(gcgjJd.getBywcmc());
				l.setV_24(gcgjJd.getBnwcmc());
				l.setV_25(gcgjJd.getZjwcmc());
				if("0".equals(gcgjJd.getMc())||" ".equals(gcgjJd.getMc()))
					l.setV_26("0");
					else
						l.setV_26(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcmc())/Double.parseDouble(gcgjJd.getMc())*100)+"");
				l.setV_27(gcgjJd.getPfztz());
				l.setV_28(gcgjJd.getGys());
				l.setV_29(gcgjJd.getBywcje());
				l.setV_30(gcgjJd.getBnwcje());
				l.setV_31(gcgjJd.getZjwcje());
				if("0".equals(gcgjJd.getPfztz())||" ".equals(gcgjJd.getPfztz())){
					l.setV_32("0");
				}else{
					l.setV_32(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcje())/Double.parseDouble(gcgjJd.getPfztz())*100)+"");
				}
				if("0".equals(gcgjJd.getKgzt())){
					l.setV_33("未开工");
				}else if("1".equals(gcgjJd.getJgzt())){
					l.setV_33("完工");
				}else{
					l.setV_33("在建");
				}
				l.setV_34(gcgjJd.getBz());
				
				elist.add(l);
			}
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("灾毁重建进度报表");//设置第一行
			eldata.setSheetName("灾毁重建进度报表");//设置sheeet名
			eldata.setFileName("灾毁重建进度报表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("项目名称",1,4,0,0));
			et.add(new Excel_tilte("是否归口市局养护部门",1,4,1,1));
			et.add(new Excel_tilte("建设地点",1,4,2,2));
			et.add(new Excel_tilte("路线编码",1,4,3,3));
			et.add(new Excel_tilte("起讫点桩号",1,4,4,4));
			et.add(new Excel_tilte("里程长度（km）",1,4,5,5));
			et.add(new Excel_tilte("养护类别（KM）",1,1,6,8));
			et.add(new Excel_tilte("开工日--竣工日",1,4,9,9));
			et.add(new Excel_tilte("原路面类型",1,4,10,10));
			et.add(new Excel_tilte("设计路面类型",1,4,11,11));
			et.add(new Excel_tilte("主 要 工 程 数 量 完 成 情 况",1,1,12,26));
			et.add(new Excel_tilte("投 资 额 完 成 情 况 ",1,1,27,32));
			et.add(new Excel_tilte("形象进度（未开工\\在建\\完工）",1,4,33,33));
			et.add(new Excel_tilte("备注",1,4,34,34));
			et.add(new Excel_tilte("大修（KM）",2,4,6,6));
			et.add(new Excel_tilte("中修（KM）",2,4,7,7));
			et.add(new Excel_tilte("预防性养护",2,4,8,8));
			et.add(new Excel_tilte("垫层",2,2,12,16));
			et.add(new Excel_tilte("基层",2,2,17,21));
			et.add(new Excel_tilte("面层",2,2,22,26));
			et.add(new Excel_tilte("计划（万元）",2,4,27,27));
			et.add(new Excel_tilte("批准预算（万元）",2,4,28,28));
			et.add(new Excel_tilte("本月完成（万元）",2,4,29,29));
			et.add(new Excel_tilte("累计",2,2,30,32));
			et.add(new Excel_tilte("计划数量（M³）",3,4,12,12));
			et.add(new Excel_tilte("本月完成数量（M³）",3,4,13,13));
			et.add(new Excel_tilte("累计",3,3,14,16));
			et.add(new Excel_tilte("计划数量（M³）",3,4,17,17));
			et.add(new Excel_tilte("本月完成数量（M³）",3,4,18,18));
			et.add(new Excel_tilte("累计",3,3,19,21));
			et.add(new Excel_tilte("计划数量（M³）",3,4,22,22));
			et.add(new Excel_tilte("本月完成数量（M³）",3,4,23,23));
			et.add(new Excel_tilte("累计",3,3,24,26));
			et.add(new Excel_tilte("年初至本月完成（万元）",3,4,30,30));
			et.add(new Excel_tilte("自开工累计完成（万元）",3,4,31,31));
			et.add(new Excel_tilte("完成比例(%)",3,4,32,32));
			et.add(new Excel_tilte("年初至本月完成数量（M³）",4,4,14,14));
			et.add(new Excel_tilte("自开工累计完成数量（M³）",4,4,15,15));
			et.add(new Excel_tilte("完成比例(%)",4,4,16,16));
			et.add(new Excel_tilte("年初至本月完成数量（M³）",4,4,19,19));
			et.add(new Excel_tilte("自开工累计完成数量（M³）",4,4,20,20));
			et.add(new Excel_tilte("完成比例(%)",4,4,21,21));
			et.add(new Excel_tilte("年初至本月完成数量（M³）",4,4,24,24));
			et.add(new Excel_tilte("自开工累计完成数量（M³）",4,4,25,25));
			et.add(new Excel_tilte("完成比例(%)",4,4,26,26));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);*/
		}else{
			JsonUtils.write(selShuihJdbb, getresponse().getWriter());	
		}
	}
	public void selGcsjJdbb(){
		try {
			
			String tiaojian1="";
			String tiaojian2="";
			String gydwdm = "";
			String xzqhdm = "";
			String sql = "";
			String nameValue="";
			String colValue="";
			if("flag".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
				sql=(String) session.getAttribute("sql");
				nameValue=(String) session.getAttribute("nameValue");
				colValue=(String) session.getAttribute("colValue");
			}else{
			gydwdm = xmbb.getGydw();
			xzqhdm	= xmbb.getXzqh();
			sql = xmbb.getSql();
			nameValue=xmbb.getNameValue();
			colValue=xmbb.getColValue();
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and l.gydwdm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and l.gydwdm in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and l.xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and l.xzqhdm in ("+xzqhdm+")";
			}
			
			
			
			xmbb.setGydw(tiaojian1);
			xmbb.setXzqh(tiaojian2);
			xmbb.setSql(sql.substring(0, sql.length()-1));
			xmbb.setNameValue(nameValue);
			xmbb.setColValue(colValue);
			xmbb.setTiaojian(getcxtj("substr(lx.lxbm,0,1)",xmbb.getTiaojian()));
			xmbb.setSbnf(getcxtj("substr(sj.xmbm,0,4)",xmbb.getSbnf()));
			
			List<Excel_list> gcsj=gcbbServer.selGcsjJdbb(xmbb);
			
			//JsonUtils.write(gcsj, getresponse().getWriter());
			
			int i=1;
			if("flag".equals(flag)){
				
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("改建、新建工程项目进度报表");//设置第一行
				eldata.setSheetName("改建、新建工程项目进度报表");//设置sheeet名
				eldata.setFileName("改建、新建工程项目进度报表");//设置文件名
				eldata.setEl(gcsj);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				
				
				String[] s=xmbb.getNameValue().split(",");
				int k=0;int k1=0;int k2=0;int k3=0;int k4=0;
				if(xmbb.isJhgc()){
					for(int j=0;j<xmbb.getJhgczb();j++){
						et.add(new Excel_tilte(s[j],1,3,k,k));
						k++;
					}
				}
				if(!xmbb.isJhgc()&&xmbb.isBywcgcl()){
					for(int j=0;j<xmbb.getBywcgclzb();j++){
						et.add(new Excel_tilte(s[j],1,3,k,k));
						k++;
					}
				}
				if(!xmbb.isJhgc()&&!xmbb.isBywcgcl()&&xmbb.isKglj()){
					for(int j=0;j<xmbb.getKgljzb();j++){
						et.add(new Excel_tilte(s[j],1,3,k,k));
						k++;
					}
				}
				if(!xmbb.isJhgc()&&!xmbb.isBywcgcl()&&!xmbb.isKglj()&&xmbb.isYykglj()){
					for(int j=0;j<xmbb.getYykgljzb();j++){
						et.add(new Excel_tilte(s[j],1,3,k,k));
						k++;
					}
				}
				if(!xmbb.isJhgc()&&!xmbb.isBywcgcl()&&!xmbb.isKglj()&&!xmbb.isYykglj()){
					for(int j=0;j<s.length;j++){
						et.add(new Excel_tilte(s[j],1,3,k,k));
						k++;
					}
				}
				if(xmbb.isJhgc()){
					et.add(new Excel_tilte("计划工程",1,1,k,k+10));
					k1=k;
					k=k+11;
				}
				if(xmbb.isBywcgcl()){
					et.add(new Excel_tilte("本月完成工程量",1,1,k,k+11));
					k2=k;
					k=k+12;
				}
				if(xmbb.isKglj()){
					et.add(new Excel_tilte("自开工累计完成工程量",1,1,k,k+11));
					k3=k;
					k=k+12;
				}
				if(xmbb.isYykglj()){
					et.add(new Excel_tilte("自开工累计完成工程量",1,1,k,k+3));
					k4=k;
					k=k+4;
				}
				if(xmbb.isBz()&&(xmbb.isJhgc()||xmbb.isBywcgcl()||xmbb.isKglj()||xmbb.isYykglj())){
					et.add(new Excel_tilte("备注",1,3,k,k));
				}
				if(xmbb.isJhgc()){
					et.add(new Excel_tilte("投资额（万元）",2,3,k1,k1));
					et.add(new Excel_tilte("路基土石方（m³）",2,3,k1+1,k1+1));
					et.add(new Excel_tilte("桥梁",2,2,k1+2,k1+3));
					et.add(new Excel_tilte("涵洞（米）",2,3,k1+4,k1+4));
					et.add(new Excel_tilte("隧道",2,2,k1+5,k1+6));
					et.add(new Excel_tilte("路面工程（公里）",2,2,k1+7,k1+10));
				}
				if(xmbb.isBywcgcl()){
					et.add(new Excel_tilte("投资额（万元）",2,3,k2,k2));
					et.add(new Excel_tilte("占投资比例（%）",2,3,k2+1,k2+1));
					et.add(new Excel_tilte("路基土石方（m³）",2,3,k2+2,k2+2));
					et.add(new Excel_tilte("桥梁",2,2,k2+3,k2+4));
					et.add(new Excel_tilte("涵洞（米）",2,3,k2+5,k2+5));
					et.add(new Excel_tilte("隧道",2,2,k2+6,k2+7));
					et.add(new Excel_tilte("路面工程（公里）",2,2,k2+8,k2+11));
				}
				if(xmbb.isKglj()){
					et.add(new Excel_tilte("投资额（万元）",2,3,k3,k3));
					et.add(new Excel_tilte("占投资比例（%）",2,3,k3+1,k3+1));
					et.add(new Excel_tilte("路基土石方（m³）",2,3,k3+2,k3+2));
					et.add(new Excel_tilte("桥梁",2,2,k3+3,k3+4));
					et.add(new Excel_tilte("涵洞（米）",2,3,k3+5,k3+5));
					et.add(new Excel_tilte("隧道",2,2,k3+6,k3+7));
					et.add(new Excel_tilte("路面工程（公里）",2,2,k3+8,k3+11));
				}
				if(xmbb.isYykglj()){
					et.add(new Excel_tilte("投资额（万元）",2,3,k4,k4));
					et.add(new Excel_tilte("占投资比例（%）",2,3,k4+1,k4+1));
					et.add(new Excel_tilte("路面工程（公里）",2,3,k4+2,k4+3));
				}
				if(xmbb.isJhgc()){
					et.add(new Excel_tilte("米",3,3,k1+2,k1+2));
					et.add(new Excel_tilte("座",3,3,k1+3,k1+3));
					et.add(new Excel_tilte("米",3,3,k1+5,k1+5));
					et.add(new Excel_tilte("座",3,3,k1+6,k1+6));
					et.add(new Excel_tilte("垫层",3,3,k1+7,k1+7));
					et.add(new Excel_tilte("基层",3,3,k1+8,k1+8));
					et.add(new Excel_tilte("沥青路面",3,3,k1+9,k1+9));
					et.add(new Excel_tilte("水泥路面",3,3,k1+10,k1+10));
				}
				if(xmbb.isBywcgcl()){
					et.add(new Excel_tilte("米",3,3,k2+3,k2+3));
					et.add(new Excel_tilte("座",3,3,k2+4,k2+4));
					et.add(new Excel_tilte("米",3,3,k2+6,k2+6));
					et.add(new Excel_tilte("座",3,3,k2+7,k2+7));
					et.add(new Excel_tilte("垫层",3,3,k2+8,k2+8));
					et.add(new Excel_tilte("基层",3,3,k2+9,k2+9));
					et.add(new Excel_tilte("沥青路面",3,3,k2+10,k2+10));
					et.add(new Excel_tilte("水泥路面",3,3,k2+11,k2+11));
				}
				if(xmbb.isKglj()){
					et.add(new Excel_tilte("米",3,3,k3+3,k3+3));
					et.add(new Excel_tilte("座",3,3,k3+4,k3+4));
					et.add(new Excel_tilte("米",3,3,k3+6,k3+6));
					et.add(new Excel_tilte("座",3,3,k3+7,k3+7));
					et.add(new Excel_tilte("垫层",3,3,k3+8,k3+8));
					et.add(new Excel_tilte("基层",3,3,k3+9,k3+9));
					et.add(new Excel_tilte("沥青路面",3,3,k3+10,k3+10));
					et.add(new Excel_tilte("水泥路面",3,3,k3+11,k3+11));
				}
				if(xmbb.isYykglj()){
					et.add(new Excel_tilte("沥青路面",3,3,k4+2,k4+2));
					et.add(new Excel_tilte("水泥路面",3,3,k4+3,k4+3));
				}
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			}else{
				JsonUtils.write(gcsj, getresponse().getWriter());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void selYhdzxJdbb() {
		try{
		String tiaojian1="";
		String tiaojian2="";
		String gydwdm = "";
		String xzqhdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = xmbb.getGydw();
		xzqhdm	= xmbb.getXzqh();
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydwdm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
		}else{
			tiaojian1="and gydwdm in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		xmbb.setGydw(tiaojian1);
		xmbb.setXzqh(tiaojian2);

		List<GcgjJd> yhdzx=gcbbServer.selYhdzxJdbb(xmbb);
		if("flag".equals(flag)){
			List<Excel_list> elist=new ArrayList<Excel_list>();
			for (GcgjJd gcgjJd : yhdzx) {
				Excel_list l=new Excel_list();
				l.setV_0(gcgjJd.getXmmc());
				l.setV_1(gcgjJd.getSfgyhbm());
				l.setV_2(gcgjJd.getJsdd());
				l.setV_3(gcgjJd.getLxbm());
				l.setV_4(gcgjJd.getQdzh()+"-"+gcgjJd.getZdzh());
				l.setV_5(gcgjJd.getYhlc());
				if("大修".equals(gcgjJd.getYhlb()))
				l.setV_6(gcgjJd.getYhlb());
				else{
					l.setV_6("");
				}
				if("中修".equals(gcgjJd.getYhlb()))
				l.setV_7(gcgjJd.getYhlb());
				else{
					l.setV_7("");
				}
				if("防御性养护".equals(gcgjJd.getYhlb()))
				l.setV_8(gcgjJd.getYhlb());
				else{
					l.setV_8("");
				}
				String kgrq="";
				String wgrq="";
				if(gcgjJd.getSjkgsj()!=null)
					kgrq=gcgjJd.getSjkgsj();
				if(gcgjJd.getSjwgsj()!=null)
					wgrq=gcgjJd.getSjwgsj();
				l.setV_9(kgrq+" "+wgrq);
				l.setV_10(gcgjJd.getYlmlx());
				l.setV_11(gcgjJd.getSjlmlx());
				l.setV_12(gcgjJd.getDc());
				l.setV_13(gcgjJd.getBywcdc());
				l.setV_14(gcgjJd.getBnwcdc());
				l.setV_15(gcgjJd.getZjwcdc());
				if("0".equals(gcgjJd.getDc())||" ".equals(gcgjJd.getDc()))
				l.setV_16("0");
				else
					l.setV_16(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcdc())/Double.parseDouble(gcgjJd.getDc())*100)+"");
				l.setV_17(gcgjJd.getJc());
				l.setV_18(gcgjJd.getBywcjc());
				l.setV_19(gcgjJd.getBnwcjc());
				l.setV_20(gcgjJd.getZjwcjc());
				if("0".equals(gcgjJd.getJc())||" ".equals(gcgjJd.getJc()))
					l.setV_21("0");
					else
						l.setV_21(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcjc())/Double.parseDouble(gcgjJd.getJc())*100)+"");
				l.setV_22(gcgjJd.getMc());
				l.setV_23(gcgjJd.getBywcmc());
				l.setV_24(gcgjJd.getBnwcmc());
				l.setV_25(gcgjJd.getZjwcmc());
				if("0".equals(gcgjJd.getMc())||" ".equals(gcgjJd.getMc()))
					l.setV_26("0");
					else
						l.setV_26(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcmc())/Double.parseDouble(gcgjJd.getMc())*100)+"");
				l.setV_27(gcgjJd.getPfztz());
				l.setV_28(gcgjJd.getGys());
				l.setV_29(gcgjJd.getBywcje());
				l.setV_30(gcgjJd.getBnwcje());
				l.setV_31(gcgjJd.getZjwcje());
				if("0".equals(gcgjJd.getPfztz())||" ".equals(gcgjJd.getPfztz())){
					l.setV_32("0");
				}else{
					l.setV_32(String.format("%.2f", Double.parseDouble(gcgjJd.getZjwcje())/Double.parseDouble(gcgjJd.getPfztz())*100)+"");
				}
				if("0".equals(gcgjJd.getKgzt())){
					l.setV_33("未开工");
				}else if("1".equals(gcgjJd.getJgzt())){
					l.setV_33("完工");
				}else{
					l.setV_33("在建");
				}
				l.setV_34(gcgjJd.getBz());
				
				elist.add(l);
			}
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("养护路面大中修工程进度报表");//设置第一行
			eldata.setSheetName("养护路面大中修工程进度报表");//设置sheeet名
			eldata.setFileName("养护路面大中修工程进度报表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("项目名称",1,4,0,0));
			et.add(new Excel_tilte("是否归口市局养护部门",1,4,1,1));
			et.add(new Excel_tilte("建设地点",1,4,2,2));
			et.add(new Excel_tilte("路线编码",1,4,3,3));
			et.add(new Excel_tilte("起讫点桩号",1,4,4,4));
			et.add(new Excel_tilte("里程长度（km）",1,4,5,5));
			et.add(new Excel_tilte("养护类别（KM）",1,1,6,8));
			et.add(new Excel_tilte("开工日--竣工日",1,4,9,9));
			et.add(new Excel_tilte("原路面类型",1,4,10,10));
			et.add(new Excel_tilte("设计路面类型",1,4,11,11));
			et.add(new Excel_tilte("主 要 工 程 数 量 完 成 情 况",1,1,12,26));
			et.add(new Excel_tilte("投 资 额 完 成 情 况 ",1,1,27,32));
			et.add(new Excel_tilte("形象进度（未开工\\在建\\完工）",1,4,33,33));
			et.add(new Excel_tilte("备注",1,4,34,34));
			et.add(new Excel_tilte("大修（KM）",2,4,6,6));
			et.add(new Excel_tilte("中修（KM）",2,4,7,7));
			et.add(new Excel_tilte("预防性养护",2,4,8,8));
			et.add(new Excel_tilte("垫层",2,2,12,16));
			et.add(new Excel_tilte("基层",2,2,17,21));
			et.add(new Excel_tilte("面层",2,2,22,26));
			et.add(new Excel_tilte("计划（万元）",2,4,27,27));
			et.add(new Excel_tilte("批准预算（万元）",2,4,28,28));
			et.add(new Excel_tilte("本月完成（万元）",2,4,29,29));
			et.add(new Excel_tilte("累计",2,2,30,32));
			et.add(new Excel_tilte("计划数量（M³）",3,4,12,12));
			et.add(new Excel_tilte("本月完成数量（M³）",3,4,13,13));
			et.add(new Excel_tilte("累计",3,3,14,16));
			et.add(new Excel_tilte("计划数量（M³）",3,4,17,17));
			et.add(new Excel_tilte("本月完成数量（M³）",3,4,18,18));
			et.add(new Excel_tilte("累计",3,3,19,21));
			et.add(new Excel_tilte("计划数量（M³）",3,4,22,22));
			et.add(new Excel_tilte("本月完成数量（M³）",3,4,23,23));
			et.add(new Excel_tilte("累计",3,3,24,26));
			et.add(new Excel_tilte("年初至本月完成（万元）",3,4,30,30));
			et.add(new Excel_tilte("自开工累计完成（万元）",3,4,31,31));
			et.add(new Excel_tilte("完成比例(%)",3,4,32,32));
			et.add(new Excel_tilte("年初至本月完成数量（M³）",4,4,14,14));
			et.add(new Excel_tilte("自开工累计完成数量（M³）",4,4,15,15));
			et.add(new Excel_tilte("完成比例(%)",4,4,16,16));
			et.add(new Excel_tilte("年初至本月完成数量（M³）",4,4,19,19));
			et.add(new Excel_tilte("自开工累计完成数量（M³）",4,4,20,20));
			et.add(new Excel_tilte("完成比例(%)",4,4,21,21));
			et.add(new Excel_tilte("年初至本月完成数量（M³）",4,4,24,24));
			et.add(new Excel_tilte("自开工累计完成数量（M³）",4,4,25,25));
			et.add(new Excel_tilte("完成比例(%)",4,4,26,26));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);
		}else{
			JsonUtils.write(yhdzx, getresponse().getWriter());
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void selGcbb5() throws IOException, Exception{
		try{
			String tiaojian1="";
			String tiaojian2="";
			String gydwdm = "";
			String xzqhdm = "";
			if("flag".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
			}else{
			gydwdm = xmbb.getGydw();
			xzqhdm	= xmbb.getXzqh();
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwdm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and gydwdm in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqhdm+")";
			}
			xmbb.setGydw(tiaojian1);
			xmbb.setXzqh(tiaojian2);

			List<Gcbb5> s=null;
			
			try {
				s = gcbbServer.selGcbb5(xmbb);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if("flag".equals(flag)){
				List<Excel_list> elist=new ArrayList<Excel_list>();
				for (Gcbb5 gb : s) {
					Excel_list l=new Excel_list();
					l.setV_0(gb.getJsdd());
					l.setV_1(gb.getLxbm()+"["+gb.getQdzh()+"-"+gb.getZdzh()+"]、"+gb.getXmmc());
					l.setV_2(gb.getYjsdj());
					l.setV_3(gb.getJsjsbz());
					l.setV_4(gb.getYhlc());
					l.setV_5(gb.getPfztz());
					l.setV_6(gb.getCgs());
					l.setV_7(gb.getDfpt());
					int wkg=0;int zj=0;int wg=0;
					if("0".equals(gb.getKgzt()))
						wkg=1;
					else if("1".equals(gb.getJgzt()))
						wg=1;
					else
						zj=1;
					l.setV_8(zj+"");
					l.setV_9(wg+"");
					l.setV_10(wkg+"");
					l.setV_11(gb.getKgsj());
					l.setV_12(gb.getJgsj());
					l.setV_13(gb.getBndsslc());
					l.setV_14(gb.getBndjhtz());
					l.setV_15(gb.getBnzycgs());
					l.setV_16(gb.getBnwctz());
					l.setV_17(gb.getBnzycgs1());
					l.setV_18(gb.getBndfpt());
					l.setV_19(gb.getBnyhdk());
					l.setV_20(gb.getJsjsbz());
					l.setV_21(gb.getBnqtzj());
					l.setV_22(gb.getBnwctz());
					if("".equals(gb.getBnwctz())||gb.getBnwctz()==null){
						gb.setBnwctz("0");
					}
					if("0".equals(gb.getPfztz()))
						l.setV_23("0");
						else
							l.setV_23(String.format("%.2f", Double.parseDouble(gb.getBnwctz())/Double.parseDouble(gb.getPfztz())*100)+"");
					l.setV_24(gb.getBnwcgzl());
					l.setV_25(gb.getBngzl1());
					l.setV_26(gb.getBngzl2());
					l.setV_27(gb.getBngzl3());
					l.setV_28(gb.getBngzl4());
					l.setV_29(gb.getBnlql());
					l.setV_30(gb.getBnsnl());
					l.setV_31(gb.getSsdctc());
					l.setV_32(gb.getZjwctz());
					l.setV_33(gb.getZjwcgzl());
					l.setV_34(gb.getZjgzl1());
					l.setV_35(gb.getZjgzl2());
					l.setV_36(gb.getZjgzl3());
					l.setV_37(gb.getZjgzl4());
					l.setV_38(gb.getZjlql());
					l.setV_39(gb.getZjsnl());
					l.setV_40(gb.getSsdctc());
					if("".equals(gb.getZjwcgzl())||gb.getZjwcgzl()==null){
						gb.setZjwcgzl("0");
					}
					try {
						l.setV_41(Double.parseDouble(gb.getYhlc())-Double.parseDouble(gb.getZjwcgzl())+"");
					} catch (Exception e) {
						l.setV_41("0");
					}
					elist.add(l);
				}	
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("公路改造工程新上、续建工程项目完成情况明细表");//设置第一行
				eldata.setSheetName("公路改造工程新上、续建工程项目完成情况明细表");//设置sheeet名
				eldata.setFileName("公路改造工程新上、续建工程项目完成情况明细表");//设置文件名
				eldata.setEl(elist);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("一、 项 目 计 划",1,1,0,12));
				et.add(new Excel_tilte("二、 本年元月至本月完成情况",1,1,13,31));
				et.add(new Excel_tilte("四、 自开工至本月底累计完成情况",1,1,32,41));
				et.add(new Excel_tilte("项目所在县市",2,4,0,0));
				et.add(new Excel_tilte("路线编码、项目名称及路线桩号",2,4,1,1));
				et.add(new Excel_tilte("原技术等级",2,4,2,2));
				et.add(new Excel_tilte("建设技术标准",2,4,3,3));
				et.add(new Excel_tilte("项目里程（公里）",2,4,4,4));
				et.add(new Excel_tilte("总投资（万元）",2,4,5,5));
				et.add(new Excel_tilte("中央车购税（万元）",2,4,6,6));
				et.add(new Excel_tilte("地方配套（万元）",2,4,7,7));
				et.add(new Excel_tilte("项目在建个数（个）",2,4,8,8));
				et.add(new Excel_tilte("项目完工个数（个）",2,4,9,9));
				et.add(new Excel_tilte("项目未开工个数（个）",2,4,10,10));
				et.add(new Excel_tilte("开工时间",2,4,11,11));
				et.add(new Excel_tilte("竣工时间",2,4,12,12));
				et.add(new Excel_tilte("本年实施里程(公里)",2,4,13,13));
				et.add(new Excel_tilte("本年计划投资",2,2,14,15));
				et.add(new Excel_tilte("累计资金到位（万 元）",2,2,16,21));
				et.add(new Excel_tilte("项目完成投资(万元)",2,4,22,22));
				et.add(new Excel_tilte("占投资比例（%）",2,4,23,23));
				et.add(new Excel_tilte("完 成 工 程 量（公里)",2,2,24,31));
				et.add(new Excel_tilte("项目完成投资（万元）",2,4,32,32));
				et.add(new Excel_tilte("累 计 完 成 工 程 量 （ 公 里 )",2,2,33,40));
				et.add(new Excel_tilte("项目未完工程量（公里）",2,4,41,41));
				et.add(new Excel_tilte("合计",3,4,14,14));
				et.add(new Excel_tilte("其中：中央车购税",3,4,15,15));
				et.add(new Excel_tilte("合计",3,4,16,16));
				et.add(new Excel_tilte("中央车购税",3,4,17,17));
				et.add(new Excel_tilte("地方配套",3,4,18,19));
				et.add(new Excel_tilte("省厅贴息(厅贷款)",3,4,20,20));
				et.add(new Excel_tilte("其他资金",3,4,21,21));
				et.add(new Excel_tilte("按技术等级",3,3,24,28));
				et.add(new Excel_tilte("按路面类型",3,3,29,30));
				et.add(new Excel_tilte("砂石垫层通车",3,4,31,31));
				et.add(new Excel_tilte("按技术等级",3,3,33,37));
				et.add(new Excel_tilte("按路面类型",3,3,38,39));
				et.add(new Excel_tilte("砂石垫层通车",3,4,40,40));
				et.add(new Excel_tilte("小计",4,4,18,18));
				et.add(new Excel_tilte("其中：银行贷款",4,4,19,19));
				et.add(new Excel_tilte("小计",4,4,24,24));
				et.add(new Excel_tilte("一级",4,4,25,25));
				et.add(new Excel_tilte("二级",4,4,26,26));
				et.add(new Excel_tilte("三级",4,4,27,27));
				et.add(new Excel_tilte("四级",4,4,28,28));
				et.add(new Excel_tilte("沥青路",4,4,29,29));
				et.add(new Excel_tilte("水泥砼",4,4,30,30));
				et.add(new Excel_tilte("小计",4,4,33,33));
				et.add(new Excel_tilte("一级",4,4,34,34));
				et.add(new Excel_tilte("二级",4,4,35,35));
				et.add(new Excel_tilte("三级",4,4,36,36));
				et.add(new Excel_tilte("四级",4,4,37,37));
				et.add(new Excel_tilte("沥青路",4,4,38,38));
				et.add(new Excel_tilte("水泥砼",4,4,39,39));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			}else{
				JsonUtils.write(s, getresponse().getWriter());
			}
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
	}
	/***
	 * 获取年份列表
	 */
	public void getYearList(){
		List<String> list= new ArrayList<String>();
		Calendar calendar =Calendar.getInstance();
		int temp=calendar.get(Calendar.YEAR);
		for(int i=temp;i>temp-10;i--){
			list.add(i+"");
		}
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}catch (Exception e) {}
	}
	
	public void selYearList(){
		String l=null;
		Calendar calendar =Calendar.getInstance();
		int nf=calendar.get(Calendar.YEAR);
		l="[{'id':'"+nf+"','text':'"+nf+"','iconCls':'icon-none'}";
		for(int i=1;i<10;i++){
			l+=",{'id':'"+(nf-i)+"','text':'"+(nf-i)+"','iconCls':'icon-none'}";
		}
		l+="]";
		try {
			JsonUtils.write(l, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Xmbb getXmbb() {
		return xmbb;
	}
	public void setXmbb(Xmbb xmbb) {
		this.xmbb = xmbb;
	}
	private String gydw;
	private String xzqh;

	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	private String flag;
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	private String sql;
	
	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public void exportbbsj_set() throws Exception{
//		System.out.println("*"+gydw);
//		System.out.println("*"+xzqh);
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("gydwbb", gydw);
		session.setAttribute("xzqhbb", xzqh);
		session.setAttribute("sql", sql);
		session.setAttribute("nameValue", nameValue);
		session.setAttribute("colValue", colValue);
		
		JsonUtils.write(session, getresponse().getWriter());
	}
}
