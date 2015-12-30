package com.hdsx.jxzhpt.lwxm.xmsck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckbhsd;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface SckbhsdServer {
		boolean insertSckbhsd(Sckbhsd wqgz);
		List<Sckbhsd> selectSckbhsd(Sckbhsd wqgz);
		int selectWqgzCount(Sckbhsd wqgz);
		boolean deleteSckbhsd(String delstr);
		boolean updateSckbhsd(Sckbhsd wqgz);
		Sckbhsd selectSckbhsdById(Sckbhsd wqgz);
		boolean xgSckbhsdSbzt(String delstr,Sckbhsd wqgz);
		boolean xgSckbhsdTH(String delstr,Sckbhsd Sckbhsd);
		List<Sckbhsd> selectSckShwqgz(Sckbhsd wqgz);
		int selectWqgzShCount(Sckbhsd wqgz);
		boolean xgSckbhsdShzt(String delstr,Sckbhsd wqgz,String tbbmbm,String nf);
		boolean bzWqgz(Sckbhsd wqgz);
		List<SjbbMessage> exportExcel_wqgz_scgl(Sckbhsd wqgz);
		List<SjbbMessage> exportExcel_wqgz_scsh(Sckbhsd wqgz);
		List<SjbbMessage> exportExcel_wqgz_scsd(Sckbhsd wqgz);
		List<SjbbMessage> insertToSheet(Map map);
		boolean importWqgz_sc(List<Map<String,String>> list,String tbbmbm,String sbthcd);
		boolean lrjhSckbhsd(String delstr,String nf,String jh_sbthcd);
		boolean xglrjhSckbhsd(String delstr);
		String yanZhen(List<Map<String, String>> data, String tbbmbm,String tbbmbm2, String sbthcd1);
		boolean onceSckbhsd(Sckbhsd wqgz);
		List<Sckbhsd> lrjhWqgz(Sckbhsd wqgz);
		int lrjhWqgzCount(Sckbhsd wqgz);
		boolean xgSckbhsdTH1(String delstr,String unit2);
		List<Sckbhsd> selectSckSdwqgz(Sckbhsd wqgz);
		int selectWqgzSdCount(Sckbhsd wqgz);
		boolean xgSckbhsdSdzt(String delstr,Sckbhsd wqgz,String tbbmbm,String nf);
}
