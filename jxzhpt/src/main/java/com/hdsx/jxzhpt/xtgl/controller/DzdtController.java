package com.hdsx.jxzhpt.xtgl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.utile.DealShape2;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.bean.Dzdt;
import com.hdsx.jxzhpt.xtgl.bean.Param;
import com.hdsx.jxzhpt.xtgl.server.DzdtServer;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class DzdtController extends BaseActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8695511293141707190L;
	@Resource(name = "dzdtServerImpl")
	private DzdtServer dzdtServer;
	private Dzdt dzdt;
	private Param param;
	public void selLines(){
		
		
		HashMap<String, Object> hm=new HashMap<String, Object>();
		//System.out.println(ldxx.getRoadends());
		//ldxx.setRoadstart(0.0);
		//ldxx.setRoadends(53.466);
		List<Dzdt> rl=dzdtServer.selLines(dzdt);
		List<HashMap<String,String>> xyHashMapList = new ArrayList<HashMap<String,String>>();
		for(int i=0;i<rl.size();i++){
			Dzdt tempmb = rl.get(i);
			DealShape2<Dzdt> dealShape = new DealShape2<Dzdt>();
			System.out.println("--------");
			xyHashMapList =dealShape.getXyHashMapList("G6001",tempmb.getShape(),0.007,40.996);
			System.out.println("++++++++++++"+xyHashMapList);
			tempmb.setXyHashMapList(xyHashMapList);
		}
		
		
		try {
			JsonUtils.write(rl, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void xmlxCountTj(){
		String[] arr=param.getId().split(",");
		param.setId(null);
		List<Param> rl=dzdtServer.xmlxCountTj(param);//未加权
		List<Param> rl_n=new ArrayList<Param>();//权限列表
		
		for(int i=0;i<rl.size();i++){
			for(int j=0;j<arr.length;j++){
				if(arr[j].equals(rl.get(i).getId())){
					rl.get(i).setBz("1");
					rl_n.add(rl.get(i));
				}
			}
		}
		
		//循环设置合并单元格
		Param temp=rl_n.get(0);
		int flag=1;
		int index=0;
		if(rl_n.size()>1)
			for(int i=1;i<rl_n.size();i++){
				if(temp.getParent().equals(rl_n.get(i).getParent())){
					flag++;
					if(i==rl_n.size()-1) rl_n.get(index).setDesr(flag+"");
				}else{
					rl_n.get(index).setDesr(flag+"");
					index=i;
					flag=1;
					temp=rl_n.get(i);
					if(i==rl_n.size()-1) rl_n.get(index).setDesr(flag+"");
				}
			}
		try {
			JsonUtils.write(rl_n, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	
	public String selSqlStrByLxid(Param p){
		if(p.getRoleid().length()!=7){
			if("0101020101".equals(p.getRoleid()))
				return " select count(*) c from xmk_wqgz where 1=1 and  sbthcd<=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";
			if("0101020102".equals(p.getRoleid())) 
				return " select count(*) c from xmk_abgc where 1=1 and  sbthcd<=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";
			if("0101020103".equals(p.getRoleid())) 
				return " select count(*) c from xmk_zhfz where 1=1 and  sbthcd<=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";
			if("0101020301".equals(p.getRoleid())) 
				return " select count(*) c from (select * from sck_wqgz t join xmk_abgc on xmkid=xmk_abgc.id) t  where 1=1 and  sbthcd<=length('"+p.getRoleid()+"') and " +
				"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
				" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";
			if("0101020302".equals(p.getRoleid())) 
				return " select count(*) c from (select * from sck_abgc t join xmk_abgc on xmkid=xmk_abgc.id) t  where 1=1 and  sbthcd<=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";
			if("0101020303".equals(p.getRoleid())) 
				return " select count(*) c from (select * from sck_zhfz t join xmk_abgc on xmkid=xmk_abgc.id) t  where 1=1 and  sbthcd<=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";//xm
			
			if("0101030101".equals(p.getRoleid())) 
				return " select count(*) c from plan_wqgz jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
						" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='0' and spzt='0' and " +
						"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030102".equals(p.getRoleid())) 
				return " select count(*) c from plan_abgc jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
						" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='0' and spzt='0' and " +
						"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030103".equals(p.getRoleid()))
				return " select count(*) c from plan_zhfz jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
				" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='0' and spzt='0' and " +
				"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030104".equals(p.getRoleid()))
				return " select count(*) c from plan_gcsj jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
				" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='0' and spzt='0' and " +
				"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030105".equals(p.getRoleid()))
				return " select count(*) c from plan_gcgj jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
				" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='0' and spzt='0' and " +
				"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030106".equals(p.getRoleid()))
				return " select count(*) c from plan_yhdzx jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
				" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='0' and spzt='0' and " +
				"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030107".equals(p.getRoleid()))
				return " select count(*) c from plan_shuih jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
				" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='0' and spzt='0' and " +
				"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030108".equals(p.getRoleid())) 
				return " select count(*) c from plan_hsly jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
				" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='0' and spzt='0' and " +
				"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030109".equals(p.getRoleid())) 
				return "";//战备
			
			if("".equals(p.getRoleid()))
				return "select count(*) from PLAN_WQGZ where XJZT='未上报' spzt='1' and kgzt='1' and jgzt='0'" +
						"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
		}else{
			if("0101020101".equals(p.getRoleid()))
				return " select count(*) c from xmk_wqgz where  sbthcd=7 and  sbthcd>=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";
			if("0101020102".equals(p.getRoleid())) 
				return " select count(*) c from xmk_abgc where  sbthcd=7 and  sbthcd>=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";
			if("0101020103".equals(p.getRoleid())) 
				return " select count(*) c from xmk_zhfz where  sbthcd=7 and  sbthcd>=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";
			if("0101020301".equals(p.getRoleid())) 
				return " select count(*) c from (select * from sck_wqgz t join xmk_abgc on xmkid=xmk_abgc.id) t where  sbthcd=7 and  sbthcd>=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";
			if("0101020302".equals(p.getRoleid())) 
				return " select count(*) c from (select * from sck_abgc t join xmk_abgc on xmkid=xmk_abgc.id) t where  sbthcd=7 and  sbthcd>=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";
			if("0101020303".equals(p.getRoleid())) 
				return " select count(*) c from (select * from sck_zhfz t join xmk_abgc on xmkid=xmk_abgc.id) t where  sbthcd=7 and  sbthcd>=length('"+p.getRoleid()+"') and " +
						"tbbmbm in(select id from xtgl_department where id like '"+p.getRoleid()+"'||'%' or parent like '"+p.getRoleid()+"'||'%') and" +
						" xzqhdm in(select id from xtgl_xzqh where id='"+p.getXzqh()+"' or parent='"+p.getXzqh()+"')";//xm
			
			if("0101030101".equals(p.getRoleid()))
				return " select count(*) c from plan_wqgz jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
						" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='1' and spzt='0' and " +
						"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030102".equals(p.getRoleid())) 
				return " select count(*) c from plan_abgc jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
						" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='1' and spzt='0' and " +
						"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030103".equals(p.getRoleid()))
				return " select count(*) c from plan_zhfz jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
					" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='1' and spzt='0' and " +
					"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030104".equals(p.getRoleid()))
				return " select count(*) c from plan_gcsj jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
					" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='1' and spzt='0' and " +
					"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030105".equals(p.getRoleid()))
				return " select count(*) c from plan_gcgj jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
					" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='1' and spzt='0' and " +
					"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030106".equals(p.getRoleid()))
				return " select count(*) c from plan_yhdzx jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
				" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='1' and spzt='0' and " +
				"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030107".equals(p.getRoleid()))
				return " select count(*) c from plan_shuih jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
				" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='1' and spzt='0' and " +
				"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030108".equals(p.getRoleid())) 
				return " select count(*) c from plan_hsly jh left join sck_wqgz sc on (jh.sckid=sc.sckid) left join xmk_wqgz lx on (sc.xmkid=lx.id) " +
				" where jh_sbthcd=11-length('"+p.getRoleid()+"') and sbzt='1' and spzt='0' and " +
				"gydwbm like '"+p.getRoleid()+"'||'%' and xzqhdm like '"+p.getXzqh()+"'";
			if("0101030109".equals(p.getRoleid())) 
				return "";//战备
			
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
			if("".equals(p.getRoleid())) return "";
		}
		return "";
	}
	
	
	public Dzdt getDzdt() {
		return dzdt;
	}

	public void setDzdt(Dzdt dzdt) {
		this.dzdt = dzdt;
	}

	public Param getParam() {
		return param;
	}

	public void setParam(Param param) {
		this.param = param;
	}
	
	
}
