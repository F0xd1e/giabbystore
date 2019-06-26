<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="JavaBeans.ProductBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giabby's Store</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
	<link rel="stylesheet" type="text/css" href="./files_css/searchres.css">
	<link rel="stylesheet" type="text/css" href="./files_css/index-style.css">
</head>
<body>


 <nav class="navbar navbar-inverse navbar-fixed-top" >
            <div class="container-fluid">
                <div class="navbar-header">
                    <a style = "padding-left:10px;" class="navbar-brand" href="./index.jsp">Return to index</a>
                </div>
            </div>
        </nav>

		<header>
            <div class = "container" style = "width: 90%; padding: 5px; margin-top:50px;">
                <h2 style = "text-align: center;"><strong>Search results: </strong></h2>
                <hr/>
            </div>
        </header>
        	<section>
        	
        				<c:if test="${empty searchRes}">
				<h3>Nessun prodotto trovato.</h3>
			</c:if>
        	
		
			<c:forEach items="${searchRes}" var="ret">
			
			
			
				 <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <a href="DoRetrieveProductBean?productId=${ret.getProductCode()}">
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        ${ret.getTitle()}
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img imageselector" src = "${ret.getImgPath()}" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        ${ret.getPrice()}
                    </div>
                </div>
                </a>
            </div>
			</c:forEach>

        		
        		
        	</section>

        

</body>
</html>