package com.hdsx.jxzhpt.gcgl.server.impl;




import java.util.List;

import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.gcgl.bean.GcglXmjd;
import com.hdsx.jxzhpt.gcgl.server.GcglxmjdServer;

@Service
public class GcglxmjdServerImpl extends BaseOperate implements GcglxmjdServer {

	public GcglxmjdServerImpl() {
		super("gcglxmjd", "jdbc");
	}

	@Override
	public int selectYbByxmbmCount(GcglXmjd gcglxmjd) {
		return queryOne("selectYbByxmbmCount",gcglxmjd);
	}

	@Override
	public List<GcglXmjd> selectYbByxmbm(GcglXmjd gcglxmjd) {
		return queryList("selectYbByxmbm", gcglxmjd);
	}

	@Override
	public GcglXmjd getbyzjdw(GcglXmjd gcglxmjd) {
		return queryOne("getbyzjdw", gcglxmjd);
	}

	@Override
	public boolean insertYb(GcglXmjd gcglxmjd) {
		return insert("insertYb", gcglxmjd)==1;
	}

	@Override
	public boolean updateYb(GcglXmjd gcglxmjd) {
		return update("updateYb", gcglxmjd)==1;
	}

	@Override
	public boolean deleteYb(GcglXmjd gcglxmjd) {
		return delete("deleteYb", gcglxmjd)==1;
	}

	@Override
	public boolean updateYbzt(GcglXmjd gcglxmjd) {
		return update("updateYbzt", gcglxmjd)==1;
	}

	@Override
	public boolean updateYbztpl(GcglXmjd gcglxmjd) {
		update("updateYbztpl", gcglxmjd);
		return true;
	}

	

}
