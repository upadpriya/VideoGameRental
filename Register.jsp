<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>
<body>
	<%@ page import = "java.sql.*"%>
	<%@ page import = "java.util.Random"%>
	<%
	
	String email = request.getParameter("inputEmail");
    String username = request.getParameter("inputUserID"); 
    String pword = request.getParameter("inputPassword");
    String cpword = request.getParameter("confirmPassword");
    String cno = request.getParameter("cardno");
    String cv = request.getParameter("cvv");
    String date1 = request.getParameter("expDate");
    Random rand = new Random();
    int uid = rand.nextInt(40);
    int payid = rand.nextInt(100);
   
    
       
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root", "1797YOLO2496");
	
		PreparedStatement ps;
	
		String query = "SELECT * FROM user WHERE uid = '"+uid+"' ;";
		
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(query);
		
		while(rs.next()){
			uid = rand.nextInt(40);
		    rs = stmt.executeQuery(query);
		}
		
		String query2 = "SELECT * FROM user WHERE username = '"+username+"' ";
		PreparedStatement pstmt = con.prepareStatement(query2);
		ResultSet boolCheckUsernameExist = pstmt.executeQuery();
		
		String query3 = "SELECT * FROM user WHERE email = '"+email+"'";
	    pstmt = con.prepareStatement(query2);
		ResultSet boolCheckEmailExist = pstmt.executeQuery();
		if(boolCheckUsernameExist.next()){
			
			response.sendRedirect("../JSP/index.jsp");
			System.out.println("This username is taken");
			
		}
		
		
		else if(boolCheckUsernameExist.next()){
			
			response.sendRedirect("../JSP/index.jsp");
			System.out.println("Looks like this email id is already registered. Please try to login or register with a different email");
		}
		else{
		ps = con.prepareStatement("INSERT INTO user(uid, username, password, email) VALUES ('"+uid+"', '"+username+"', '"+pword+"', '"+email+"');");
		int count = ps.executeUpdate();
		
		String query4 = "SELECT * FROM payment_info WHERE payid = '"+payid+"' ;";
		ResultSet rs2 = stmt.executeQuery(query2);
		while(rs2.next()){
			payid = rand.nextInt(100);
		    rs2 = stmt.executeQuery(query4);
		}
		
		CallableStatement cs=con.prepareCall("{call pay_info(?,?,?,?,?)}");
		cs.setInt(1,payid);
		cs.setInt(2,uid);
		cs.setString(3,cno);
		cs.setString(4,date1);
		cs.setString(5,cv);
		cs.execute();
		
		
		
		
		session.setAttribute("username", username);
		response.sendRedirect("../JSP/browse.jsp");
		}
			
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} catch(ClassNotFoundException e1) {
		
		
	}
	%>
	
	
</body>
</html>