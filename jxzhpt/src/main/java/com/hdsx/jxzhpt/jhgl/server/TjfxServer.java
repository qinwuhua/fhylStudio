package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.bean.Lkmxb;
import com.hdsx.jxzhpt.wjxt.bean.Lktjb;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;


public interface TjfxServer {

	Map<String, Object> queryByNfAndXzqhdm(String nf,String xzqhdm);

	List<Map<String, Object>> queryXzqhQsfx(String xzqhdm, String nf, String end);

	List<Map<String, Object>> queryXmlxtjqsfx(String xzqhdm, String nf, String end);

	Map<String, Object> queryGckXzqhtj(String xzqhdm, String nf);

	List<Map<String, Object>> queryGckXmlxtj(String nf, String xzqhdm);

	List<Map<String,Object>> queryGckXmlxTjtLstz(String nf, String xzqhdm);

	Map<String, Object> queryTzebl(String nf, String xzqhdm);

	Map<String, Object> queryGckLcWcbl(String nf, String dm);

	Map<String, Object> queryGckCgsWcbl(String nf, String dm);

	Map<String, Object> queryGckTzWcbl(String nf, String dm);

	Map<String, Object> queryGckJhgcltj(String nf, String xzqhdm);

	Map<String, Object> queryJcktj(String nf, String xzqh);
	
	List<Lkmxb> queryLkpdmx(int page, int rows,Lkmxb lkmxb);
	Integer queryLkpdmxCount(Lkmxb lkmxb);
	
	List<Excel_list> exportLkpdmx(Lkmxb lkmxb);
		
	List<Lkmxb> queryLkpdmxList(Lkmxb lkmxb);
	
	List<Lkmxb> getLxldCombo(Lkmxb lkmxb);
	
	List<SjbbMessage> queryLkpdfx(Lkmxb lkmxb);
	List<SjbbMessage> queryLkbjfx(Lkmxb lkmxb);
	
	List<Lkmxb> getPdnf(Lkmxb lkmxb);
	
	List<Map<String, Object>> queryXmtoLk(String xzqhdm, String nf, String end,String xmbm);
	
	List<Map<String, Object>> queryYllv(String xzqhdm);
	
	List<Map<String, Object>> queryXmtoLk_lx(String nf, String end,String xmbm);
	
	List<TreeNode> queryLx(String lxbm);
	
	List<Xmsq> queryXmsqs(Xmsq xmsq);
	
	List<Map<String, Object>> queryKxjc_ds(String tjfl,String xmbm);
	
	List<Xmsq> queryJhshs(Xmsq xmsq);
	
	List<Map<String, Object>> queryZrsh(String tjfl,int nf);
	
	List<Map<String, Object>> queryKxjcZrsh(String tjfl,int nf,String zrshbl);
	
	Map<String, Object> queryMaxNf();
	
	List<Map<String, Object>> queryLx_kxjc(Lkmxb lkmxb);
	
	List<Map<String, Object>> queryKxjc_lx(String tjfl,String lxbm,String mqiStr,String mqi,String pqiStr,String pqi,String xzdj);
	
	List<Map<String, Object>> queryTsbl(String tjfl,int nf);
}
