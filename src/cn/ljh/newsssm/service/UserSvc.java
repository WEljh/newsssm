package cn.ljh.newsssm.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ljh.newsssm.dao.UserDao;
import cn.ljh.newsssm.entity.User;

@Service
public class UserSvc {
	
	@Resource
	private UserDao dao;
	
	public void addUser(User user){
		dao.add(user);
	}
	
	public User findUser(String uid, String pwd){
		return dao.get2(uid, pwd);
	}
	
	public Long getCount(){
		return dao.countofUser();
	}

}
