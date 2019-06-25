<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="JavaBeans.ProductBean" %>
<%@ page import="java.util.ArrayList" %>

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
    <style>
    h2{
    
    color: white;
    }
    </style>
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
        	
        		<% if (request.getAttribute("searchRes") == null )
        		
        			out.append("<h3>No products found.</h3");
        			
        			ArrayList<ProductBean> sessProd = (ArrayList<ProductBean>) request.getAttribute("searchRes");
        			
        				for(ProductBean c : sessProd) {
        					
        					out.append("Name: "+c.getTitle()+"<br>");
        					out.append("Price:"+c.getPrice()+"<br>");
        					out.append("<image src="+c.getImgPath()+">");
        					
        				}

        		
        		
        			
        		%>
        		
        		
			
        		
        			
        		
        		
        	</section>
        
        

</body>
</html>