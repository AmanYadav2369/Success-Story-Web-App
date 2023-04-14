<%@ page import="java.sql.*" %>
<html>
<head>
<title>Success Story App By Aman Yadav</title>
<style>
*{font-size:60px; font-family:Arial;}
body{background-color:lightgreen;}
</style>
</head>
<body>
<center>
<h1>Success Story App</h1>
<form>
<input type="text" name="na" placeholder="enter ur name"/>
<br><br>
<input type="text" name="co" placeholder="enter company name"/>
<br><br>
<input type="number" step="any" name="pk" placeholder="enter package"/>
<br><br>
<input type="Submit" name="btn"/>
<br><br>
</from>

<%
if(request.getParameter("btn") !=null)
{
String name=request.getParameter("na");
String company=request.getParameter("co");
double pkg=Double.parseDouble(request.getParameter("pk"));

try
{
DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
String url="jdbc:mysql://localhost:3306/ss4april23";
String un="root";
String pw="abc456";
Connection con=DriverManager.getConnection(url, un, pw);
String sql="insert into student values(?,?,?)";
PreparedStatement pst=con.prepareStatement(sql);
pst.setString(1,name);
pst.setString(2,company);
pst.setDouble(3,pkg);
pst.executeUpdate();
out.println("thank u");
con.close();
}
catch(SQLException e){
out.println("issue"+e);
}
}
%>
</center>
</body>
</html>