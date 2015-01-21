package com.hdsx.jxzhpt.lwxm.xmsck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface SckwqgzServer {
		boolean insertSckwqgz(Sckwqgz wqgz);
		List<Sckwqgz> selectSckwqgz(Sckwqgz wqgz);
		int selectWqgzCount(Sckwqgz wqgz);
		boolean deleteSckWqgz(String delstr);
		boolean updateSckWqgz(Sckwqgz wqgz);
		Sckwqgz selectSckwqgzById(Sckwqgz wqgz);
		boolean xgSckWqgzSbzt(String delstr,Sckwqgz wqgz);
		boolean xgSckWqgzTH(Sckwqgz wqgz);
		List<Sckwqgz> selectSckShwqgz(Sckwqgz wqgz);
		int selectWqgzShCount(Sckwqgz wqgz);
		boolean xgSckWqgzShzt(Sckwqgz wqgz);
		boolean bzWqgz(Sckwqgz wqgz);
		List<SjbbMessage> exportExcel_wqgz_scgl(Sckwqgz wqgz);
		List<SjbbMessage> exportExcel_wqgz_scsh(Sckwqgz wqgz);
		List<SjbbMessage> insertToSheet(String xzqhdm);
		boolean importWqgz_sc(List<Map> list);
}
