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
  String[] title = request.getParameterValues("title");
  String db = "fly"; String uid = "root"; String pass = "root";
  String sql = "delete from fly where title=?;";
  try{
     if(title!=null){ 
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/"+db+"?serverTimezone=Asia/Seoul", uid, pass);
        PreparedStatement pre = conn.prepareStatement(sql);
		for(int i=0; i<title.length; i++){
			pre.setString(1,title[i]);
			pre.executeUpdate();
		}
     }
	 response.sendRedirect("../index.jsp");
  } catch(Exception e){
   out.print("Error<p>" + e.getMessage());
}%>
 </body>
</html>