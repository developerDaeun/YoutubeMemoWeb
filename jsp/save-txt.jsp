<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<html>
<head>
</head>
<body>

<%
try {
   request.setCharacterEncoding("UTF-8");
   String fileName = request.getParameter("fileName");
   out.println("fileName = " + fileName + "<br>");
   String contents = (String)request.getParameter("contents");
   out.println("contents = " + contents + "<br>");
   String filePath = "C:/Users/Daeun/AppData/Roaming/EditPlus/assignment2/txt/"+fileName;
   out.println("filePath = " + filePath + "<br>");
   StringWriter str = new StringWriter();
   PrintWriter pw = new PrintWriter(str);
   pw.printf(contents);
   StringReader strReader = new StringReader(str.toString());
   FileWriter file = new FileWriter(filePath,false);
   file.append(str.toString());
   file.close();
   out.println("저장 성공");

} catch (Exception e) {
    e.getStackTrace();
}
%>
<jsp:forward page="youtube-memo.jsp?title=<%=title%>"></jsp:forward>
</body>
</html>