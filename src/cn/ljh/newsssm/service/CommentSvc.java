package cn.ljh.newsssm.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.ljh.newsssm.dao.CommentMapper;
import cn.ljh.newsssm.entity.Comment;

@Service
public class CommentSvc {
	@Resource
	private CommentMapper mapper;
	
	public void add(Comment comment) throws Exception{
		mapper.addComment(comment);
	}
	
	public List<Comment> get(int id,int page, int rows) {
		if (page < 1) {
			page = 1;
		}
		if (rows < 1) {
			rows = 10;
		}
		page = (page - 1) * rows;
		return mapper.getAll(id,page,rows);
	}
	
	public int getCommentCount(int id) {
		try {
			Long a = mapper.countofComment(id);
			return Integer.parseInt(a.toString());
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
