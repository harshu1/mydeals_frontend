<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page isELIgnored = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
/* Space out content a bit */
body {
  padding-top: 20px;
  padding-bottom: 20px;
}

/* Everything but the jumbotron gets side spacing for mobile first views */
.header,
.marketing,
.footer {
  padding-right: 15px;
  padding-left: 15px;
}

/* Custom page header */
.header {
  border-bottom: 1px solid #e5e5e5;
}
/* Make the masthead heading the same height as the navigation */
.header h3 {
  padding-bottom: 19px;
  margin-top: 0;
  margin-bottom: 0;
  line-height: 40px;
}

/* Custom page footer */
.footer {
  padding-top: 19px;
  color: #777;
  border-top: 1px solid #e5e5e5;
}

/* Customize container */
@media (min-width: 768px) {
  .container {
    max-width: 730px;
  }
}
.container-narrow > hr {
  margin: 30px 0;
}

/* Main marketing message and sign up button */
.jumbotron {
  text-align: center;
  border-bottom: 1px solid #e5e5e5;
}
.jumbotron .btn {
  padding: 14px 24px;
  font-size: 21px;
}

/* Supporting marketing content */
.marketing {
  margin: 40px 0;
}
.marketing p + h4 {
  margin-top: 28px;
}

/* Responsive: Portrait tablets and up */
@media screen and (min-width: 768px) {
  /* Remove the padding we set earlier */
  .header,
  .marketing,
  .footer {
    padding-right: 0;
    padding-left: 0;
  }
  /* Space out the masthead */
  .header {
    margin-bottom: 30px;
  }
  /* Remove the bottom border on the jumbotron for visual effect */
  .jumbotron {
    border-bottom: 0;
  }
}
</style>
<title></title>
</head>
<body>
<div class="container">
    <h1 class="well">Registration Form</h1>
	<div class="col-lg-12 well">
	<div class="row">
<form:form modelAttribute="user" method="POST" action="registeration/adduser" commandName="user">
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label>
				<form:input path="fname" placeholder="Enter First Name Here.."/>
                <form:errors path="fname" cssStyle="color: #ff0000;"/>
                			</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
				<form:input path="lname" placeholder="Enter Last Name Here.."/>
                <form:errors path="lname" cssStyle="color: #ff0000;" />
							</div>
						</div>					
						<div class="form-group">
							<label>Address</label>
				<form:input path="address" placeholder="Enter Address Here.." rows="3"/>
                <form:errors path="address" cssStyle="color: #ff0000;" />
						</div>	
						<div class="row">
							<div class="col-sm-4 form-group">
								<label>City</label>
				<form:input path="city" placeholder="Enter City Here.."/>
                <form:errors path="city" cssStyle="color: #ff0000;" />
				
							</div>	
							<div class="col-sm-4 form-group">
								<label>State</label>
				<form:input path="state" placeholder="Enter State Here.."/>
                <form:errors path="state" cssStyle="color: #ff0000;" />
				
							</div>	
							<div class="col-sm-4 form-group">
								<label>Zip</label>
				<form:input path="zip" placeholder="Enter Zip-Code Here.."/>
                <form:errors path="zip" cssStyle="color: #ff0000;" />
				
							</div>		
						</div>
							<div class="col-sm-6 form-group">
								<label>Password</label>
				<form:input path="password" placeholder="***********"/>
                <form:errors path="password" cssStyle="color: #ff0000;" />
							</div>	
						</div>						
					<div class="form-group">
						<label>Phone Number</label>
				<form:input path="phone" placeholder="Enter 10 digit mobile number"/>
                <form:errors path="phone" cssStyle="color: #ff0000;" />
					</div>		
					<div class="form-group">
						<label>Email Address</label>
				<form:input path="email" placeholder="Enter Email (xyz@gmail.com)Address Here.."/>
                <form:errors path="email" cssStyle="color: #ff0000;" />
					</div>	
				<input type="submit" name="submit" value="Submit">					
					</div>
				</form:form>
				</div>
	</div>
	</div>
</body>
</html>