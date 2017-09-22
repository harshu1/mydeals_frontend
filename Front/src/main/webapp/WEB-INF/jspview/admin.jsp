<%@ page isELIgnored = "false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="true" %>
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
<jsp:include page="/WEB-INF/jspview/adminnav.jsp" />
<h1 align="center">
<c:url value="/logout" var="logoutUrl" />
<!-- csrt for log out-->
	<form action="${logoutUrl}" method="post" id="logout">
	  <input type="hidden"
		name="${_csrf.parameterName}"
		value="${_csrf.token}" />
	</form>
	
<script>
		function formSubmit() {
			document.getElementById("logout").submit();
		}
</script>

<c:if test="${pageContext.request.userPrincipal.name != null}">
		<h2 class="head1">
			Welcome : ${pageContext.request.userPrincipal.name} 
		</h2>
</c:if>
	

	Add/Update the product
</h1>
<div align="center" background="/resources/background.jpeg">
<c:url var="addAction" value="/admin/*"></c:url>
<form:form action="${addAction}" commandName="product" method="post">
<table>
	<c:if test="${!empty product.company}">
	<tr>
		<td>
			<form:label path="pid">
				<spring:message text="ID"/>
			</form:label>
		</td>
		
	<td>
			<form:input path="pid" readonly="true" size="8"  disabled="true" />
			<form:hidden path="pid" />
		</td> 
	</tr>
	</c:if>
	<tr>
		<td>
			<form:label path="category">
				<spring:message text="Category"/>
			</form:label>
		</td>
		<td>
			<form:input path="category" />
		</td> 
	</tr>
	<tr>
		<td>
			<form:label path="company">
				<spring:message text="Company"/>
			</form:label>
		</td>
		<td>
			<form:input path="company" />
		</td> 
	</tr>
	
	<tr>
		<td>
			<form:label path="stock">
				<spring:message text="Quantity"/>
			</form:label>
		</td>
		<td>
			<form:input path="stock" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="price">
				<spring:message text="Price"/>
			</form:label>
		</td>
		<td>
			<form:input path="price" />
		</td>
	</tr>
	<tr>
		<td>
			<form:label path="description">
				<spring:message text="Description"/>
			</form:label>
		</td>
		<td>
			<form:input path="description" />
		</td> 
	</tr>
		<!-- <td>
						<a href="<c:url value='/admin/add/${ps.company}' />" ><input type="submit"
					value="<spring:message text="Add product"/>" />
			
		</td>
		 --><tr>
		<td>
					<c:if test="${!empty product.company}">
				<input type="submit"
					value="<spring:message text="Edit Perduct"/>" />
			</c:if>
			</td>
	</tr>
</table>	
</form:form>
</div>
<div align="center">
<form method="POST" action="uploadFile" enctype="multipart/form-data">
		File to upload: <input type="file" name="file"><br /> 
		Name: <input type="text" name="name"><br /> <br /> 
		<input type="submit" value="Upload"> Press here to upload the file!
	</form>
	</div>
<br>
<button type="button" class="btn btn-default"  onclick="location.href='admin/newProduct'">Add New Product</button>

<h3>products List</h3>
<c:if test="${!empty listproducts}">
	
    <div align="center">
        <table border="1">
          
            <tr>
                <th>Pid</th>
                <th>Category</th>
                <th>Stock</th>
                <th>Price</th>
                <th>Company</th>
                <th>Description</th>
                
            </tr>    
                  
            <c:forEach var="ps" items="${listproducts}">
                <tr>
                    <td><c:out value="${ps.pid}" /></td>
                    <td><c:out value="${ps.category}" /></td>
                    <td><c:out value="${ps.stock}" /></td>
                    <td><c:out value="${ps.price}" /></td>
                    <td><c:out value="${ps.company}" /></td>
                    <td><c:out value="${ps.description}" /></td>
                    
                 <td><a href="<c:url value='/admin/edit/${ps.pid}' />" >Edit</a></td>
			<td><a href="<c:url value='/admin/remove/${ps.pid}' />" >Delete</a></td>   
                </tr>
            </c:forEach>
            </table>
            </div> 
   </c:if>
     <<jsp:include page="/WEB-INF/jspview/footer.jsp" /> 
</body>
</html>