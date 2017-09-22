
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ page session="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/jspview/usernav.jsp" />
<h3>products List</h3>
<div class="container">  
<sec:authorize access="hasRole('user')">
		<!-- For login user -->
		<c:url value="/logout" var="logoutUrl" />
		<form action="${logoutUrl}" method="post" id="logout">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
		</form>
		<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>

		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<h2>
				User : ${pageContext.request.userPrincipal.name} | <a
					href="javascript:formSubmit()"> Logout</a>
			</h2>
		</c:if>
</sec:authorize>    
    
  <div class="row">
<% int count=0; %>
 <c:forEach var="ps" items="${listproducts}">
 <% if(count%3==0)
 		{%>
 <div class="row">
	<% }%> 
    <div class="col-sm-4">
      <div class="panel panel-primary">
        <div class="panel-heading"><c:out value="${ps.company}" /></div>
        <div class="panel-body"><img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">Cost:<c:out value="${ps.price}" /></div>
        <a href="<c:url value='/admin/cart/${ps.pid}' />" >Add To Cart</a>
      </div>
    </div>
    
  <%count++; %> 
  <%if(count%3==0){ %> 
  </div>
  
  <%} %>
 </c:forEach> 
</div>
</div>
</body>
</html>