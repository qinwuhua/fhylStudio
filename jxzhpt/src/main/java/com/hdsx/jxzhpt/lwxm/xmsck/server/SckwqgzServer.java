package com.hdsx.jxzhpt.lwxm.xmsck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface SckwqgzServer {
		boolean insertSckwqgz(Sckwqgz wqgz);
		List<Sckwqgz> selectSckwqgz(Sckwqgz wqgz);
		int selectWqgzCount(Sckwqgz wqgz);
		boolean deleteSckWqgz(String delstr);
		boolean updateSckWqgz(Sckwqgz wqgz);
		Sckwqgz selectSckwqgzById(Sckwqgz wqgz);
		boolean xgSckWqgzSbzt(String delstr,Sckwqgz wqgz);
		boolean xgSckWqgzTH(String delstr);
		List<Sckwqgz> selectSckShwqgz(Sckwqgz wqgz);
		int selectWqgzShCount(Sckwqgz wqgz);
		boolean xgSckWqgzShzt(String delstr,Sckwqgz wqgz,String tbbmbm,String nf);
		boolean bzWqgz(Sckwqgz wqgz);
		List<Excel_list> exportExcel_wqgz_scgl(Sckwqgz wqgz);
		List<Excel_list> exportExcel_wqgz_scsh(Sckwqgz wqgz);
		List<SjbbMessage> insertToSheet(Map map);
		boolean importWqgz_sc(List<Map<String,String>> list,String tbbmbm,String sbthcd);
		boolean lrjhSckwqgz(String delstr,String nf,String jh_sbthcd);
		boolean xglrjhSckwqgz(String delstr);
		String yanZhen(List<Map<String, String>> data, String tbbmbm,String tbbmbm2, String sbthcd1);
		boolean onceSckWqgz(Sckwqgz wqgz);
		List<Sckwqgz> lrjhWqgz(Sckwqgz wqgz);
		int lrjhWqgzCount(Sckwqgz wqgz);
}
