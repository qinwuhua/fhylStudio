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
		for (Gcbb5 gj : queryList) {
			String jsdd="";
			for(int i=0;i<gj.getGcgjlx().size();i++){
				jsdd+=gj.getGcgjlx().get(i).getJsdd();
				if(i!=gj.getGcgjlx().size()-1){
					jsdd+=",";
				}
				gj.setJhjsdd(jsdd);
			}
		}
		List<Gcbb5> shList = queryList("selGcbb5_2",xmbb);
		for (Gcbb5 sh : shList) {
			String jsdd="";
			for(int i=0;i<sh.getGcshlx().size();i++){
				jsdd+=sh.getGcshlx().get(i).getJsdd();
				if(i!=sh.getGcshlx().size()-1){
					jsdd+=",";
				}
				sh.setJhjsdd(jsdd);
			}
		}
		List<Gcbb5> sjList = queryList("selGcbb5_3",xmbb);
		for (Gcbb5 sj : sjList) {
			String jsdd="";
			for(int i=0;i<sj.getGcsjlx().size();i++){
				jsdd+=sj.getGcsjlx().get(i).getXzqhmc();
				if(i!=sj.getGcsjlx().size()-1){
					jsdd+=",";
				}
				sj.setJhjsdd(jsdd);
			}
		}
		result.addAll(queryList);
		result.addAll(shList);
		result.addAll(sjList);
		return result;
	}
}
