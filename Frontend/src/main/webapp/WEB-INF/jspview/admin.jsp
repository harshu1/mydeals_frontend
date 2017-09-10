<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page session="true"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>adding-products</title>
 </head>
 <body>
<jsp:include page="adminnav.jsp" />  
 	<c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
 	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>
		
	<center>
  <h2>Create New Product</h2>
  <form:form action="/admin/Product/add" commandName="Product">
      <table>
       <tr>
           <td><form:label path="pubId">Product Category:</form:label></td>
           <td><form:input path="pubId" value="${products.pid}" readonly="true"/></td>
       </tr>
       <tr>
           <td><form:label path="pubTitle">Product Company:</form:label></td>
           <td><form:input path="pubTitle" value="${products.company}"/></td>
       </tr>
       
      <tr>
        <td>
         <form:label path="category.categoryId">Product Price:</form:label>
        </td>
        </tr>
       <tr>
           <td><form:label path="pubContent">Product stock:</form:label></td>
           <td><form:textarea path="pubContent" value="${products.stock}" cssStyle="width: 150px;"/></td>
       </tr>
       <tr>
           <td><form:label path="pubContent">Product Descrption:</form:label></td>
           <td><form:textarea path="pubContent" value="${products.description}" cssStyle="width: 150px;"/></td>
       </tr>
      
      
       <tr>
         <td>&nbsp;</td>
         <td><input type="submit" value="SAVE"/></td>
        </tr>
   </table> 
  </form:form>
  <br/>
  <c:if test="${!empty products}">
 <table align="center" border="1">
  <tr>
   <th>ID</th>
   <th>Category</th>
   <th>Company</th>
   <th>Price</th>
   <th>Stock</th>
   <th>Description</th>
  </tr>

  <c:forEach items="${products}" var="product">
   <tr>
    <td><c:out value="${product.pid}"/></td>
    <td><c:out value="${product.category}"/></td>
    <td><c:out value="${product.company}"/></td>
    <td><c:out value="${product.price}"/></td>
    <td><c:out value="${product.stock}"/></td>
    <td><c:out value="${product.size}"/></td>
     </tr>
  </c:forEach>
 </table>
</c:if>
<h2><a href="addproduct">Adding more</a></h2>
</center>

 </body>
</html>
