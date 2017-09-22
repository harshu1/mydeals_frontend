<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>product Page</title>
	<style type="text/css">
		.tg  {border-collapse:collapse;border-spacing:0;border-color:#ccc;}
		.tg td{font-family:Arial, sans-serif;font-size:14px;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#fff;}
		.tg th{font-family:Arial, sans-serif;font-size:14px;font-weight:normal;padding:10px 5px;border-style:solid;border-width:1px;overflow:hidden;word-break:normal;border-color:#ccc;color:#333;background-color:#f0f0f0;}
		.tg .tg-4eph{background-color:#f9f9f9}
	</style>
</head>
<body>
<jsp:include page="/WEB-INF/jspview/usernav.jsp" />
<div class="container">
<h2 class="head1">Your Details</h2>
    <div class="row col-md-3">
    <c:if test="${not empty lists}">
    <table class="table mytable-striped custab">
        <tr class="addr1">
            <th>Email</th>
		    <th>Name</th>
		    <th>Address</th>
		    <th>Password</th>
		    <th>Phone No.</th>
            <th class="text-center">Action</th>
        </tr>
        <c:forEach items="${lists}" var="user" varStatus="status">
            <tr>
                <td><input name="lists[${status.index }].email" value="${user.email}"/></td>
			    <td><input name="lists[${status.index }].name" value="${user.fname}"/></td>
			    <td><input name="lists[${status.index }].age" value="${user.address}"/></td>
			    <td><input name="lists[${status.index }].password" value="${user.password}"/></td>
			    <td><input name="lists[${status.index }].phoneno" value="${user.phone}"/></td>
                <td class="text-center"><a class='btn btn-info btn-xs' href="#"><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
            </tr>
        </c:forEach>   
    </table>
    </c:if>
    </div>
</div> 
<a class='btn btn-info btn-xs' href="payment"><span class="glyphicon glyphicon-edit"></span>Edit->Payment Address</a>
</body>
</html>