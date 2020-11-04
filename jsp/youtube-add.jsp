<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
 <head>
  <meta charset="UTF-8" />
  <meta name="generator" content="editplus" />
  <meta name="author" content="" />
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <title> new document </title>
 </head>

 <body>
 <%
  request.setCharacterEncoding("UTF-8");
  String video_title = request.getParameter("video_title");
  String source_code = request.getParameter("source_code");
  String db = "fly"; String uid = "root"; String pass = "root";
  String sql = "insert into fly values(?,?,sysdate());";
  try{
	  if(video_title!="" && source_code!=""){ 
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/"+db+"?serverTimezone=Asia/Seoul", uid, pass);
		  PreparedStatement pre = conn.prepareStatement(sql);
		  pre.setString(1,video_title); pre.setString(2,source_code);
		  pre.executeUpdate();
	  }
	  response.sendRedirect("../index.jsp");
  } catch(Exception e){
	response.sendRedirect("../index.jsp?error=1");
	out.print("Error<p>" + e.getMessage());
}%>
 </body>
</html>
