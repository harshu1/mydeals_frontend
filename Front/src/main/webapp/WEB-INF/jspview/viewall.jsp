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
<jsp:include page="/WEB-INF/jspview/nav.jsp" />
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
                  
            <c:forEach var="songs" items="${listproducts}">
                <tr>
                    <td><img src="<%=request.getContextPath()%>/tmpFiles/${songs.pid}.jpg}>">></td>
                    <td><c:out value="${songs.pid}" /></td>
                    <td><c:out value="${songs.category}" /></td>
                    <td><c:out value="${songs.stock}" /></td>
                    <td><c:out value="${songs.price}" /></td>
                    <td><c:out value="${songs.company}" /></td>
                    <td><c:out value="${songs.description}" /></td>
                    
                 <td><a href="<c:url value='/admin/edit/${songs.pid}' />" >Edit</a></td>
			<td><a href="<c:url value='/admin/remove/${songs.pid}' />" >Delete</a></td>   
                </tr>
                                          
                   
            </c:forEach>
            </table>
            </div> 
   </c:if>
       
</body>
</html>