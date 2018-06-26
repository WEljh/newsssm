package cn.ljh.newsssm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.ljh.newsssm.entity.Comment;

public interface CommentMapper {
	public List<Comment> getAll(@Param("id1")int id,@Param("page")int page, @Param("rows")int rows);
	public void addComment(Comment comment) throws Exception;
	public Long countofComment(int id);
}

