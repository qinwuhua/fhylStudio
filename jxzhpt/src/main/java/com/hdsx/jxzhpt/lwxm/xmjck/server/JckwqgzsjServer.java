package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.utile.SjbbMessage;

public interface JckwqgzsjServer {

	boolean deleteqlzpbyxmbm(Jckwqgzsj jckwqgzsj);

	boolean insertWqgz(Jckwqgzsj jckwqgzsj);

	List<Jckwqgzsj> selectWqgzList(Jckwqgzsj jckwqgzsj);

	int selectWqgzCount(Jckwqgzsj jckwqgzsj);
	
}
