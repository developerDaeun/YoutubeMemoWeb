<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.sql.*"%>
 <head>
  <meta charset="UTF-8" />
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <title> new document </title>
  <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
  <link rel="stylesheet" href="./css/FLY.css?ver=3">
  <style>
	a{text-decoration:none;}
  </style>
  <script>
  var bool = true;
  	function f1(){
		if(bool == true){
			bool = false;
			start();
		}
		else
			 bool = true;
	}
	function start(){ //한번 더 클릭하면 bool == true가 되므로 멈춤
		$(".banner").animate({height:"700px"}, 800).animate({height:"150px"}, 800, function(){
				if(bool == false){setTimeout(function(){
					start();}),0}	
			});
	}
  </script>
 </head>
 <body>
  <div class="center" align="center">
	  <a href="index.jsp">
		<div class="logo">
			FLY
		</div>
	  </a>

	<div class="logo-bottom-frame">
		<div class="logo-bottom">
			Free&nbsp;Lecture&nbsp;on&nbsp;Youtube<p>
		</div>
	</div>

	<p><br>
		<a href = "https://www.youtube.com/?gl=KR&hl=ko" target="_blank">
		<img src="./resource/youtube.png" width="50px" height="50px">
		</a>
	<p><br>
<form method="post" action="./jsp/youtube-add.jsp">
	<font face="Georgia" size="4.5" color="ffa7a7">Video&nbsp;&nbsp;Title&nbsp;&nbsp;&nbsp;&nbsp;</font>
		<input type="text" name="video_title"><p>
	<font face="Georgia" size="4.5" color="ffa7a7">Source Code&nbsp;&nbsp;</font>
		<input type="text" name="source_code"><p>
			<input type="submit" value="Add" id="sub">
	<p><br><br>
</form>
<form method="post" action="./jsp/youtube-delete.jsp">
<p id = "test"> </p>
<%
  request.setCharacterEncoding("UTF-8");
  String db = "fly"; String uid = "root"; String pass = "root";
  String sql = "select * from fly order by time asc;";
  String error = request.getParameter("error");

  if(error != null) {
	  out.print("<script>alert('이미 있는 영상입니다!');</script>");
	  out.print("<script>location.href='index.jsp';</script>");
  }
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/"+db+"?serverTimezone=Asia/Seoul", uid, pass);
	  PreparedStatement pre = conn.prepareStatement(sql);
	  ResultSet rs = pre.executeQuery();
	  String title;
	  while(rs.next()){
		  title = rs.getString("title");
  %> 
	  <script type="text/javascript">
           $("#test").append("<input type='checkbox' value='<%=title %>' name='title'> <a href='./jsp/youtube-memo.jsp?title=<%= title %>'><%= title %></a><p></input>");
      </script>
  <%
	  }
  }catch(Exception e){
	out.print("Error<p>" + e.getMessage());
  }
 %>
 <p><br><p><br>
	<input type="submit" value="Delete" id="sub">
 </form>
  </div>
  <img onclick="f1()" class="banner" src="./resource/ddoong.gif">
 </body>
</html>
