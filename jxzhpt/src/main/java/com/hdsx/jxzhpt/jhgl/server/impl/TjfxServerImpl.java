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
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
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

	@Override
	public Map<String, Object> queryTzebl(String nf, String xzqhdm) {
		params.put("bn", nf);
		params.put("sn", new Integer(new Integer(nf).intValue()-1).toString());
		params.put("xzqhdm", xzqhdm);
		return queryOne("queryTzebl", params);
	}

	@Override
	public Map<String, Object> queryGckLcWcbl(String nf, String dm) {
		params.put("nf", nf);
		params.put("xzqhdm", dm);
		return queryOne("queryGckLcWcbl", params);
	}

	@Override
	public Map<String, Object> queryGckCgsWcbl(String nf, String dm) {
		params.put("nf", nf);
		params.put("xzqhdm", dm);
		return queryOne("queryGckCgsWcbl", params);
	}

	@Override
	public Map<String, Object> queryGckTzWcbl(String nf, String dm) {
		params.put("nf", nf);
		params.put("xzqhdm", dm);
		return queryOne("queryGckTzWcbl", params);
	}

	@Override
	public Map<String, Object> queryGckJhgcltj(String nf, String xzqhdm) {
		params.put("nf", nf);
		params.put("xzqhdm", xzqhdm);
		return queryOne("queryGckJhgcltj", params);
	}

	@Override
	public Map<String, Object> queryJcktj(String nf, String xzqh) {
		params.put("nf", nf);
		params.put("xzqhdm", xzqh);
		return queryOne("queryJcktj", params);
	}

	@Override
	public List<Lkmxb> queryLkpdmx(int page, int rows,Lkmxb lkmxb) {
		params.put("page", page);
		params.put("rows", rows);
		params.put("lkmxb", lkmxb);
		return queryList("queryLkpdmx",params);
	}

	@Override
	public Integer queryLkpdmxCount(Lkmxb lkmxb) {
		params.put("lkmxb", lkmxb);
		return queryOne("queryLkpdmxCount", params);
	}

	@Override
	public List<Lkmxb> queryLkpdmxList(Lkmxb lkmxb) {
		params.put("lkmxb", lkmxb);
		return queryList("queryLkpdmxList",params);
	}
	@Override
	public List<Lkmxb> getLxldCombo(Lkmxb lkmxb) {
		return queryList("getLxldCombo",lkmxb);
	}

	@Override
	public List<SjbbMessage> queryLkpdfx(Lkmxb lkmxb) {
		params.put("lkmxb", lkmxb);
		return queryList("querylkpdfx", params);
	}
	
	@Override
	public List<SjbbMessage> queryLkbjfx(Lkmxb lkmxb) {
		params.put("lkmxb", lkmxb);
		return queryList("querylkbjfx", params);
	}
	
	@Override
	public List<Lkmxb> getPdnf(Lkmxb lkmxb) {
		return queryList("getPdnf",lkmxb);
	}
	
	@Override
	public List<Map<String, Object>> queryXmtoLk(String xzqhdm, String nf,String end,String xmbm) {
		List<Map<String, Object>> result= new ArrayList<Map<String,Object>>();
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("xzqhdm", xzqhdm);
		params.put("start", nf);
		params.put("end", end);
		params.put("xmbm", xmbm);
		result = queryList("queryXmtoLk", params);
		return result;
	}

	@Override
	public List<Map<String, Object>> queryYllv(String xzqhdm) {
		List<Map<String, Object>> result= new ArrayList<Map<String,Object>>();
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("xzqhdm", xzqhdm);
		result = queryList("queryYllv", params);
		return result;
	}
	
	@Override
	public List<Map<String, Object>> queryXmtoLk_lx(String nf,String end,String xmbm) {
		List<Map<String, Object>> result= new ArrayList<Map<String,Object>>();
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("start", nf);
		params.put("end", end);
		params.put("xmbm", xmbm);
		result = queryList("queryXmtoLk_lx", params);
		return result;
	}
	
	@Override
	public List<TreeNode> queryLx(String lxbm) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("lxbm", lxbm);
		return queryList("queryLx",params);
	}
	
	@Override
	public List<Xmsq> queryXmsqs(Xmsq xmsq) {
		return queryList("queryXmsqs",xmsq);
	}
	
	@Override
	public List<Map<String, Object>> queryKxjc_ds(String tjfl,String xmbm) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("xmbm", xmbm);
		if(tjfl.equals("1")){
		  return queryList("queryKxjc_dstj",params);
		}else{
		  return queryList("queryKxjc_lxtj",params);
		}
	}

	@Override
	public List<Xmsq> queryJhshs(Xmsq xmsq) {
		return queryList("queryJhshs",xmsq);
	}

	@Override
	public List<Map<String, Object>> queryZrsh(String tjfl,int nf) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("xmnf", nf);
		if(tjfl.equals("1")){
			  return queryList("queryZrsh_ds",params);
			}else{
			  return queryList("queryZrsh_lx",params);
			}
	}

	@Override
	public Map<String, Object> queryMaxNf() {
		return queryOne("queryLkpdMaxNf", null);
	}
	
	@Override
	public List<Map<String, Object>> queryLx_kxjc(Lkmxb lkmxb) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("lxbm", lkmxb.getLxbh());
		params.put("mqi", lkmxb.getMqi());
		return queryList("queryLx_kxjc",params);
	}
	
	@Override
	public List<Map<String, Object>> queryKxjc_lx(String tjfl,String lxbm) {
		Map<String, Object> params=new HashMap<String, Object>();
		params.put("lxbm", lxbm);
		if(tjfl.equals("1")){
			  return queryList("queryLxkxjc_ds",params);
			}else{
			  return queryList("queryLxkxjc_lx",params);
			}
	}
}
