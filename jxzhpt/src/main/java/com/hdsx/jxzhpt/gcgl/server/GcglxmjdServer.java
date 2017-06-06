package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.GcglXmjd;

public interface GcglxmjdServer {

	int selectYbByxmbmCount(GcglXmjd gcglxmjd);

	List<GcglXmjd> selectYbByxmbm(GcglXmjd gcglxmjd);

	GcglXmjd getbyzjdw(GcglXmjd gcglxmjd);

	boolean insertYb(GcglXmjd gcglxmjd);

	boolean updateYb(GcglXmjd gcglxmjd);

	boolean deleteYb(GcglXmjd gcglxmjd);

	boolean updateYbzt(GcglXmjd gcglxmjd);

	boolean updateYbztpl(GcglXmjd gcglxmjd);

}
