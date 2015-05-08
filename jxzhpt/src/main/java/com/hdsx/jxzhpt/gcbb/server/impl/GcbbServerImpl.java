package com.hdsx.jxzhpt.gcbb.server.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcbb.bean.Gcbb5;
import com.hdsx.jxzhpt.gcbb.bean.GcgjJd;
import com.hdsx.jxzhpt.gcbb.bean.GcsjJd;
import com.hdsx.jxzhpt.gcbb.server.GcbbServer;
import com.hdsx.jxzhpt.gcxmybb.bean.Xmbb;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class GcbbServerImpl extends BaseOperate implements GcbbServer{
	public GcbbServerImpl() {
		super("gcbb", "jdbc");
	}

	@Override
	public List<GcgjJd> selGcgjJdbb(Xmbb xmbb) {
		return queryList("selGcgjJdbb",xmbb);
	}

	@Override
	public List<GcgjJd> selShuihJdbb(Xmbb xmbb) {
		return queryList("selShuihJdbb",xmbb);
	}

	@Override
	public List<GcsjJd> selGcsjJdbb(Xmbb xmbb) {
		return queryList("selGcsjJdbb",xmbb);
	}

	@Override
	public List<GcsjJd> selYhdzxJdbb(Xmbb xmbb) {
		return queryList("selYhdzxJdbb",xmbb);
	}

	@Override
	public List<Gcbb5> selGcbb5(Xmbb xmbb) {
		List<Gcbb5> result=new ArrayList<Gcbb5>();
		List<Gcbb5> queryList = queryList("selGcbb5_1",xmbb);
		List<Gcbb5> shList = queryList("selGcbb5_2",xmbb);
		List<Gcbb5> sjList = queryList("selGcbb5_3",xmbb);
		for (Gcbb5 gj : queryList) {
			if(gj.getYhlc()!=null){
				double sumyhlc=0;
				//总里程
				String[] yhlc = gj.getYhlc().split(",");
				String[] yjsdj=null;
				if(gj.getYjsdj()!=null)
					yjsdj = gj.getYjsdj().split(",");
				for(int i=0;i<yhlc.length;i++){
					sumyhlc=sumyhlc+new Double(yhlc[i]).doubleValue();
					if(gj.getYjsdj()!=null){
						if(yjsdj[i].equals("1") || yjsdj[i].equals("一级") || yjsdj[i].equals("一级公路")){
							gj.setBngzl1(new Double(new Double(yhlc[i]).doubleValue()+new Double(gj.getBngzl1()).doubleValue()).toString());
						}else if(yjsdj[i].equals("2") || yjsdj[i].equals("二级") || yjsdj[i].equals("二级公路")){
							gj.setBngzl2(new Double(new Double(yhlc[i]).doubleValue()+new Double(gj.getBngzl2()).doubleValue()).toString());
						}else if(yjsdj[i].equals("3") || yjsdj[i].equals("三级") || yjsdj[i].equals("三级公路")){
							gj.setBngzl3(new Double(new Double(yhlc[i]).doubleValue()+new Double(gj.getBngzl3()).doubleValue()).toString());
						}else if(yjsdj[i].equals("4") || yjsdj[i].equals("四级") || yjsdj[i].equals("四级公路")){
							gj.setBngzl4(new Double(new Double(yhlc[i]).doubleValue()+new Double(gj.getBngzl4()).doubleValue()).toString());
						}
					}
				}
				gj.setYhlc(new Double(sumyhlc).toString());
			}
		}
		for (Gcbb5 sh : shList) {
			if(sh.getYhlc()!=null){
				//计算总里程
				double sumyhlc=0;
				String[] yhlc = sh.getYhlc().split(",");
				String[] yjsdj = sh.getYjsdj().split(",");
				for(int i=0;i<yhlc.length;i++){
					sumyhlc=sumyhlc+new Double(yhlc[i]).doubleValue();
					if(yjsdj[i].equals("1") || yjsdj[i].equals("一级") || yjsdj[i].equals("一级公路")){
						sh.setBngzl1(new Double(new Double(yhlc[i]).doubleValue()+new Double(sh.getBngzl1()).doubleValue()).toString());
					}else if(yjsdj[i].equals("2") || yjsdj[i].equals("二级") || yjsdj[i].equals("二级公路")){
						sh.setBngzl2(new Double(new Double(yhlc[i]).doubleValue()+new Double(sh.getBngzl2()).doubleValue()).toString());
					}else if(yjsdj[i].equals("3") || yjsdj[i].equals("三级") || yjsdj[i].equals("三级公路")){
						sh.setBngzl3(new Double(new Double(yhlc[i]).doubleValue()+new Double(sh.getBngzl3()).doubleValue()).toString());
					}else if(yjsdj[i].equals("4") || yjsdj[i].equals("四级") || yjsdj[i].equals("四级公路")){
						sh.setBngzl4(new Double(new Double(yhlc[i]).doubleValue()+new Double(sh.getBngzl4()).doubleValue()).toString());
					}
				}
				sh.setYhlc(new Double(sumyhlc).toString());
			}
		}
		for (Gcbb5 sj : sjList) {
			//计算总里程
			double sumyhlc=0;
			String[] yhlc = sj.getYhlc().split(",");
			String[] yjsdj = sj.getYjsdj().split(",");
			for(int i=0;i<yhlc.length;i++){
				sumyhlc=sumyhlc+new Double(yhlc[i]).doubleValue();
				if(yjsdj[i].equals("1") || yjsdj[i].equals("一级") || yjsdj[i].equals("一级公路")){
					sj.setBngzl1(new Double(new Double(yhlc[i]).doubleValue()+new Double(sj.getBngzl1()).doubleValue()).toString());
				}else if(yjsdj[i].equals("2") || yjsdj[i].equals("二级") || yjsdj[i].equals("二级公路")){
					sj.setBngzl2(new Double(new Double(yhlc[i]).doubleValue()+new Double(sj.getBngzl2()).doubleValue()).toString());
				}else if(yjsdj[i].equals("3") || yjsdj[i].equals("三级") || yjsdj[i].equals("三级公路")){
					sj.setBngzl3(new Double(new Double(yhlc[i]).doubleValue()+new Double(sj.getBngzl3()).doubleValue()).toString());
				}else if(yjsdj[i].equals("4") || yjsdj[i].equals("四级") || yjsdj[i].equals("四级公路")){
					sj.setBngzl4(new Double(new Double(yhlc[i]).doubleValue()+new Double(sj.getBngzl4()).doubleValue()).toString());
				}
			}
			sj.setYhlc(new Double(sumyhlc).toString());
		}
		result.addAll(queryList);
		result.addAll(shList);
		result.addAll(sjList);
		return result;
	}
}
