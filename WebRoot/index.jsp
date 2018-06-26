<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE html>

<html>
<head>
<title>登录界面</title>
    <script>var base="<%=basePath%>";</script>
	<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/css/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>include/css/themes/icon.css">
	<link rel="shortcut icon" type="text/css" href="<%=basePath%>include/img/timg.png">
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/easyui-lang-zh_CN.js"></script>
	<link href="<%=basePath%>include/css/default.css" rel="stylesheet" type="text/css" />
	<!--必要样式-->
	<link href="<%=basePath%>include/css/styles.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>include/css/demo.css" rel="stylesheet" type="text/css" />
	<link href="<%=basePath%>include/css/loaders.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="<%=basePath%>include/js/login.js"></script>
	<script type="text/javascript" src="<%=basePath%>include/js/stopExecutionOnTimeout.js"></script>
	<script src="<%=basePath%>include/layui/layui.js" type="text/javascript"></script>
	<script src="<%=basePath%>include/js/Particleground.js" type="text/javascript"></script>
	<script src="<%=basePath%>include/js/jquery.mockjax.js" type="text/javascript"></script>
</head>
<body>
	<div style="position:fixed;z-index:1000;top:0;float:right;padding‐right:20px;">
		  <a id="a" href="#" style="margin‐right:15px;">登录</a>  
		  <a id="b" href="#">新闻</a> 
	</div>
	 
	<div id="lnews" class="l-wrap">
		<div class="l-news">
			<div class="nheader">
				<table>
					<tbody>
						<tr>
							<td><h2>通知新闻：</h2></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="nlist" style="text-align:left;" >
				<table id="newstable">
					<tbody>
						<tr id="trpp">
							<td colspan="2"></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="pp" style="background:blue;"></div>
		</div>
	</div>
	   
	<div class='login' id="llogin">
		<div class='login_title'>
			<span>新闻发布</span>
		</div>
		<div class='login_fields'>
			<form id="login_form" onsubmit="return false">

				<div class='login_fields__user'>
					<div class='icon'>
						<img alt="" src='include/img/user_icon_copy.png'>
					</div>
					<input type="text" class="text" id="uid" name="uid"
						placeholder="用户名" value="">
					<div class='validation'>
						<img alt="" src='include/img/tick.png'>
					</div>
				</div>
				<div class='login_fields__password'>
					<div class='icon'>
						<img alt="" src='include/img/lock_icon_copy.png'>
					</div>
					<input type="password" id="pwd" name="pwd" placeholder="密码">
					<div class='validation'>
					</div>
				</div>

				<div class="login_fields__submit">
					<input type="submit" id="login_submit" value="登录">
				</div>
			</form>
		</div>
	</div>
	
	<script>
		$('body').particleground({
			dotColor : '#E8DFE8',
			lineColor : '#133b88'
		});
	</script>
</body>
<style type="text/css">
.l-wrap {
  width:800px;
  height: 800px;
  position: fixed;
  left: 0;
  right: 0;
  margin: auto;
  top: 0;
  bottom: 0;
}
.l-news .
.l-wrap div{
    min-height: 10px;
}
.l-news {
    line-height: 26px;
    margin-bottom: 14px;
}
.l-news .nheader h3 {
    color: #fff;
    margin: 0;
    padding: 0;
    border-width: 0;
    list-style: none;
}
.l-news .nheader {
    background: #a00;
    border-bottom: solid 2px #555;
    line-height: 24px;
    height: 24px;
    padding: 3px 10px 3px 20px;
    background: #eee;
    border-bottom: solid 2px #c00;
    border-top-left-radius: 14px;
    border-top-right-radius: 14px;
}
.l-news .nheader h2 {
    font-size: 14px;
    color: #c00;
    margin: 0;
    padding: 0;
    border-width: 0;
    list-style: none;    
}    
.l-news .nlist{background-color: rgba(204, 255, 0, 0); }

</style>

</html>

