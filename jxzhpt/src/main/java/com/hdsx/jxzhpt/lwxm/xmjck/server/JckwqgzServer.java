package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;

public interface JckwqgzServer {
	boolean insertWqgz(Jckwqgz wqgz);
	List<Jckwqgz> selectWqgzList();
	Jckwqgz selectWqgzById(Jckwqgz wqgz);
	boolean updateWqgzById(Jckwqgz wqgz);
	List<Jckwqgz> selectGpsroad(Jckwqgz wqgz);
	boolean deleteWqgzById(String delstr);
	boolean xgJckWqgzShzt(Jckwqgz wqgz);
}
