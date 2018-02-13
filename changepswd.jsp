<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<%@ page import = "java.sql.*"%>
	<%@ page import = "java.util.Random"%>
	<% 
	String curpw = request.getParameter("curpswd");
    String newpw = request.getParameter("newpswd");
    String connewpw = request.getParameter("connewpswd");
    int flag=0;
    
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root", "1797YOLO2496");
	
	    Statement stmt = con.createStatement();
		if(curpw.equals("") || newpw.equals("") || connewpw.equals("") || curpw == null || newpw == null || connewpw == null){
			
			%><script>window.alert("Fill in all the fields")</script><%;
			response.sendRedirect("../JSP/users.jsp#id01");
			
		}
		String uname = session.getAttribute("username").toString();
		String q1="select password from user where username='"+uname+"'";
		ResultSet rs1 = stmt.executeQuery(q1);
		rs1.next();
		String pswd=rs1.getString(1);
		System.out.println(pswd);
		if( curpw.equals(pswd) && newpw.equals(connewpw))
		{
			Statement st2=con.createStatement();
			String q2 = "update user set password='"+newpw+"' where username = '"+uname+"'";
			flag=st2.executeUpdate(q2);
			System.out.println(flag);
			if(flag>0)
			{
				System.out.println("Password Successfully Changed");
				response.sendRedirect("../JSP/users.jsp");
			}
		}
		else
		{
			%><script>window.alert("Fill in all the fields")</script><%
			response.sendRedirect("../JSP/users.jsp#id01");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch(ClassNotFoundException e1) {
		
		e1.printStackTrace();
	}
		
		%>
</body>
</html>