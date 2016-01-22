package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Zdycx;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Zdycxqb;
import com.hdsx.jxzhpt.lwxm.xmjck.server.ZdycxServer;
import com.hdsx.jxzhpt.utile.SjbbMessage;
@Service
public class ZdycxServerImpl extends BaseOperate implements ZdycxServer {
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
	private String xmlx;
	public ZdycxServerImpl() {
		super("zdycx", "jdbc");
	}
	@Override
	public List<T> selZdyList(Zdycx zdycx) {
		xmlx=zdycx.getXmlx();
		if("wqgz".equals(xmlx)) return queryList("selZdyWqgz", zdycx);
		else if("abgc".equals(xmlx)) return queryList("selZdyAbgc", zdycx);
		else if("zhfz".equals(xmlx)) return queryList("selZdyZhfz", zdycx);
		else if("bhsd".equals(xmlx)) return queryList("selZdyBhsd", zdycx);
		else if("lmsj".equals(xmlx)) return queryList("selZdyLmsj", zdycx);
		else if("lmgj".equals(xmlx)) return queryList("selZdyLmgj", zdycx);
		else if("yhdzx".equals(xmlx)) return queryList("selZdyYhdzx", zdycx);
		else if("shxm".equals(xmlx)) return queryList("selZdyShxm", zdycx);
		else  return queryList("selZdyHsly", zdycx);
	}
	@Override
	public int selZdyCount(Zdycx zdycx) {
		if("wqgz".equals(xmlx)) return queryOne("selZdyWqgzCount", zdycx);
		else if("abgc".equals(xmlx)) return queryOne("selZdyAbgcCount", zdycx);
		else if("zhfz".equals(xmlx)) return queryOne("selZdyZhfzCount", zdycx);
		else if("bhsd".equals(xmlx)) return queryOne("selZdyBhsdCount", zdycx);
		else if("lmsj".equals(xmlx)) return queryOne("selZdyLmsjCount", zdycx);
		else if("lmgj".equals(xmlx)) return queryOne("selZdyLmgjCount", zdycx);
		else if("yhdzx".equals(xmlx)) return queryOne("selZdyYhdzxCount", zdycx);
		else if("shxm".equals(xmlx)) return queryOne("selZdyShxmCount", zdycx);
		else return queryOne("selZdyHslyCount", zdycx);
	}
	@Override
	public List<SjbbMessage> exportExcel_zdy(Zdycx zdycx) {
		if("wqgz".equals(xmlx)) {
			zdycx.getJsdj().replaceAll("lxjsdj", "jsdj");
			return queryList("selZdyWqgzList", zdycx);
		}
		else if("abgc".equals(xmlx)) return queryList("selZdyAbgcList", zdycx);
		else if("zhfz".equals(xmlx)) return queryList("selZdyZhfzList", zdycx);
		else if("lmsj".equals(xmlx)) return queryList("selZdyLmsjList", zdycx);
		else if("lmgj".equals(xmlx)) return queryList("selZdyLmgjList", zdycx);
		else if("yhdzx".equals(xmlx)) return queryList("selZdyYhdzxList", zdycx);
		else if("shxm".equals(xmlx)) return queryList("selZdyShxmList", zdycx);
		else return new ArrayList<SjbbMessage>();
		//else return queryList("selZdyHslyList", zdycx);
	}
	@Override
	public List<Gcglwqgz> selwqgzsjZdy(Zdycx zdycx) {
		return queryList("selwqgzsjZdy",zdycx);
	}
	@Override
	public int selwqgzsjZdyCount(Zdycx zdycx) {
		return queryOne("selwqgzsjZdyCount", zdycx);
	}
	@Override
	public List<SjbbMessage> exportExcel_wqsjzdy(Zdycx zdycx) {
		return queryList("exportExcel_wqsjzdy",zdycx);
	}
	@Override
	public List<Zdycxqb> selqbZdy(Zdycx zdycx) {
		return queryList("selqbZdy",zdycx);
	}
	@Override
	public int selqbZdyCount(Zdycx zdycx) {
		return queryOne("selqbZdyCount", zdycx);
	}
	@Override
	public List<SjbbMessage> exportExcel_qbzdy(Zdycx zdycx) {
		return queryList("exportExcel_qbzdy",zdycx);
	}
}
