package com.dopaming.www.admin.blacklist;

import java.util.List;

public interface BlackListservice {
	List<BlackListVO> getBlackList(BlackListVO vo);
	
	public int blackListCount(BlackListVO vo);
}
