package cn.ljh.newsssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ljh.newsssm.entity.Cmenu;

public interface CmenuDao {
	public List<Cmenu> list2(@Param("id") int pid);

}
