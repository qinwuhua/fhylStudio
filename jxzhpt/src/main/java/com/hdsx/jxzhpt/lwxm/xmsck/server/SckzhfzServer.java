package com.hdsx.jxzhpt.lwxm.xmsck.server;

import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;

public interface SckzhfzServer {
		boolean insertSckzhfz(Sckzhfz zhfz);
		List<Sckzhfz> selectSckzhfz(Sckzhfz zhfz);
		int selectZhfzCount(Sckzhfz zhfz);
		boolean deleteSckZhfz(String delstr);
		boolean updateSckZhfz(Sckzhfz zhfz);
		Sckzhfz selectSckzhfzById(Sckzhfz zhfz);
		boolean xgSckZhfzSbzt(String delstr);
		List<Sckzhfz> selectSckShzhfz(Sckzhfz zhfz);
		int selectZhfzShCount(Sckzhfz zhfz);
		boolean xgSckZhfzShzt(Sckzhfz zhfz);
}
