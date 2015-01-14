package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;

public interface JckwqgzServer {
	boolean insertWqgz(Jckwqgz wqgz);
	List<Jckwqgz> selectWqgzList(Jckwqgz wqgz);
	int selectWqgzCount(Jckwqgz wqgz);
	Jckwqgz selectWqgzById(Jckwqgz wqgz);
	boolean updateWqgzById(Jckwqgz wqgz);
	List<Jckwqgz> selectGpsroad(Jckwqgz wqgz);
	List<Jckwqgz> JckWqgzRoad(Jckwqgz wqgz);
	boolean deleteWqgzById(String delstr);
	boolean xgJckWqgzShzt(Jckwqgz wqgz);
	boolean xgJckWqgzSbzt(String delstr);
	List<Jckwqgz> selectJckShwqgz(Jckwqgz wqgz);
	int selectWqgzShCount(Jckwqgz wqgz);
	boolean xgJckWqgzTH(Jckwqgz wqgz);
	boolean onceWqgz(Jckwqgz wqgz);
}
