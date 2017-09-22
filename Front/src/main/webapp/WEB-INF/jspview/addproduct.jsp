<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit/Add Product</title>
    <!-- Bootstrap -->
    <link href="resources/css/footer.css" rel="stylesheet">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/mystyle3.css" rel="stylesheet">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body id="body3">
    <div align="center">
        <h1>Add Product</h1>
        <form:form class="form-horizontal" action="addProduct?${_csrf.parameterName}=${_csrf.token}" 
        method="post" modelAttribute="product" enctype="multipart/form-data">
        <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
        <form:hidden path="id"/>
        <div class="form-group">
             <label for="name" class="control-label col-sm-2">Company:</label>
             <div class="col-sm-8">
             <form:input class = "form-control" path="name"/></div>       
        </div>
        <div class="form-group">
             <label for="description" class="control-label col-sm-2">Description:</label>
             <div class="col-sm-8">
             <form:input class = "form-control" path="description"/></div>       
        </div>
        <div class="form-group">
             <label for="quantity" class="control-label col-sm-2">Stock:</label>
             <div class="col-sm-8">
             <form:input class = "form-control" path="quantity"/></div>        
        </div>  
        <div class="form-group">
             <label for="price" class="control-label col-sm-2">Price:</label>
             <div class="col-sm-8">
             <form:input class = "form-control" path="price"/></div>         
        </div>   
        <div class="form-group">
             <label for="status" class="control-label col-sm-2">Category:</label>
             <div class="col-sm-8">
             <form:input class = "form-control" path="status"/></div>         
        </div> 
        <div class="form-group">
             <label for="imagepath" class="control-label col-sm-2">Image Path:</label>
             <div class="col-sm-8">
             <form:input class = "form-control" path="imagepath"/></div>       
        </div> 
        <div class="form-group">
             <label for="file" class="control-label col-sm-2">Upload Image:</label>
             <div class="col-sm-8">
             <form:input type="file" path="file"/></div>       
        </div> 
        <button type="submit" class="col-sm-4 col-sm-offset-4 btn btn-info">Add-Product</button>
        </form:form>
    </div>
</body>
</html>
