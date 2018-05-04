package com.fh.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.fh.server.FhMapper;
import com.fh.tools.DBTools;

public class Fhcontroller {
	//创建角色
	//返回0正常创建失败1，成功，2，已经有角色了
	public static String cjrole(long fromQQ,String str) {
		//查看改qq下是否有角色了
		SqlSession ss=DBTools.getSession();
		FhMapper m = ss.getMapper(FhMapper.class);
		List<HashMap<String, String>> l = m.selectRoleByQq(fromQQ+"");
		if(l.size()>0) {
			ss.close();
			return "[CQ:emoji,id=128514]你已经有角色了，无需再创建";
		}else {
			Map<String, String> role= new HashMap<String, String>();
			role.put("QQ", fromQQ+"");
			role.put("NAME", str.split("-")[1]);
			role.put("SEX", str.split("-")[2]);
			long sm=GetevenNum(150,200);
			long fy=GetevenNum(130,150);
			long gj=500-sm-fy;
			long zl=(sm+fy+gj*2)*10;
			role.put("SM", sm+"");
			role.put("GJ", gj+"");
			role.put("FY", fy+"");
			role.put("ZL", zl+"");
			int i=m.insertRole(role);
			ss.commit();ss.close();
			if(i==1)
			return "[CQ:emoji,id=128512]创建成功";
			else
			return "[CQ:emoji,id=128148]创建失败，请联系作者";
		}
	}
	//查询个人信息
	public static String grxx(long qq,long atqq) {
		//根据qq查角色
		SqlSession ss=DBTools.getSession();
		FhMapper m = ss.getMapper(FhMapper.class);
		List<HashMap<String, String>> l = m.selectRoleByQq(qq+"");
		if(l.size()==0) {
			return "[CQ:emoji,id=128174]你还没有角色，请创建角色";
		}
		String msg="┏★-个☆人☆信☆息-★┓\n"
		+" ☆角色名："+l.get(0).get("NAME")+"\n"
		+" ☆性别   ："+l.get(0).get("SEX")+"\n"
		+" ☆等级   ："+l.get(0).get("LV")+"\n"
		+" ☆修真   ："+l.get(0).get("XZ")+"\n"
		+" ☆配偶   ："+l.get(0).get("POU")+"\n"
		+" ☆武器   ："+l.get(0).get("WQ")+"\n"
		+" ☆护甲   ："+l.get(0).get("HJ")+"\n"
		+" ☆首饰   ："+l.get(0).get("SS")+"\n"
		+" ☆攻击   ："+l.get(0).get("GJ")+"\n"
		+" ☆生命   ："+l.get(0).get("SM")+"\n"
		+" ☆防御   ："+l.get(0).get("FY")+"\n"
		+" ☆战力   ："+l.get(0).get("ZL")+"\n"
		+" ☆宠物   ："+l.get(0).get("CW")+"\n"
		+" ☆经验   ："+l.get(0).get("JY")+"/"+(long)((Double.parseDouble(l.get(0).get("LV"))-1+100)*(Double.parseDouble(l.get(0).get("LV"))-1)*2+100)+"\n"
		+"┗★-查☆询☆成☆功-★┛";
		//（等级-1+100）*（等级-1）*2+100
		return msg;
	} 
	//人物升级
	public static String rolesj(long qq) {
		List<HashMap<String, String>> l=cxsf(qq);
		if(Long.parseLong(l.get(0).get("JY"))>=(long)((Double.parseDouble(l.get(0).get("LV"))-1+100)*(Double.parseDouble(l.get(0).get("LV"))-1)*2+100)) {
			Map<String, String> role= new HashMap<String, String>();
			role.put("QQ", qq+"");
			long sm=GetevenNum(5,10);
			long fy=GetevenNum(5,10);
			long gj=25-sm-fy;
			long zl=(sm+fy+gj*2)*10;
			role.put("SM", (Long.parseLong(l.get(0).get("SM"))+sm)+"");
			role.put("GJ", (Long.parseLong(l.get(0).get("GJ"))+gj)+"");
			role.put("FY", (Long.parseLong(l.get(0).get("FY"))+fy)+"");
			role.put("ZL", (Long.parseLong(l.get(0).get("ZL"))+zl)+"");
			role.put("LV", (Long.parseLong(l.get(0).get("LV"))+1)+"");
			role.put("JY", (Long.parseLong(l.get(0).get("JY"))-(long)((Double.parseDouble(l.get(0).get("LV"))-1+100)*(Double.parseDouble(l.get(0).get("LV"))-1)*2+100) )+"");
			role.put("CZSJ", qq+"");
			SqlSession ss=DBTools.getSession();
			FhMapper m = ss.getMapper(FhMapper.class);
			m.updateRole(role);
			ss.commit();
			String msg="┏★-角☆色☆升☆级-★┓\n"
					+" ☆攻击   ：+"+gj+"\n"
					+" ☆生命   ：+"+sm+"\n"
					+" ☆防御   ：+"+fy+"\n"
					+" ☆战力   ：+"+zl+"\n"
					+"┗★-风☆华☆娱☆乐-★┛";
			return msg;
			
		}
		else return "经验不够";
	}
	//闭关修炼
	public static String bgxl(long qq,long atqq) {
		
		String[] bgm= {"碧水云天","水云之涧","幽兰山谷","羽嘉湖畔","流光沙滩","相思竹林","洛溪断桥"};
		String msg = bgm[(int) GetevenNum(0,6)];
		List<HashMap<String, String>> l = cxsf(qq);
		if(l.size()==0) return "[CQ:emoji,id=128174]你还没有角色，请创建角色";
		boolean czjg = czjg(qq);
		if(!czjg) {
			return "上次活动时间不足5分钟，无法继续活动，请休息片刻马上回来";
		}
		long jy=GetevenNum(50+  (Long.parseLong(l.get(0).get("LV"))-1)*50   ,100+  (Long.parseLong(l.get(0).get("LV"))-1)*50);
		Map<String, String> role= new HashMap<String, String>();
		role.put("JY", jy+Long.parseLong(l.get(0).get("JY"))+"");
		role.put("QQ", qq+"");
		role.put("CZSJ", qq+"");
		SqlSession ss=DBTools.getSession();
		FhMapper m = ss.getMapper(FhMapper.class);
		m.updateRole(role);
		ss.commit();
		String rolesj = rolesj(qq);
		String remsg="你在"+msg+"疯狂修炼,获得"+jy+"经验。";
		if("经验不够".equals(rolesj)) {
			
		}else {
			remsg+="\n"+rolesj;
		}
		ss.close();
		return remsg;
	}
	//副本列表
	public static String fbxt(long qq,long atqq) {
		//查询副本
		SqlSession ss=DBTools.getSession();
		FhMapper m = ss.getMapper(FhMapper.class);
		List<HashMap<String, String>> l =m.selectFb();
		String remsg="┏★-角☆色☆升☆级-★┓\n";
		int k=0;
		for (HashMap<String, String> h : l) {
			remsg+="☆ lv"+h.get("LV")+" "+h.get("NAME")+" ";
			if(k%2==0)
			remsg+="\n";
			k++;
		}
		remsg+="┗★-风☆华☆娱☆乐-★┛";
		return remsg;
	}
	
	
	//操作间隔
	public static boolean czjg(long qq) {
		SqlSession ss=DBTools.getSession();
		FhMapper m = ss.getMapper(FhMapper.class);
		List<HashMap<String, String>> l = m.selectRoleByQqAndJg(qq+"");
		if(l.size()==0) {
			return false;
		}
		return true;
	}
	//进入副本
	public static String jrfb(long qq) {
		List<HashMap<String, String>> l = cxsf(qq);
		if(l.size()==0) {
			return "[CQ:emoji,id=128174]你还没有角色，请创建角色";
		}
		//根据副本名
		
		
		return "";
	}
	
	
	//查询角色
	public static List<HashMap<String, String>> cxsf(long qq) {
		SqlSession ss=DBTools.getSession();
		FhMapper m = ss.getMapper(FhMapper.class);
		List<HashMap<String, String>> l = m.selectRoleByQq(qq+"");
		return l;
	}
	
	
	
	
	
	
	
	
	
	
	
	//随机数
	public static long GetevenNum(long num1,long num2){  
		long s=(long)num1+(int)(Math.random()*(num2-num1));  
		return s;  
		} 
	
	public static void main(String[] args) throws Exception {
		System.out.println(bgxl(1665942885,1665942885));
		
		
		
/*		SqlSession ss=DBTools.getSession();
		FhMapper m = ss.getMapper(FhMapper.class);
		List<Map<String, String>> l = m.selectOutMsg("风华修仙传");
		System.out.println(l.get(0).get("FUN")==null);
*/		
//		System.out.println(cjrole(1665942885,"创建角色-乄测试专员丶-男"));
		
	}
}
