<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ page import = "java.sql.*"%>
	<%@ page import = "java.util.Random"%>
	<%@ page import = "java.util.Date"%>
	<%@ page import = "java.util.Calendar"%>
	<%@ page import = "java.time.LocalDate"%>
	
	<%
	 String uname = session.getAttribute("username").toString();
	 if(uname == "" || uname == null){
		 
		 %><script>window.alert("You need to login or register ")</script><%;
		 response.sendRedirect("../html/Register.html");
		 
	 }
	 
		String cardno = request.getParameter("cardno");
		 System.out.println("cardno:" + cardno);
	    String cvv = request.getParameter("cvv");
	    System.out.println("cvv" + cvv);
	    String expdate = request.getParameter("expdate");
	    System.out.println("expdate" + expdate);
	   // int gameid = Integer.parseInt(request.getParameter("gameid"));
	   //need to retrieve gameid. 
	   LocalDate DOReturn = LocalDate.now();
	   System.out.println(DOReturn);
	   int rentid = Integer.parseInt(request.getParameter("rentID"));
	
try {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root", "1797YOLO2496");
	
	    Statement stmt = con.createStatement();
	    
		if(cardno.equals("") || cvv.equals("") || expdate.equals("") || cardno.equals(null) || cvv.equals(null) || expdate.equals(null)){
			
			
			response.sendRedirect("../JSP/users.jsp");
			
		}
	    
	    String query0 = "SELECT uid FROM user WHERE username = '"+uname+"'";
	    System.out.println("query0 executed");
	    ResultSet rs0 = stmt.executeQuery(query0);
	    rs0.next();
	    int uid = rs0.getInt(1);
	    System.out.println("uid:" + uid);
	    String query = "SELECT cardno, expiry_date, cvv FROM payment_info WHERE uid  = '"+uid+"'; ";
	    ResultSet rs = stmt.executeQuery(query);
	    
	    
	    if(rs.next()){
	    	
	       String cno = rs.getString("cardno");
	       System.out.println("cno:" + cno);
	       String expiry_date = rs.getDate("expiry_date").toString();
	       System.out.println("expiry_date:" + expiry_date);
	       int cv = rs.getInt("cvv");
	       System.out.println("cv:" + cv);
	       if(cardno.equals(cno) && expdate.equals(expiry_date) && cvv.equals( String.valueOf(cv))){
	    		String query1 = "UPDATE rent set DOReturn = '"+DOReturn+"' WHERE rentid = '"+rentid+"' ;";
	   			 int count = stmt.executeUpdate(query1);
	   			 System.out.println(count);
	   			ResultSet res=con.createStatement().executeQuery("select fee from rent where DOReturn is not null and uid  = (SELECT uid FROM user where username = '"+uname+"' )  ");
	   			res.next();
	   			System.out.println(res.getInt(1));
	   			 response.sendRedirect("../JSP/users.jsp");
	       }
	    }
}catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch(ClassNotFoundException e1) {
	
	e1.printStackTrace();
}
	
	%>
</body>
</html>