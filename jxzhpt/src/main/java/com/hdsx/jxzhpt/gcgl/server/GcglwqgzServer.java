package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;

public interface GcglwqgzServer {

	Boolean insertWqgzYb(Gcglwqgz gcglwqgz);

	int selectWqgzYbByJhidCount(Gcglwqgz gcglwqgz);

	List<Gcglwqgz> selectWqgzYbByJhid(Gcglwqgz gcglwqgz);

}
