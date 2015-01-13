package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;

public interface JckzhfzServer {
	boolean insertZhfz(Jckzhfz zhfz);
	List<Jckzhfz> selectZhfzList(Jckzhfz zhfz);
	int selectZhfzCount(Jckzhfz zhfz);
	Jckzhfz selectZhfzById(Jckzhfz zhfz);
	boolean updateZhfzById(Jckzhfz zhfz);
	List<Jckzhfz> selectGpsroad(Jckzhfz zhfz);
	List<Jckzhfz> JckzhfzRoad(Jckzhfz zhfz);
	boolean deleteZhfzById(String delstr);
	boolean xgJckZhfzShzt(Jckzhfz zhfz);
	boolean xgJckZhfzSbzt(String delstr);
}
