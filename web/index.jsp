<%-- 
    Document   : index.jsp
    Created on : 15-Nov-2024, 4:46:13 PM
    Author     : Rahul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Student Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f8f9fa;
            }
            .form-container {
                max-width: 400px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }
            .form-container h2 {
                text-align: center;
                margin-bottom: 20px;
            }
        </style>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    </head>
    <body>
        <div class="form-container">
            <h2>Add Student Data</h2>
            <hr>
            <form method="post" action="insert.jsp">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter full name" required>
                    <br>
                </div>
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" class="form-control" id="email" placeholder="Enter email" required>
                    <br>
                </div>
                <div class="form-group">
                    <label for="mobile">Mobile Number</label>
                    <input type="tel" class="form-control" id="mobile" placeholder="Enter mobile number" required>
                </div>
                <br>
                <div class="d-flex align-items-center justify-content-center">
                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                </div>
            </form>
        </div>
    </body>
</html>
