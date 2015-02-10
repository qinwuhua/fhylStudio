package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface GcglaqybServer {

	Boolean insertAqybb(Gcglaqyb gcglaqyb);

	int selectaqyblistCount(Gcglaqyb gcglaqyb);

	List<Gcglaqyb> selectaqyblist(Gcglaqyb gcglaqyb);

	List<TreeNode> selAllBm3(String yhdw);

	boolean uploadAqybFile(Gcglaqyb gcglaqyb);

	Gcglaqyb selectAqybById(Gcglaqyb gcglaqyb);

	Boolean insertAqybb1(Gcglaqyb gcglaqyb);

	boolean uploadAqybFile1(Gcglaqyb gcglaqyb);

	boolean deleteAqybb(Gcglaqyb gcglaqyb);

	boolean uploadMbglFile(Gcglaqyb gcglaqyb);

	boolean uploadMbglFile1(Gcglaqyb gcglaqyb);

	Boolean insertMbgl(Gcglaqyb gcglaqyb);

	Boolean insertMbgl1(Gcglaqyb gcglaqyb);

	int selectmbgllistCount(Gcglaqyb gcglaqyb);

	List<Gcglaqyb> selectmbgllist(Gcglaqyb gcglaqyb);

	Gcglaqyb selectMbglById(Gcglaqyb gcglaqyb);

	boolean deleteMbgl(Gcglaqyb gcglaqyb);

}
