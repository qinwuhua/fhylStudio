package com.hdsx.jxzhpt.lwxm.xmsck.server;

import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;

public interface SckwqgzServer {
		boolean insertSckwqgz(Sckwqgz wqgz);
		List<Sckwqgz> selectSckwqgz(Sckwqgz wqgz);
		int selectWqgzCount(Sckwqgz wqgz);
		boolean deleteSckWqgz(String delstr);
		boolean updateSckWqgz(Sckwqgz wqgz);
		Sckwqgz selectSckwqgzById(Sckwqgz wqgz);
		boolean xgSckWqgzSbzt(String delstr);
}
