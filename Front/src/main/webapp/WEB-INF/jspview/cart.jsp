<%@ page isELIgnored = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>
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
<div class="container" data-ng-app="myApp" data-ng-controller="pdtCtrl">
<h2 class="head1">Welcome ${name}</h2>
<div class="row col-md-12">
<div class="input-group">
  <input class="form-control"   data-ng-model="search" placeholder="Search" type="text" />
  <span class="input-group-addon">
      <span class="glyphicon glyphicon-search"></span>
  </span>
</div>
    <table class="table mytable-striped custab">
    <thead>
        <tr class="addr1">
		    <th data-ng-click="sort('Name')">Order-Name
		        <span class="glyphicon sort-icon" data-ng-show="sortKey=='Name'" data-ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
		    </th>
		    <th data-ng-click="sort('Quantity')">Quantity
		        <span class="glyphicon sort-icon" data-ng-show="sortKey=='Quantity'" data-ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
		    </th>
		    <th data-ng-click="sort('Price')">Price
		        <span class="glyphicon sort-icon" data-ng-show="sortKey=='Price'" data-ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
		    </th>
		    <th data-ng-click="sort('Status')">Status
		        <span class="glyphicon sort-icon" data-ng-show="sortKey=='Status'" data-ng-class="{'glyphicon-chevron-up':reverse,'glyphicon-chevron-down':!reverse}"></span>
		    </th>
		    <th>Total Price
		    </th>
            <th class="text-center"></th>
        </tr>
      </thead>
      <tbody>
       <c:forEach var="ps" items="${listorders}">
           
        <tr>
			<td>${ps.}</td>
			<td>${ps.quantity}</td> 
			<td>${ps.price}</td>
			<td>${ps.status}</td>
			<td>${ps.quantity * product.price}</td>
			<td class="text-center"><a href="#" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
        </tr>
        </c:forEach>
      </tbody>
      </table>
      <a href="shipping"><button type="button" class="btn btn-default">Pay</button></a>
    </div>
</div>
</body>
</html>