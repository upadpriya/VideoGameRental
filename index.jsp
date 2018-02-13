<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>DBMS Project</title>

    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">

    <!-- Custom styles for this template -->
    <link href="../css/styleindex.css" rel="stylesheet">


    <style>
		html,body,h1,h2,h3,h4,h5 {font-family: 'Roboto', sans-serif;}
	</style>


  </head>
  <body>
  
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
        <a class="navbar-brand" href="#">DBMS Project</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="users.jsp">Profile</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="browse.jsp">Browse</a>
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

    <main role="main">

      <div id="myCarousel" class="carousel slide" data-ride="carousel" data-pause="hover">
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img class="first-slide" src="../images/slide3.jpeg" alt="First slide">
            <div class="container">
              <div class="carousel-caption text-left">
                <h1>Join Now</h1>
                <p>Sign up today to play your favorite games. What are you waiting for?</p>
                <p><a class="btn btn-lg btn-primary" href="../JSP/Register.jsp" role="button">Sign up today</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="second-slide" src="../images/gamer2.jpg" alt="Second slide">
            <div class="container">
              <div class="carousel-caption">
                <h1>How it works</h1>
                <p>We offer the best games to you and you rent them instead of buying them. This makes gaming a whole lot cheaper.</p>
                <p><a class="btn btn-lg btn-outline-secondary" href="index.jsp#howitworks" role="button" style="color: #f7f7f7;">Learn more</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img class="third-slide" src="../images/gaming.jpg" alt="Third slide">
            <div class="container">
              <div class="carousel-caption text-right">
                <h1>Explore</h1>
                <p>Search for the game you want from our vast collection.</p>
                <p><a class="btn btn-lg btn-primary" href="browse.jsp" role="button">Browse gallery</a></p>
              </div>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>


      <!-- Marketing messaging and featurettes
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->

      <div class="container marketing" id="howitworks">

        <!-- START THE FEATURETTES -->

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">Sign up Now! <span class="text-muted">Create an account to start playing</span></h2>
            <p class="lead">The first thing you need to do is create an account. You need an account to access and play our games</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="../images/gamer.jpg" alt="Generic placeholder image" height=500px width=500px>
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7 order-md-2">
            <h2 class="featurette-heading">Search for your favorite games. <span class="text-muted">Select and click on Rent</span></h2>
            <p class="lead">Search for the games you want using our Search tool. Choose the game you want and Click on Rent to add it to your collection</p>
          </div>
          <div class="col-md-5 order-md-1">
            <img class="featurette-image img-fluid mx-auto" src="../images/gamecoll.jpg" alt="Generic placeholder image" height=500px width=500px>
          </div>
        </div>

        <hr class="featurette-divider">

        <div class="row featurette">
          <div class="col-md-7">
            <h2 class="featurette-heading">Enjoy your Game. <span class="text-muted">Return when you finish it.</span></h2>
            <p class="lead">Play your game till your heart's content. There's no time limit. Return when you want to by clicking the return button. Select another game and start playing again.</p>
          </div>
          <div class="col-md-5">
            <img class="featurette-image img-fluid mx-auto" src="../images/slide2.jpg" alt="Generic placeholder image" height=500px width=500px>
          </div>
        </div>

        <hr class="featurette-divider">

        <!-- /END THE FEATURETTES -->

      </div><!-- /.container -->


      <!-- FOOTER -->
      <footer class="container">
        <p class="float-right"><a href="#">Back to top</a></p>
        <p>&copy; 2017 Company, Inc.</p>
      </footer>

    </main>


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../../../assets/js/vendor/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../../../assets/js/vendor/holder.min.js"></script>
  </body>
</html>