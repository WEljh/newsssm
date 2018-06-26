package cn.ljh.newsssm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ljh.newsssm.dao.CmenuDao;
import cn.ljh.newsssm.entity.Cmenu;

@Service
public class MenuSvc {
	
	@Resource
	private CmenuDao dao;
	
	public List<Cmenu> listMenu(int pid){
		return dao.list2(pid);
	}

}
