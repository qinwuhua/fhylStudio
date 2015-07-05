package com.hdsx.jxzhpt.jhgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.server.TjfxServer;
@Service
public class TjfxServerImpl extends BaseOperate implements TjfxServer {
	public TjfxServerImpl() {
		super("tjfx", "jdbc");
	}
	private Map<String, Object> params=new HashMap<String, Object>();

	@Override
	public Map<String, Object> queryByNfAndXzqhdm(String nf,String xzqhdm) {
		Map<String, Object> result=new HashMap<String, Object>();
		params.put("nf", nf);
		params.put("xzqhdm", xzqhdm);
		System.out.println(nf+"      "+xzqhdm);
		Map<String, Object> lmgz = queryOne("queryLmgzNfByXzqhdm", params);
		if(lmgz!=null)
			result.putAll(lmgz);
		Map<String, Object> lmsj = queryOne("queryLmsjNfByXzqhdm", params);
		if(lmsj!=null)
			result.putAll(lmsj);
		Map<String, Object> xj = queryOne("queryXjNfByXzqhdm", params);
		if(xj!=null)
			result.putAll(xj);
		Map<String, Object> yh = queryOne("queryYhNfByXzqhdm", params);
		if(yh!=null)
			result.putAll(yh);
		Map<String, Object> sh = queryOne("queryShNfByXzqhdm", params);
		if(sh!=null)
			result.putAll(sh);
		Map<String, Object> ab = queryOne("queryAbgcNfByXzqhdm", params);
		if(ab!=null)
			result.putAll(ab);
		Map<String, Object> zh = queryOne("queryZhfzNfByXzqhdm", params);
		if(zh!=null)
			result.putAll(zh);
		Map<String, Object> wq = queryOne("queryWqgzNfByXzqhdm", params);
		if(wq!=null)
			result.putAll(wq);
		double ztz= new Double(result.get("LMSJZTZ")!=null ? result.get("LMSJZTZ").toString() : "0").doubleValue()+
				new Double(result.get("LMGJZTZ")!=null ? result.get("LMGJZTZ").toString() : "0").doubleValue()+
				new Double(result.get("XJZTZ")!=null ? result.get("XJZTZ").toString() : "0").doubleValue()+
				new Double(result.get("SHZTZ")!=null ? result.get("SHZTZ").toString() : "0").doubleValue()+
				new Double(result.get("YHDZXZTZ")!=null ? result.get("YHDZXZTZ").toString() : "0").doubleValue()+
				new Double(result.get("WQGZZTZ")!=null ? result.get("WQGZZTZ").toString() : "0").doubleValue()+
				new Double(result.get("ABGCZTZ")!=null ? result.get("ABGCZTZ").toString() : "0").doubleValue()+
				new Double(result.get("ZHFZZTZ")!=null ? result.get("ZHFZZTZ").toString() : "0").doubleValue();
		double cgs= new Double(result.get("LMSJCGS")!=null ? result.get("LMSJCGS").toString() : "0").doubleValue()+
				new Double(result.get("LMGJCGS")!=null ? result.get("LMGJCGS").toString() : "0").doubleValue()+
				new Double(result.get("XJCGS")!=null ? result.get("XJCGS").toString() : "0").doubleValue()+
				new Double(result.get("SHCGS")!=null ? result.get("SHCGS").toString() : "0").doubleValue()+
				new Double(result.get("YHDZXCGS")!=null ? result.get("YHDZXCGS").toString() : "0").doubleValue()+
				new Double(result.get("WQGZCGS")!=null ? result.get("WQGZCGS").toString() : "0").doubleValue()+
				new Double(result.get("ABGCCGS")!=null ? result.get("ABGCCGS").toString() : "0").doubleValue()+
				new Double(result.get("ZHFZCGS")!=null ? result.get("ZHFZCGS").toString() : "0").doubleValue();
		double stz= new Double(result.get("LMSJSTZ")!=null ? result.get("LMSJSTZ").toString() : "0").doubleValue()+
				new Double(result.get("LMGJSTZ")!=null ? result.get("LMGJSTZ").toString() : "0").doubleValue()+
				new Double(result.get("XJSTZ")!=null ? result.get("XJSTZ").toString() : "0").doubleValue()+
				new Double(result.get("SHSTZ")!=null ? result.get("SHSTZ").toString() : "0").doubleValue()+
				new Double(result.get("YHDZXSTZ")!=null ? result.get("YHDZXSTZ").toString() : "0").doubleValue()+
				new Double(result.get("WQGZSTZ")!=null ? result.get("WQGZSTZ").toString() : "0").doubleValue()+
				new Double(result.get("ABGCSTZ")!=null ? result.get("ABGCSTZ").toString() : "0").doubleValue()+
				new Double(result.get("ZHFZSTZ")!=null ? result.get("ZHFZSTZ").toString() : "0").doubleValue();
		double sl= new Double(result.get("LMSJSL")!=null ? result.get("LMSJSL").toString() : "0").doubleValue()+
				new Double(result.get("LMGJSL")!=null ? result.get("LMGJSL").toString() : "0").doubleValue()+
				new Double(result.get("XJSL")!=null ? result.get("XJSL").toString() : "0").doubleValue()+
				new Double(result.get("SHSL")!=null ? result.get("SHSL").toString() : "0").doubleValue()+
				new Double(result.get("YHDZXSL")!=null ? result.get("YHDZXSL").toString() : "0").doubleValue()+
				new Double(result.get("WQGZSL")!=null ? result.get("WQGZSL").toString() : "0").doubleValue()+
				new Double(result.get("ABGCSL")!=null ? result.get("ABGCSL").toString() : "0").doubleValue()+
				new Double(result.get("ZHFZSL")!=null ? result.get("ZHFZSL").toString() : "0").doubleValue();
		result.put("ZTZ", ztz);
		result.put("CGS", cgs);
		result.put("STZ", stz);
		result.put("SL", sl);
		result.put("XZQHDM", xzqhdm);
		return result;
	}

	@Override
	public List<Map<String, Object>> queryXzqhQsfx(String xzqhdm, String nf,String end) {
		List<Map<String, Object>> result= new ArrayList<Map<String,Object>>();
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("xzqhdm", xzqhdm);
		params.put("start", nf);
		params.put("end", end);
		result = queryList("queryXzqhQsfx", params);
		return result;
	}

	@Override
	public List<Map<String, Object>> queryXmlxtjqsfx(String xzqhdm, String nf,String end) {
		List<Map<String, Object>> result= new ArrayList<Map<String,Object>>();
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("xzqhdm", xzqhdm);
		params.put("start", nf);
		params.put("end", end);
		result = queryList("queryXmlxQsfx", params);
		return result;
	}

	@Override
	public Map<String, Object> queryGckXzqhtj(String xzqhdm, String nf) {
		params.put("nf", nf);
		params.put("xzqhdm", xzqhdm);
		return queryOne("queryGckXzqhtj",params);
	}

	@Override
	public List<Map<String, Object>> queryGckXmlxtj(String nf, String xzqhdm) {
		params.put("nf", nf);
		params.put("xzqhdm", xzqhdm);
		return queryList("queryGckXmlxtj",params);
	}

	@Override
	public List<Map<String,Object>> queryGckXmlxTjtLstz(String nf, String xzqhdm) {
		params.put("nf", nf);
		params.put("xzqhdm", xzqhdm);
		return queryList("queryGckXmlxTjtLstz",params);
	}
	
}
