package com.hdsx.jxzhpt.lwxm.xmsck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface SckzhfzServer {
		boolean insertSckzhfz(Sckzhfz zhfz);
		List<Sckzhfz> selectSckzhfz(Sckzhfz zhfz);
		int selectZhfzCount(Sckzhfz zhfz);
		boolean deleteSckZhfz(String delstr);
		boolean updateSckZhfz(Sckzhfz zhfz);
		Sckzhfz selectSckzhfzById(Sckzhfz zhfz);
		boolean xgSckZhfzSbzt(String delstr,Sckzhfz zhfz);
		boolean xgSckZhfzTH(String delstr);
		List<Sckzhfz> selectSckShzhfz(Sckzhfz zhfz);
		int selectZhfzShCount(Sckzhfz zhfz);
		boolean xgSckZhfzShzt(String delstr,Sckzhfz zhfz);
		boolean bzZhfz(Sckzhfz zhfz);
		List<SjbbMessage> exportExcel_zhfz_scsh(Sckzhfz zhfz);
		List<SjbbMessage> exportExcel_zhfz_scgl(Sckzhfz zhfz);
		List<SjbbMessage> insertToSheet(Map map);
		boolean importZhfz_sc(List<Map<String,String>> list,String tbbmbm,String sbthcd);
		boolean lrjhSckzhfz(String delstr,String nf);
		boolean xglrjhSckzhfz(String delstr);
		String yanZhen(List<Map<String, String>> data, String tbbmbm,String tbbmbm2, String sbthcd1);
		boolean onceSckZhfz(Sckzhfz zhfz);
		Sckzhfz selSckZhfzCount(Sckzhfz zhfz);
		Sckzhfz selSckZhfzShCount(Sckzhfz zhfz);
		List<Sckzhfz> lrjhZhfz(Sckzhfz zhfz);
		int lrjhZhfzCount(Sckzhfz zhfz);
}
