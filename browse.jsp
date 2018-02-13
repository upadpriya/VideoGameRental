<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Search Page</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="../css/gallery.css" rel="stylesheet">
    <style>
		html,body,h1,h2,h3,h4,h5 {font-family: 'Roboto', sans-serif;}
	</style>


</head>
<body>

		<%@ page import = "java.sql.*"%>
	<%@ page import = "java.util.Random"%>
	<script type="text/javascript">
      	 function hideLogout(){
    		 document.getElementById("Logout").style.visibility = "hidden";
    	 }
    	 function hideLogin(){
    		 document.getElementById("Login").style.visibility = "hidden";
    		 System.out.println(alert(document.getElementById("Login").style.visibility));
         }
    </script>
	
	
	    <header>
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="index.html">DBMS Project</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="users.jsp">Profile</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Browse</a>
            </li>
          </ul>
          
          <form class="form-inline mt-2 mt-md-0" action="Login.jsp">
            <input class="form-control mr-sm-2" type="email" name="EmailLogin" placeholder="Enter your e-mail" aria-label="E-mail" id="LoginEmail">
            <input class="form-control mr-sm-2" type="password" name="PasswordLogin" placeholder="Password" aria-label="Password" id="LoginPassword">
            <button class="btn btn-success my-2 my-sm-0" type="submit" id="LoginBtn">Log In</button>
            </form>
            <p id="OR" style="color: #f7f7f7; margin: 0 20px;"> OR </p>
            <button class="btn btn-primary my-2 my-sm-0" type="submit" onclick = "location.href ='../html/Register.html'" id="SignUpBtn">Sign Up</button>
            <button class="btn btn-primary my-2 my-sm-0" type="submit"  onclick = "location.href = 'logout.jsp'" id = "Logout" >Logout</button>
            
            <%
	 			if((session.getAttribute("username") == null) || (session.getAttribute("username") == "")){
		 			System.out.println("Going to hideLogout()");
			%>
			<script> document.getElementById("Logout").style.visibility = "hidden"</script>
			<% ;
	 			}
				else{
		 			System.out.println("Going to hideLogin()");
		 	%>
		 	<script>
		 	 	document.getElementById("LoginEmail").style.visibility = "hidden";
		 		document.getElementById("LoginPassword").style.visibility = "hidden";
		 		document.getElementById("LoginBtn").style.visibility = "hidden";
		 		document.getElementById("SignUpBtn").style.visibility = "hidden";
		 		document.getElementById("OR").style.visibility = "hidden";
			</script>
			<% ;
			}%>
        </div>
      </nav>
    </header>

    <main>

    	<section class="jumbotron text-center text-light">
        	<div class="container">
          		<h1 class="jumbotron-heading">Search</h1>
          		<p class="lead">Find for your favorite games using our search tool</p>
          		<form method = "get" >				  
				  <div class="form-row">
				    <div class="form-group col-md-6">
				    	<label for="inputState">Genre</label>
				      	<select id="inputState" class="form-control" name = "genre">
				        	<option selected>Choose...</option>
				        	<option>Action</option>
				        	<option>Adventure</option>
				      	</select>
				    </div>
				    <div class="form-group col-md-6">
				      	<label for="inputState">Category</label>
				      	<select id="inputState" class="form-control" name = "category">
				        	<option selected>Choose...</option>
				        	<option>FPS</option>
				        	<option>Open World</option>
				      	</select>
				    </div>
				  </div>
				  <div class="form-row">
				    <div class="form-group col-md-6">
				    	<label for="inputState">Developer</label>
				      	<select id="inputState" class="form-control" name = "developer">
				        	<option selected>Choose...</option>
				        	<option>Hi-Rez Studios</option>
				        	<option>Bethesda</option>
				        	<option>EA DICE</option>
				        	<option>Rockstar Studios</option>
				        	<option>Demiurge Studios</option>
				      	</select>
				    </div>
				    <div class="form-group col-md-6">
				      	<label for="inputState">Publisher</label>
				      	<select id="inputState" class="form-control" name = "publisher">
				        	<option selected>Choose...</option>
				        	<option>Ubisoft</option>
				        	<option>Electronic Arts</option>
				        	<option>2K Games</option>
				      	</select>
				    </div>
				  </div>
				  <button type="submit" class="btn btn-primary btn-lg col-sm-4" value="Submit">Submit</button>		  
				</form>
          		<br>
          		<p>
            	
  				<button type="reset" class="btn btn-primary btn-lg col-sm-4" value="Reset">Reset</button>
          		</p>
        	</div>
      	</section>

		<div class="container">
			<!-- This is the normal display-->
			<div class="row">
				<div class="col-md-8 container-fluid"><img src="../images/1.jpg" width="100%">
					<button onclick="document.getElementById('id02').style.display='block'" class="w3-btn w3-display-bottomright w3-center w3-green morebutton" style="margin-right: 50px; width: 80px;">More &raquo;</button></a><br><br>
    

				    <div id="id02" class="w3-modal">
						<div class="w3-modal-content w3-card-4 w3-animate-zoom w3-black" style="max-width:600px">

						<div class="w3-center"><br>
						<span onclick="document.getElementById('id02').style.display='none'" class="w3-btn w3-xlarge w3-transparent w3-display-topright" title="Close Modal">&times;</span>
						
						</div>

						<table class="row">
					<!-- Repeat for number of attributes-->
					<tr>
						<td class="col-sm-4">Name</td><td class=col-sm-8>Paladins</td></tr>
					<tr>	<td class="col-sm-4">Developer</td><td class="col-sm-8">Bethesda</td></tr>
					<tr>	<td class="col-sm-4">Genre</td><td class="col-sm-8">Action</td></tr>
					
					<tr><td class="col-sm-6"></td><td class="col-sm-4"><form action="confirm.jsp" method = post><button value = 1 id = "rentbtn" name = "gameID" class="w3-btn w3-display-bottomright w3-center w3-green" style="margin-right: 20px; width: 80px;" >Rent</button></form><br><br>
  						
   </td></tr><br><br>
					</table>

						<div class="w3-container w3-border-top w3-padding-16 w3-black">
						<button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-btn w3-red">Cancel</button>
						</div>

						</div>
					</div>
				</div>
				<div class="col-md-4">
					<img class="topimg" src="../images/2.jpg" width="100%"><br>
					<img src="../images/3.jpg" width="100%">
				</div>
			</div>
			<!-- This is for the search result-->
			
				
				
					<!-- Repeat for number of attributes-->
					
					<%
					System.out.println("Inside browse.jsp");
					String genre = request.getParameter("genre");
					System.out.println(genre);
					String category = request.getParameter("category");
					System.out.println(category);
					String developer = request.getParameter("developer");
					System.out.println(developer);
					int gameid;
					String publisher = request.getParameter("publisher");
					System.out.println(publisher);
					try{
						
						Class.forName("com.mysql.jdbc.Driver");
						
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root", "1797YOLO2496");
					
					    Statement stmt = con.createStatement();
					
						
					    String query = "SELECT * FROM inventory WHERE genre = '"+genre+"' OR category = '"+category+"' OR developer = '"+developer+"' OR Publisher = '"+publisher+"' ";
						
					    ResultSet rs = stmt.executeQuery(query);
						
					if(rs.next()){
						    do{	
						    	
						   					
						    	%>
						    	
			<div id="searchres" class="row w3-black w3-text-white container">
				<div class="col-md-6" style="padding: 0 0 5px 0; border-right: 1px solid white;"><img src="../images/<%= rs.getInt(1) %>.jpg" width="100%" style="float: left;"></div>
				
				<table class="col-md-6 row">
					<!-- Repeat for number of attributes-->
					<tr>	<td class="col-sm-2">Name</td><td class=col-sm-4><%=rs.getString(2)%></td></tr>
					<tr>	<td class="col-sm-4">Developer</td><td class="col-sm-8"><%=rs.getString(3)%></td></tr>
					<tr>	<td class="col-sm-4">Genre</td><td class="col-sm-8"><%=rs.getString(4)%></td></tr>
					
					<tr><td class="col-sm-3"></td><td class="col-sm-2"><form action="confirm.jsp" method = post><button value = <%= rs.getInt(1) %> id = "rentbtn" name = "gameID" class="w3-btn w3-display-bottomright w3-center w3-green" style="margin-right: 20px; width: 80px;" >Rent</button></form><br><br>
  						
   </td></tr><br><br>
					</table>
					<!-- Till here-->
					
    

				    
					</div>
				</div>
						    	
						    	<%
						    }while(rs.next());
						    
							 	
						    
						
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch(ClassNotFoundException e1) {
					
					e1.printStackTrace();
				}
					
					%>
					
					</div>
					
					<!-- Till here-->
					
				</div>
		</div>
	 </main>

	 <footer class="footer bg-dark">
      <div class="container">
        <p class="float-right"><a href="#">Back to top</a></p>
          <p>&copy; 2017 Company, Inc.</p>
      </div>
    </footer>
	

</body>
</html>