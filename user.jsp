<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<title>UserName</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="../css/account.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: 'Roboto', sans-serif}
</style>
<body class="w3-light-grey">
<%@ page import = "java.sql.*"%>
	<%@ page import = "java.util.Random"%>
<!-- Top container -->
<div class="w3-bar w3-top w3-black w3-large" style="z-index:4">
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">DBMS Project</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="index.jsp#howitworks">How it Works</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="browse.jsp">Browse</a>
            </li>
          </ul>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <form class="form-inline mt-2 mt-md-0">
            <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
        </div>
      </nav>
</div>

<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-black w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container w3-row">
    <div class="w3-col s4">
      <img src="../images/avatar2.png" class="w3-circle w3-margin-right" style="width:80px">
    </div>
    <div class="w3-col s8 w3-bar">
      <span>Welcome, <strong>Username</strong></span><br>
      <button onclick="document.getElementById('id02').style.display='block'" class="w3-btn w3-left-align"><i class="fa fa-user fa-fw"></i></button>
      <button onclick="document.getElementById('id01').style.display='block'" class="w3-btn w3-left-align"><i class="fa fa-cog fa-fw"></i></button>
    </div>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Dashboard</h5>
  </div>
  <div class="w3-bar-block">
    <a href="#" class="w3-bar-item w3-button w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>&nbsp; Close Menu</a>
    <a href="#" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-users fa-fw"></i>&nbsp;Overview</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-eye fa-fw"></i>&nbsp;Views</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-diamond fa-fw"></i>&nbsp;Orders</a>
    <a href="#" class="w3-bar-item w3-button w3-padding"><i class="fa fa-history fa-fw"></i>&nbsp;History</a>
    <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-block w3-left-align"><i class="fa fa-cog fa-fw"></i> Change Password</button></a><br>
    <br>
    

    <div id="id01" class="w3-modal">
      <div class="w3-modal-content w3-card-4 w3-animate-zoom w3-black" style="max-width:600px">
    
        <div class="w3-center"><br>
          <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">&times;</span>
          <img src="img_avatar4.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
        </div>

        <form class="w3-container" action="/action_page.php">
          <div class="w3-section">
            <label><b>Current Password</b></label>
            <input class="w3-input w3-border" type="password" placeholder="Enter Current Password" name="curpswd" required>
            <label><b>New Password</b></label>
            <input class="w3-input w3-border" type="password" placeholder="Enter New Password" name="newpswd" required>
            <label><b>Confirm New Password</b></label>
            <input class="w3-input w3-border" type="password" placeholder="Confirm New Password" name="connewpswd" required>
            <button class="w3-button w3-block w3-green w3-section w3-padding" type="submit">Reset Password</button>
          </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-black">
          <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
        </div>

      </div>
    </div>
  </div>
</nav>

<div id="id02" class="w3-modal">
      <div class="w3-modal-content w3-card-4 w3-animate-zoom w3-black" style="max-width:600px">
    
        <div class="w3-center"><br>
          <span onclick="document.getElementById('id02').style.display='none'" class="w3-btn w3-xlarge w3-transparent w3-display-topright" title="Close Modal">&times;</span>
        </div>

        <div class="w3-container">
          <div class="w3-section row">
            <p class="col-sm-4">Attribute</p>
            <p class="col-sm-8">Value</p>
          </div>
        </div>

        <div class="w3-container w3-border-top w3-padding-16 w3-black">
          <button onclick="document.getElementById('id02').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
        </div>

      </div>
</div>


<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;background-color: rgba(217,217,217,0.2);">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b><i class="fa fa-dashboard"></i> My Dashboard</b></h5>
  </header>

  <div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-red w3-padding-16">
        <div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>52</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Messages</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-blue w3-padding-16">
        <div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>99</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Views</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-teal w3-padding-16">
        <div class="w3-left"><i class="fa fa-share-alt w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>23</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Shares</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-orange w3-text-white w3-padding-16">
        <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
        <div class="w3-right">
          <h3>50</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Users</h4>
      </div>
    </div>
  </div>

 	<div class="col-md-4">
					<img class="topimg" src="../images/gamer.jpg" width="100%"><br>
					<img src="../images/gamer.jpg" width="100%">
				</div>
			</div>
			<!-- This is for the search result-->
			
				
				
					<!-- Repeat for number of attributes-->
					
					<%
					System.out.println("Inside user.jsp");
					
					
					try{
						
						Class.forName("com.mysql.jdbc.Driver");
						
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rental", "root", "1797YOLO2496");
					
					    Statement stmt = con.createStatement();
					
						String uname = session.getAttribute("username").toString();	
					    String query = "SELECT rentid, DORent, game_name, developer FROM rent r join inventory i on r.gameid = i.gameid WHERE DOReturn is null and uid  = (SELECT uid FROM user where username = '"+uname+"' )  ";
						
					    ResultSet rs = stmt.executeQuery(query);
						
					if(rs.next()){
						    do{	
						    	
						   					
						    	%>
						    	
			<div id="searchres" class="row w3-black w3-text-white">
				<div class="col-md-6" style="padding: 0 0 5px 0; border-right: 1px solid white;"><img src="../images/gamer.jpg" width="100%" style="float: left;"></div>
				
				<table class="col-md-6 row">
					<!-- Repeat for number of attributes-->
					<tr>
						<td class="col-sm-2">RENT_ID</td><td class=col-sm-4><%=rs.getInt(1)%></td></tr>
					<tr>	<td class="col-sm-4">DORent</td><td class="col-sm-8"><%=rs.getDate(2)%></td></tr>
					<tr>	<td class="col-sm-4">Name</td><td class="col-sm-8"><%=rs.getString(3)%></td></tr>
					<tr>	<td class="col-sm-4">Developer</td><td class="col-sm-8"><%=rs.getString(4)%></td></tr>
					
					<tr><td class="col-sm-3"></td><td class="col-sm-2"><form action="confirmReturn.jsp" method = post><button value = <%= rs.getInt(1) %> id = "renturnbtn" name = "rentID" class="w3-btn w3-display-bottomright w3-center w3-green" style="margin-right: 20px; width: 80px;" >Return</button></form><br><br>
  						
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

  <hr>

  <div class="w3-container">
    <h5>Countries</h5>
    <table class="w3-table w3-striped w3-bordered w3-border w3-black">
      <tr>
        <td>United States</td>
        <td>65%</td>
      </tr>
      <tr class="w3-text-black">
        <td>UK</td>
        <td>15.7%</td>
      </tr>
      <tr>
        <td>Russia</td>
        <td>5.6%</td>
      </tr>
      <tr class="w3-text-black">
        <td>Spain</td>
        <td>2.1%</td>
      </tr>
      <tr>
        <td>India</td>
        <td>1.9%</td>
      </tr>
      <tr class="w3-text-black">
        <td>France</td>
        <td>1.5%</td>
      </tr>
    </table><br>
    <button class="w3-button w3-black">More Countries &nbsp;<i class="fa fa-arrow-right"></i></button>
  </div>
  <hr>
  <div class="w3-container">
    <h5>Recent Activity</h5>
    <ul class="w3-ul w3-card-4 w3-white">
      <li class="w3-padding-16">
        <span class="w3-xlarge">Date 1</span><br>
      </li>
      <li class="w3-padding-16">
        <span class="w3-xlarge">Date 2</span><br>
      </li>
      <li class="w3-padding-16">
        <span class="w3-xlarge">Date 3</span><br>
      </li>
    </ul>
  </div>
  <hr>

  <div id="id03" class="w3-modal">
      <div class="w3-modal-content w3-card-4 w3-animate-zoom w3-black" style="max-width:600px">
    
        <div class="w3-center"><br>
          <span onclick="document.getElementById('id03').style.display='none'" class="w3-btn w3-xlarge w3-transparent w3-display-topright" title="Close Modal">&times;</span>
        </div>

        <form class="w3-container" action="../JSP/return.jsp">

            <div class="row">
              <div class="col-sm-6">
              <label><b>Enter Card Number</b></label>
              <input class="w3-input w3-border" type="text" placeholder="XXXX XXXX XXXX XXXX" name="cardno" required>
              </div>
              <div class="col-sm-3">
              <label><b>Enter CVV</b></label>
              <input class="w3-input w3-border" type="text" placeholder="XXX" name="cvv" required>
              </div>
              <div class="col-sm-3">
              <label><b>Expiry Date</b></label>
              <input class="w3-input w3-border" type="month" placeholder="MM/YYYY" name="expdate" value="2018-08" required>
              </div>
            </div>            
            <button class="w3-btn w3-block w3-green w3-section w3-padding" type="submit">Proceed to pay &#8377; finalPrice</button>
            </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-black">
          <button onclick="document.getElementById('id03').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
        </div>

      </div>
  </div>

  <!-- Footer -->
  <footer class="w3-container w3-padding-16 bg-dark" style="height: 60px; color: #f7f7f7;">
    <p class="float-right"><a href="#">Back to top</a></p>
        <p>&copy; 2017 Company, Inc.</p>
  </footer>

  <!-- End page content -->
</div>

<script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
    if (mySidebar.style.display === 'block') {
        mySidebar.style.display = 'none';
        overlayBg.style.display = "none";
    } else {
        mySidebar.style.display = 'block';
        overlayBg.style.display = "block";
    }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
    overlayBg.style.display = "none";
}
</script>

</body>
</html>