package cn.ljh.newsssm.web;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.ljh.newsssm.entity.Comment;
import cn.ljh.newsssm.service.CommentSvc;
import cn.ljh.newsssm.utils.BaseUtil;

@Controller
@RequestMapping("/comment")
public class CommentAct {
	@Autowired
	private CommentSvc commentSvc;
	private String jsonResult;
	private HashMap<String, Object> jsonobj = new HashMap<String, Object>();
	
	@RequestMapping(value = "/addComment", method = RequestMethod.POST)
	public void addComment(int id,Comment comment, HttpServletResponse response) {
		jsonobj.clear();
		try {
			comment.setNid(id);
			comment.setTime(new Date());
			commentSvc.add(comment);
			jsonobj.put("ok", true);
		} catch (Exception e) {
			e.printStackTrace();
			jsonobj.put("ok", false);
		}
		jsonResult = BaseUtil.toJson(jsonobj);
		BaseUtil.outPrint(response, jsonResult);
	}
	
	@RequestMapping(value = "/listComment", method = RequestMethod.POST)
	public void listNews(int id,int page, int rows,HttpServletResponse response) {
		List<Comment> list = commentSvc.get(id,page,rows);
		jsonobj.clear();
		jsonobj.put("total", list.size());
		jsonobj.put("rows", list);
		jsonResult = BaseUtil.toJson(jsonobj);

		BaseUtil.outPrint(response, jsonResult);
	}
	
	@RequestMapping(value = "/getCount", method = RequestMethod.POST)
	public void getCount(int id,HttpServletResponse response) {
		int c = 0;
		try {
			c = commentSvc.getCommentCount(id);
		} catch (Exception e) {
			e.printStackTrace();
			c = 0;
		}
		jsonobj.clear();
		jsonobj.put("newscount", c);
		jsonResult = BaseUtil.toJson(jsonobj);

		BaseUtil.outPrint(response, jsonResult);
	}
}
