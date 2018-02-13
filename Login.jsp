<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%@ page import = "java.sql.*"%>
	<%@ page import = "java.util.Random"%>
	<% 
	String email = request.getParameter("EmailLogin");
    String password = request.getParameter("PasswordLogin"); 
    
    
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root", "1797YOLO2496");
	
	    Statement stmt = con.createStatement();
		if(request.getParameter("EmailLogin") == "" || request.getParameter("PasswordLogin") == "" || request.getParameter("EmailLogin") == null || request.getParameter("PasswordLogin") == null){
			
			%><script>window.alert("Fill in all the fields")</script><%;
			response.sendRedirect("../JSP/index.jsp");
			
		}
			
	    String query = "SELECT * FROM user WHERE email = '"+email+"';";
	    String query2 = "SELECT password FROM user WHERE email = '"+email+"';";
	    String query3 = "SELECT username FROM user WHERE email = '"+email+"';";
	    
	    ResultSet rs3 = stmt.executeQuery(query3);
		rs3.next();
		String uname = rs3.getString(1);
		
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()){
			
			ResultSet rs2 = stmt.executeQuery(query2);
			rs2.next();
			String pass = rs2.getString(1);
			if(pass.equals(password)){
				System.out.println("Welcome!");
				
				session.setAttribute("username", uname);
				System.out.println(session.getAttribute("username"));
				response.sendRedirect("../JSP/browse.jsp");
				
			}
			else{
				System.out.println("Incorrect password! Please try again");
				response.sendRedirect("index.jsp");
			}
			
			
		}
	
		
		else{
			System.out.println("Unregistered email id!");
			System.out.println("Please try again");
			response.sendRedirect("../html/Register.html");
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