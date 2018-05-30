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
		try {
			//查看改qq下是否有角色了
			SqlSession ss = DBTools.getSession();
			FhMapper m = ss.getMapper(FhMapper.class);
			List<HashMap<String, String>> l = m.selectRoleByQq(fromQQ + "");
			if (l.size() > 0) {
				ss.close();
				return "[CQ:emoji,id=128514]你已经有角色了，无需再创建";
			} else {
				Map<String, String> role = new HashMap<String, String>();
				role.put("QQ", fromQQ + "");
				role.put("NAME", str.split("-")[1]);
				role.put("SEX", str.split("-")[2]);
				long sm = GetevenNum(150, 200);
				long fy = GetevenNum(130, 150);
				long gj = 500 - sm - fy;
				long zl = (sm + fy + gj * 2) * 10;
				role.put("SM", sm + "");
				role.put("GJ", gj + "");
				role.put("FY", fy + "");
				role.put("ZL", zl + "");
				int i = m.insertRole(role);
				ss.commit();
				ss.close();
				if (i == 1)
					return "[CQ:emoji,id=128512]创建成功";
				else
					return "[CQ:emoji,id=128148]创建失败，请联系作者";
			} 
		} catch (Exception e) {
			return "";
		}
	}
	//查询个人信息
	public static String grxx(long qq,long atqq) {
		try {
			//根据qq查角色
			SqlSession ss = DBTools.getSession();
			FhMapper m = ss.getMapper(FhMapper.class);
			List<HashMap<String, String>> l = m.selectRoleByQq(qq + "");
			if (l.size() == 0) {
				return "[CQ:emoji,id=128174]你还没有角色，请创建角色";
			}
			String msg = "┏★-个☆人☆信☆息-★┓\n" + " ☆角色名：" + l.get(0).get("NAME") + "\n" + " ☆性别   ：" + l.get(0).get("SEX")
					+ "\n" + " ☆等级   ：" + l.get(0).get("LV") + "\n" + " ☆修真   ：" + l.get(0).get("XZ") + "\n"
					+ " ☆配偶   ：" + l.get(0).get("POU") + "\n" + " ☆武器   ：" + l.get(0).get("WQ") + "\n" + " ☆护甲   ："
					+ l.get(0).get("HJ") + "\n" + " ☆首饰   ：" + l.get(0).get("SS") + "\n" + " ☆攻击   ："
					+ l.get(0).get("GJ") + "\n" + " ☆生命   ：" + l.get(0).get("SM") + "\n" + " ☆防御   ："
					+ l.get(0).get("FY") + "\n" + " ☆战力   ：" + l.get(0).get("ZL") + "\n" + " ☆宠物   ："
					+ l.get(0).get("CW") + "\n" + " ☆灵石   ：" + l.get(0).get("LS") + "\n"+ " ☆经验   ：" + l.get(0).get("JY") + "/"
					+ (long) ((Double.parseDouble(l.get(0).get("LV")) - 1 + 100)
							* (Double.parseDouble(l.get(0).get("LV")) - 1) * 2 + 100)
					+ "\n" + "┗★-查☆询☆成☆功-★┛";
			//（等级-1+100）*（等级-1）*2+100
			return msg;
		} catch (Exception e) {
			return "";
		}
	} 
	//人物升级
	public static String rolesj(long qq) {
		try {
			List<HashMap<String, String>> l = cxsf(qq);
			if (Long.parseLong(l.get(0).get("JY")) >= (long) ((Double.parseDouble(l.get(0).get("LV")) - 1 + 100)
					* (Double.parseDouble(l.get(0).get("LV")) - 1) * 2 + 100)) {
				Map<String, String> role = new HashMap<String, String>();
				role.put("QQ", qq + "");
				long sm = GetevenNum(5, 10);
				long fy = GetevenNum(5, 10);
				long gj = 25 - sm - fy;
				long zl = (sm + fy + gj * 2) * 10;
				role.put("SM", (Long.parseLong(l.get(0).get("SM")) + sm) + "");
				role.put("GJ", (Long.parseLong(l.get(0).get("GJ")) + gj) + "");
				role.put("FY", (Long.parseLong(l.get(0).get("FY")) + fy) + "");
				role.put("ZL", (Long.parseLong(l.get(0).get("ZL")) + zl) + "");
				role.put("LV", (Long.parseLong(l.get(0).get("LV")) + 1) + "");
				role.put("JY",
						(Long.parseLong(l.get(0).get("JY")) - (long) ((Double.parseDouble(l.get(0).get("LV")) - 1 + 100)
								* (Double.parseDouble(l.get(0).get("LV")) - 1) * 2 + 100)) + "");
				role.put("CZSJ", qq + "");
				SqlSession ss = DBTools.getSession();
				FhMapper m = ss.getMapper(FhMapper.class);
				m.updateRole(role);
				ss.commit();
				String msg = "┏★-角☆色☆升☆级-★┓\n" + " ☆攻击   ：+" + gj + "\n" + " ☆生命   ：+" + sm + "\n" + " ☆防御   ：+" + fy
						+ "\n" + " ☆战力   ：+" + zl + "\n" + "┗★-风☆华☆娱☆乐-★┛";
				return msg;

			} else
				return "经验不够";
		} catch (Exception e) {
			return "";
		}
	}
	//闭关修炼
	public static String bgxl(long qq,long atqq) {
		
		try {
			String[] bgm = { "碧水云天", "水云之涧", "幽兰山谷", "羽嘉湖畔", "流光沙滩", "相思竹林", "洛溪断桥", "蓬莱仙境" };
			String msg = bgm[(int) GetevenNum(0, 8)];
			List<HashMap<String, String>> l = cxsf(qq);
			if (l.size() == 0)
				return "[CQ:emoji,id=128174]你还没有角色，请创建角色";
			boolean czjg = czjg(qq);
			if (!czjg) {
				return "上次活动时间不足1分钟，无法继续活动，请休息片刻马上回来";
			}
			long jy = GetevenNum(50 + (Long.parseLong(l.get(0).get("LV")) - 1) * 50,
					100 + (Long.parseLong(l.get(0).get("LV")) - 1) * 50);
			Map<String, String> role = new HashMap<String, String>();
			role.put("JY", jy + Long.parseLong(l.get(0).get("JY")) + "");
			role.put("QQ", qq + "");
			role.put("CZSJ", qq + "");
			SqlSession ss = DBTools.getSession();
			FhMapper m = ss.getMapper(FhMapper.class);
			m.updateRole(role);
			ss.commit();
			String rolesj = rolesj(qq);
			String remsg = "[CQ:image,file=fhrobot\\闭关修炼\\"+msg+".png]\n你在" + msg + "疯狂修炼,获得" + jy + "经验。";
			if ("经验不够".equals(rolesj)) {

			} else {
				remsg += "\n" + rolesj;
			}
			ss.close();
			return remsg;
		} catch (Exception e) {
			return "";
		}
	}
	//副本列表
	public static String fbxt(long qq,long atqq) {
		try {
			//查询副本
			SqlSession ss = DBTools.getSession();
			FhMapper m = ss.getMapper(FhMapper.class);
			List<HashMap<String, String>> l = m.selectFb();
			String remsg = "┏★-副☆本☆信☆息-★┓\n";
			for (HashMap<String, String> h : l) {
				remsg += "  ☆   lv" + h.get("LV") + " " + h.get("NAME") + " ";
				remsg += "\n";
			}
			remsg += "┗★-风☆华☆娱☆乐-★┛";
			return remsg;
		} catch (Exception e) {
			return "";
		}
	}
	
	//武器列表
		public static String wqsc(long qq,long atqq) {
			try {
				//查询副本
				SqlSession ss = DBTools.getSession();
				FhMapper m = ss.getMapper(FhMapper.class);
				List<HashMap<String, String>> l = m.selectSP("武器");
				String remsg = "┏★-武☆器☆商☆城-★┓\n";
				for (HashMap<String, String> h : l) {
					remsg += "lv" + h.get("LV") + " " + h.get("NAME")+ " ￥:"+h.get("LS");
					remsg += "\n";
				}
				remsg += "┗★-风☆华☆娱☆乐-★┛";
				return remsg;
			} catch (Exception e) {
				return "";
			}
		}
		//护甲列表
			public static String hjsc(long qq,long atqq) {
				try {
					//查询副本
					SqlSession ss = DBTools.getSession();
					FhMapper m = ss.getMapper(FhMapper.class);
					List<HashMap<String, String>> l = m.selectSP("护甲");
					String remsg = "┏★-护☆甲☆商☆城-★┓\n";
					for (HashMap<String, String> h : l) {
						remsg += "lv" + h.get("LV") + " " + h.get("NAME")+ " ￥:"+h.get("LS");
						remsg += "\n";
					}
					remsg += "┗★-风☆华☆娱☆乐-★┛";
					return remsg;
				} catch (Exception e) {
					return "";
				}
			}
			//首饰列表
			public static String sssc(long qq,long atqq) {
				try {
					//查询副本
					SqlSession ss = DBTools.getSession();
					FhMapper m = ss.getMapper(FhMapper.class);
					List<HashMap<String, String>> l = m.selectSP("首饰");
					String remsg = "┏★-首☆饰☆商☆城-★┓\n";
					for (HashMap<String, String> h : l) {
						remsg += "lv" + h.get("LV") + " " + h.get("NAME")+ " ￥:"+h.get("LS");
						remsg += "\n";
					}
					remsg += "┗★-风☆华☆娱☆乐-★┛";
					return remsg;
				} catch (Exception e) {
					return "";
				}
			}
	
	
	//操作间隔
	public static boolean czjg(long qq) {
		try {
			SqlSession ss = DBTools.getSession();
			FhMapper m = ss.getMapper(FhMapper.class);
			List<HashMap<String, String>> l = m.selectRoleByQqAndJg(qq + "");
			if (l.size() == 0) {
				return false;
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	//进入副本
	public static String jrfb(long qq,String msg) {
		try {
			List<HashMap<String, String>> l = cxsf(qq);
			if (l.size() == 0) {
				return "[CQ:emoji,id=128174]你还没有角色，请创建角色";
			}
			SqlSession ss=DBTools.getSession();
			FhMapper m = ss.getMapper(FhMapper.class);
			boolean czjg = czjg(qq);
			if (!czjg) {
				return "上次活动时间不足1分钟，无法继续活动，请休息片刻马上回来";
			}
			//根据副本名,查到副本
			List<HashMap<String, String>> fb = m.queryfbByName(msg.split("-")[1]);
			if(Long.parseLong(l.get(0).get("LV"))<Long.parseLong(fb.get(0).get("LV"))) {
				return "等级不足，请再历练一番再来，不然小命难保。";
			}
			if(Long.parseLong(l.get(0).get("XZLV"))<Long.parseLong(fb.get(0).get("XZJB"))) {
				return "修真不足，请挑战低等级副本提升修真再来挑战。";
			}
			if(Long.parseLong(l.get(0).get("ZL"))<=Long.parseLong(fb.get(0).get("LV"))*1000) {
				return "你战力不足，建议战力高于"+(Long.parseLong(fb.get(0).get("LV"))*1000)+"再来。";
			}
			HashMap<String, String> role = new HashMap<String, String>();
			role.put("QQ", qq+"");
			role.put("JY",Long.parseLong(l.get(0).get("JY"))+Long.parseLong(fb.get(0).get("LV"))*10+100+"");
			String remsg="你在"+fb.get(0).get("NAME")+"与妖魔展开疯狂对决，最终你以压倒性优势获胜，并获得以下奖励\n";
			if(Long.parseLong(l.get(0).get("XZLV"))==Long.parseLong(fb.get(0).get("XZJB"))) {
				role.put("XZ", fb.get(0).get("XZ"));
				role.put("XZLV", Long.parseLong(l.get(0).get("XZLV"))+1+"");
				remsg+="  ☆ 修真提升到 "+fb.get(0).get("XZ")+"\n" ;
			}
			
			
			long x=GetevenNum(1, 4);
			if(x<=(long)3) {
				//爆东西
				long flag=GetevenNum(1,6);
				if(flag==(long)1) {
					//爆武器
					if(GetevenNum(1,3)==(long)2) {
						long id=GetevenNum(1,Long.parseLong(l.get(0).get("XZLV"))+1);
						HashMap<String, String> bsp = new HashMap<String, String>();
						bsp.put("ID", id+"");
						bsp.put("LX", "武器");
						HashMap<String, String> mysp=m.querySpByIdAndLx(bsp);
						HashMap<String, String> bwp = new HashMap<String, String>();
						bwp.put("QQ", qq+"");bwp.put("NAME", mysp.get("NAME"));
						//h.put("SL", qq+"");h.put("NAME", msg.split("-")[2]+"");
						List<HashMap<String, String>> ls = m.selectWdwpByQqAndName(bwp);
						if(ls.size()>0||mysp.get("NAME").equals(l.get(0).get("WQ"))) {}else {
							
						HashMap<String, String> h=new HashMap<String, String>();
						h.put("QQ", qq+"");h.put("NAME", mysp.get("NAME"));
						h.put("LV", mysp.get("LV"));
						h.put("SL", "1");
						h.put("LX", mysp.get("LX"));
						m.insertWp(h);
						remsg+="  ☆ 武器掉落 Lv" +mysp.get("LV")+" "+mysp.get("NAME")+"\n";
						}
					}
					
				}
				if(flag==(long)3) {
					//爆护甲
					long id=GetevenNum(1,Long.parseLong(l.get(0).get("XZLV"))+1);
					HashMap<String, String> bsp = new HashMap<String, String>();
					bsp.put("ID", id+"");
					bsp.put("LX", "护甲");
					HashMap<String, String> mysp=m.querySpByIdAndLx(bsp);
					HashMap<String, String> bwp = new HashMap<String, String>();
					bwp.put("QQ", qq+"");bwp.put("NAME", mysp.get("NAME"));
					//h.put("SL", qq+"");h.put("NAME", msg.split("-")[2]+"");
					List<HashMap<String, String>> ls = m.selectWdwpByQqAndName(bwp);
					if(ls.size()>0||mysp.get("NAME").equals(l.get(0).get("HJ"))) {}else {
						
					HashMap<String, String> h=new HashMap<String, String>();
					h.put("QQ", qq+"");h.put("NAME", mysp.get("NAME"));
					h.put("LV", mysp.get("LV"));
					h.put("SL", "1");
					h.put("LX", mysp.get("LX"));
					m.insertWp(h);
					remsg+="  ☆ 护甲掉落 Lv" +mysp.get("LV")+" "+mysp.get("NAME")+"\n";
					}
					
					
				}
				if(flag==(long)5) {
					//爆首饰
					long id=GetevenNum(1,Long.parseLong(l.get(0).get("XZLV"))+1);
					HashMap<String, String> bsp = new HashMap<String, String>();
					bsp.put("ID", id+"");
					bsp.put("LX", "首饰");
					HashMap<String, String> mysp=m.querySpByIdAndLx(bsp);
					HashMap<String, String> bwp = new HashMap<String, String>();
					bwp.put("QQ", qq+"");bwp.put("NAME", mysp.get("NAME"));
					//h.put("SL", qq+"");h.put("NAME", msg.split("-")[2]+"");
					List<HashMap<String, String>> ls = m.selectWdwpByQqAndName(bwp);
					if(ls.size()>0||mysp.get("NAME").equals(l.get(0).get("SS"))) {}else {
						
					HashMap<String, String> h=new HashMap<String, String>();
					h.put("QQ", qq+"");h.put("NAME", mysp.get("NAME"));
					h.put("LV", mysp.get("LV"));
					h.put("SL", "1");
					h.put("LX", mysp.get("LX"));
					m.insertWp(h);
					remsg+="  ☆ 首饰掉落 Lv" +mysp.get("LV")+" "+mysp.get("NAME")+"\n";
					}
					
					
				}
				
			}else {
				//不掉东西
			}
			remsg+="  ☆ 经验+" + (Long.parseLong(fb.get(0).get("LV"))*10+100)+"\n";
			//灵石增加   副本等级*10-副本等级*100
			long ls=GetevenNum(Long.parseLong(fb.get(0).get("LV"))*10,Long.parseLong(fb.get(0).get("LV"))*100);
			remsg+="  ☆ 灵石+" + ls+"\n";
			role.put("LS",(Long.parseLong(l.get(0).get("LS"))+ls)+"");
			role.put("CZSJ", qq + "");
			
			m.updateRole(role);
			ss.commit();
			
			String rolesj = rolesj(qq);
			if ("经验不够".equals(rolesj)) {

			} else {
				remsg +=  rolesj;
			}
			
			
			return remsg;
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	
	//查询角色
	public static List<HashMap<String, String>> cxsf(long qq) {
		try {
			SqlSession ss = DBTools.getSession();
			FhMapper m = ss.getMapper(FhMapper.class);
			List<HashMap<String, String>> l = m.selectRoleByQq(qq + "");
			return l;
		} catch (Exception e) {
			return null;
		}
	}
	
	
	public static String wdwp(long qq,long atqq) {
		try {
			List<HashMap<String, String>> l = cxsf(qq);
			if (l.size() == 0) {
				return "[CQ:emoji,id=128174]你还没有角色，请创建角色";
			}
			SqlSession ss = DBTools.getSession();
			FhMapper m = ss.getMapper(FhMapper.class);
			List<HashMap<String, String>> ls = m.selectWpByQq(qq + "");
			String remsg = "┏★-我☆的☆装☆备-★┓\n";
			for (HashMap<String, String> h : ls) {
				remsg += " Lv"+ h.get("LV") +" "+ h.get("LX") + " " + h.get("NAME") +" X"+h.get("SL");
				remsg += "\n";
			}
			remsg += "┗★-风☆华☆娱☆乐-★┛";
			return remsg;
			
		} catch (Exception e) {
			return "";
		}
	}
	
	
	
	//使用装备
	public static String sywp(long qq,String msg) {
		try {
			//查询是否有该装备
			List<HashMap<String, String>> l = cxsf(qq);
			if (l.size() == 0) {
				return "[CQ:emoji,id=128174]你还没有角色，请创建角色";
			}
			SqlSession ss = DBTools.getSession();
			FhMapper m = ss.getMapper(FhMapper.class);
			HashMap<String, String> h=new HashMap<String, String>();
			h.put("QQ", qq+"");h.put("NAME", msg.split("-")[1]+"");
			//h.put("SL", qq+"");h.put("NAME", msg.split("-")[2]+"");
			List<HashMap<String, String>> ls = m.selectWdwpByQqAndName(h);
			if(ls.size()==0) return "你还未拥有该装备";
			if(Long.parseLong(l.get(0).get("LV")) < Long.parseLong(ls.get(0).get("LV"))   ) {
				return "等级未达到该装备需求";
			}
			
			//返回该装备
			
			String remsg="";
			if("药品".equals(ls.get(0).get("LX"))) {
				if(Long.parseLong(ls.get(0).get("SL")) < Long.parseLong(msg.split("-")[2])   ) {
					return "装备数量不足"+msg.split("-")[2]+"个";
				}
			}
			else {
				if("武器".equals(ls.get(0).get("LX"))) {
					if(!"无".equals(l.get(0).get("WQ"))) {
						//卸下武器，即在装备里面添加一条数据
						HashMap<String, String> ywq=new HashMap<String, String>();
						ywq.put("QQ", qq+"");
						ywq.put("NAME",l.get(0).get("WQ"));
						ywq.put("SL","1");
						List<HashMap<String, String>> sp1=m.selectSpByName(l.get(0).get("WQ"));
						ywq.put("LV",sp1.get(0).get("LV"));
						ywq.put("LX","武器");
						long gj=-Long.parseLong(sp1.get(0).get("GJ"));
						long zl=-2*Long.parseLong(sp1.get(0).get("GJ"))*10;
						m.insertWp(ywq);
						//删掉新武器
						HashMap<String, String> xwq=new HashMap<String, String>();
						xwq.put("QQ", qq+"");
						xwq.put("NAME",ls.get(0).get("NAME"));
						m.deleteWp(xwq);
						List<HashMap<String, String>> sp2=m.selectSpByName(ls.get(0).get("NAME"));
						gj+=Long.parseLong(sp2.get(0).get("GJ"));
						zl+=2*Long.parseLong(sp2.get(0).get("GJ"))*10;
						h.put("WQ", ls.get(0).get("NAME"));
						h.put("GJ", (gj+Long.parseLong(l.get(0).get("GJ")))+"");
						h.put("ZL", (zl+Long.parseLong(l.get(0).get("ZL")))+"");
						m.updateRolebyWp(h);
						remsg = "使用装备成功，请发送“个人信息”查看";
						ss.commit();
						}else {
							//删掉新武器
							HashMap<String, String> xwq=new HashMap<String, String>();
							xwq.put("QQ", qq+"");
							xwq.put("NAME",ls.get(0).get("NAME"));
							m.deleteWp(xwq);
							List<HashMap<String, String>> sp2=m.selectSpByName(ls.get(0).get("NAME"));
							long gj=Long.parseLong(sp2.get(0).get("GJ"));
							long zl=2*Long.parseLong(sp2.get(0).get("GJ"))*10;
							h.put("WQ", ls.get(0).get("NAME"));
							h.put("GJ", (gj+Long.parseLong(l.get(0).get("GJ")))+"");
							h.put("ZL", (zl+Long.parseLong(l.get(0).get("ZL")))+"");
							m.updateRolebyWp(h);
							remsg = "使用装备成功，请发送“个人信息”查看";
							ss.commit();
						}
						
					}
				
				if("护甲".equals(ls.get(0).get("LX"))) {
					if(!"无".equals(l.get(0).get("HJ"))) {
						//卸下武器，即在装备里面添加一条数据
						HashMap<String, String> ywq=new HashMap<String, String>();
						ywq.put("QQ", qq+"");
						ywq.put("NAME",l.get(0).get("HJ"));
						ywq.put("SL","1");
						List<HashMap<String, String>> sp1=m.selectSpByName(l.get(0).get("HJ"));
						ywq.put("LV",sp1.get(0).get("LV"));
						ywq.put("LX","护甲");
						long gj=-Long.parseLong(sp1.get(0).get("FY"));
						long zl=-1*Long.parseLong(sp1.get(0).get("FY"))*10;
						m.insertWp(ywq);
						//删掉新武器
						HashMap<String, String> xwq=new HashMap<String, String>();
						xwq.put("QQ", qq+"");
						xwq.put("NAME",ls.get(0).get("NAME"));
						m.deleteWp(xwq);
						List<HashMap<String, String>> sp2=m.selectSpByName(ls.get(0).get("NAME"));
						gj+=Long.parseLong(sp2.get(0).get("FY"));
						zl+=1*Long.parseLong(sp2.get(0).get("FY"))*10;
						h.put("HJ", ls.get(0).get("NAME"));
						h.put("FY", gj+Long.parseLong(l.get(0).get("FY"))+"");
						h.put("ZL", zl+Long.parseLong(l.get(0).get("ZL"))+"");
						m.updateRolebyWp(h);
						remsg = "使用装备成功，请发送“个人信息”查看";
						ss.commit();
					}else {
						//删掉新武器
						HashMap<String, String> xwq=new HashMap<String, String>();
						xwq.put("QQ", qq+"");
						xwq.put("NAME",ls.get(0).get("NAME"));
						m.deleteWp(xwq);
						List<HashMap<String, String>> sp2=m.selectSpByName(ls.get(0).get("NAME"));
						long gj=Long.parseLong(sp2.get(0).get("FY"));
						long zl=1*Long.parseLong(sp2.get(0).get("FY"))*10;
						h.put("HJ", ls.get(0).get("NAME"));
						h.put("FY", gj+Long.parseLong(l.get(0).get("FY"))+"");
						h.put("ZL", zl+Long.parseLong(l.get(0).get("ZL"))+"");
						m.updateRolebyWp(h);
						remsg = "使用装备成功，请发送“个人信息”查看";
						ss.commit();
					}
					
				}
				if("首饰".equals(ls.get(0).get("LX"))) {
					if(!"无".equals(l.get(0).get("SS"))) {
						//卸下武器，即在装备里面添加一条数据
						HashMap<String, String> ywq=new HashMap<String, String>();
						ywq.put("QQ", qq+"");
						ywq.put("NAME",l.get(0).get("SS"));
						ywq.put("SL","1");
						List<HashMap<String, String>> sp1=m.selectSpByName(l.get(0).get("SS"));
						ywq.put("LV",sp1.get(0).get("LV"));
						ywq.put("LX","首饰");
						long gj=-Long.parseLong(sp1.get(0).get("SM"));
						long zl=-1*Long.parseLong(sp1.get(0).get("SM"))*10;
						m.insertWp(ywq);
						//删掉新武器
						HashMap<String, String> xwq=new HashMap<String, String>();
						xwq.put("QQ", qq+"");
						xwq.put("NAME",ls.get(0).get("NAME"));
						m.deleteWp(xwq);
						List<HashMap<String, String>> sp2=m.selectSpByName(ls.get(0).get("NAME"));
						gj+=Long.parseLong(sp2.get(0).get("SM"));
						zl+=1*Long.parseLong(sp2.get(0).get("SM"))*10;
						h.put("SS", ls.get(0).get("NAME"));
						h.put("SM", gj+Long.parseLong(l.get(0).get("SM"))+"");
						h.put("ZL", zl+Long.parseLong(l.get(0).get("ZL"))+"");
						m.updateRolebyWp(h);
						remsg = "使用装备成功，请发送“个人信息”查看";
						ss.commit();
					}else {
						//删掉新武器
						HashMap<String, String> xwq=new HashMap<String, String>();
						xwq.put("QQ", qq+"");
						xwq.put("NAME",ls.get(0).get("NAME"));
						m.deleteWp(xwq);
						List<HashMap<String, String>> sp2=m.selectSpByName(ls.get(0).get("NAME"));
						long gj=Long.parseLong(sp2.get(0).get("SM"));
						long zl=1*Long.parseLong(sp2.get(0).get("SM"))*10;
						h.put("SS", ls.get(0).get("NAME"));
						h.put("SM", gj+Long.parseLong(l.get(0).get("SM"))+"");
						h.put("ZL", zl+Long.parseLong(l.get(0).get("ZL"))+"");
						m.updateRolebyWp(h);
						remsg = "使用装备成功，请发送“个人信息”查看";
						ss.commit();
						}
					}
				}
			return remsg;
		} catch (Exception e) {
			return null;
		}
	}
	
	
	
	//购买武器
	public static String gmwp(long qq,String msg) {
		String remsg="";
			//查询是否有该装备
			try {
				List<HashMap<String, String>> l = cxsf(qq);
				if (l.size() == 0) {
					return "[CQ:emoji,id=128174]你还没有角色，请创建角色";
				}
				SqlSession ss = DBTools.getSession();
				FhMapper m = ss.getMapper(FhMapper.class);
				//是否已经有该装备
				HashMap<String, String> h1=new HashMap<String, String>();
				h1.put("QQ", qq+"");h1.put("NAME", msg.split("-")[1]+"");
				//h.put("SL", qq+"");h.put("NAME", msg.split("-")[2]+"");
				List<HashMap<String, String>> ls = m.selectWdwpByQqAndName(h1);
				if(ls.size()>=1||msg.split("-")[1].equals(l.get(0).get("WQ"))||msg.split("-")[1].equals(l.get(0).get("HJ"))||msg.split("-")[1].equals(l.get(0).get("SS"))) return "你已经拥有该装备";
				
				//根据名字查询装备
				List<HashMap<String, String>> sp=m.selectSpByName(msg.split("-")[1]);
				if(sp.size()==0) {
					return "未找到该装备";
				}
				if(Long.parseLong(l.get(0).get("LS"))<Long.parseLong(sp.get(0).get("LS"))) {
					return "灵石不足以购买该装备";
				}
				HashMap<String, String> h=new HashMap<String, String>();
				h.put("QQ", qq+"");h.put("NAME", sp.get(0).get("NAME"));
				h.put("LV", sp.get(0).get("LV"));
				h.put("SL", "1");
				h.put("LX", sp.get(0).get("LX"));
				h.put("LS", Long.parseLong(l.get(0).get("LS"))-Long.parseLong(sp.get(0).get("LS"))+"");
				m.insertWp(h);
				m.updateRolebyWp(h);
				ss.commit();
				remsg="购买成功";
			} catch (Exception e) {
				return "未找到该装备";
			}
			return remsg;
	}
	
	
	
	
	
	
	//随机数
	public static long GetevenNum(long num1,long num2){  
		long s=(long)num1+(int)(Math.random()*(num2-num1));  
		return s;  
		} 
	
	public static void main(String[] args) throws Exception {
//		System.out.println(jrfb(1665942885,"进入副本-锁妖塔六层"));
//		System.out.println(gmwp(1665942885,"购买装备-淘米见"));
		long flag=GetevenNum(0,7);
		System.out.println(flag+"  "+(flag<=(long)2));
		System.out.println(flag+"  "+(flag==(long)2));
		System.out.println(flag+"  "+(flag==(long)3));
		System.out.println(flag+"  "+(flag==(long)4));
		System.out.println(flag+"  "+(flag==(long)5));
		
		
/*		SqlSession ss=DBTools.getSession();
		FhMapper m = ss.getMapper(FhMapper.class);
		List<Map<String, String>> l = m.selectOutMsg("风华修仙传");
		System.out.println(l.get(0).get("FUN")==null);
*/		
//		System.out.println(cjrole(1665942885,"创建角色-乄测试专员丶-男"));
		
	}
}
