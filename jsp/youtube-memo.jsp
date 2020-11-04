<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<head>
<meta charset="UTF-8" />
<meta name="generator" content="editplus" />
<meta name="author" content="" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<title> new document </title>
<link rel="stylesheet" href="../css/FLY.css?ver=3">
<script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
	a {text-decoration:none;}
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
	function start(){
		$(".banner2").animate({height:"700px"}, 800).animate({height:"200px"}, 800, function(){
				if(bool == false){setTimeout(function(){
					start();}),0}	
			});
	}
  </script>
</head>
<body>

<div align="center">
  <a href="../index.jsp">
  	<div class="logo">
		FLY
	</div>
  </a>
	<div class="logo-bottom-frame">
		<div class="logo-bottom">
			Free&nbsp;Lecture&nbsp;on&nbsp;Youtube<p>
		</div>
	</div>
	<p>
<%!
   public String checkBanChar(String input){
      input = input.replaceAll("/"," X ");
      input = input.replaceAll(":"," X ");
      input = input.replaceAll("\\*"," X ");
      input = input.replaceAll("\\\\"," X ");
      input = input.replaceAll("[?]"," X ");
      input = input.replaceAll("\\\""," X ");
      input = input.replaceAll("<"," X ");
      input = input.replaceAll(">"," X ");
      input = input.replaceAll("\\|"," X ");
      return input;
   }
%>
<%
   request.setCharacterEncoding("UTF-8");
   String title = request.getParameter("title");
   out.print("<div class='title'>"+title+"</div><br>");
   String db = "fly"; String uid = "root"; String pass = "root";
   String sql = "select * from fly where title = ?";
   Class.forName("com.mysql.jdbc.Driver");
   Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/"+db+"?serverTimezone=Asia/Seoul", uid, pass);
   PreparedStatement pre = conn.prepareStatement(sql);
   pre.setString(1,title);
   ResultSet rs = pre.executeQuery();
   rs.next();
   out.print(rs.getString("iframe"));

   String fileName = title + ".txt"; //생성할 파일명
    String filePath = "C:/Users/Daeun/AppData/Roaming/EditPlus/assignment2/txt/"; //파일 생성할 전체 경로
    fileName = checkBanChar(fileName); //파일명에 불가능한 문자 처리
%>
&nbsp;&nbsp;
<form method="post" id="form_textarea" action="save-txt.jsp?title=<%=title%>&fileName=<%=fileName%>">

<textarea name="contents" rows="17px" cols="50px" style="font-size: 1.2em; font-family: 'Times New Roman', sans-serif;"><%
    //파일이 없으면 생성
    File fPath = new File(filePath); //경로 생성
    if(!fPath.exists()){
       fPath.mkdirs(); //상위 디렉토리가 존재하지 않으면 상위 디렉토리 생성
    }
    filePath += fileName; //생성할 파일명을 전체경로에 결합
    File f = new File(filePath); //파일객체생성
    f.createNewFile(); //파일 생성
    //파일이 있으면 읽고 불러오기
    FileReader fr = new FileReader(filePath); //파일읽기객체생성
    BufferedReader br = new BufferedReader(fr); //버퍼리더객체생성

    String line = null;
    while((line=br.readLine())!=null){ //라인단위읽기
       out.println(line);
    }
%></textarea>
   <p>
   <input type="submit" value="저장" style="color:salmon; background:white; border-radius:0.5em; font-size:1.3em; font-family:'Times New Roman', sans-serif;">
</form>
<p><br>
<button style="color:salmon; background:white; border-radius:0.5em; font-size:1.3em; font-family:'Times New Roman', sans-serif;" onclick="location.href='../index.jsp'">Menu</button>
</div>
<img onclick="f1()" class="banner2" src="../resource/star.gif">
</body>
</html>