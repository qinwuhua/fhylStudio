package com.hdsx.jxzhpt.gcgl.server.impl;




import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.server.GcglxmjdServer;

@Service
public class GcglxmjdServerImpl extends BaseOperate implements GcglxmjdServer {

	public GcglxmjdServerImpl() {
		super("gcglxmjd", "jdbc");
	}

	

}
