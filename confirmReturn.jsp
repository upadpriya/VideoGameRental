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
		html,body,h1,h2,h3,h4,h5 {font-family: 'Roboto', sans-serif}
	</style>
</head>
<body>
	<%System.out.println(request.getParameter("rentID")); %>
	
 	<form class="w3-container" action="../JSP/return.jsp" id = "payment" method=post >

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
							<input class="w3-input w3-border" type="date" placeholder="YYYY-MM-DD" name="expdate" required>
							</div>
							<div>
							
							<input class="w3-input w3-border" type="hidden"  name="rentID" value="<%=request.getParameter("rentID") %>" required>
							</div>
						</div>
						
						<button class="w3-btn w3-block w3-green w3-section w3-padding" type="submit"  >Confirm Payment</button>
					
						</form>
</body>
</html>