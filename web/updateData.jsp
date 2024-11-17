<%-- 
    Document   : updateData
    Created on : 17-Nov-2024, 6:46:30 PM
    Author     : Rahul
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Data</title>
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
            <h2 class="text-success">Update Student Data</h2>
            <hr class="bg-success">
            <form method="post" action="update.jsp">
                <% 
                                    String userId = request.getParameter("userId");
                                    Connection con = null;
                                    try {
                                        
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root","");
                                        String query = "SELECT * FROM data WHERE id = ?";
                                        PreparedStatement stmt = con.prepareStatement(query);
                                        stmt.setInt(1, Integer.parseInt(userId));
                                        ResultSet rs = stmt.executeQuery();
                %>
                <%
                                        String id = "";
                                        while(rs.next()){
                                            rs.getString("id");
                                        
                %>
                <div class="form-group">
                    <input type="hidden" name="id" value="<%= rs.getString("id") %>">
                    <label>Full Name</label>
                    <input type="text" class="form-control" name="name" id="name" value="<%= rs.getString("name") %>">
                    <br>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" class="form-control" name="email" id="email" value="<%= rs.getString("email") %>">
                    <br>
                </div>
                <div class="form-group">
                    <label>Mobile Number</label>
                    <input type="tel" class="form-control" id="mobile" name="mobile" value="<%= rs.getString("mobile") %>">
                </div>
                <br>
                <div class="d-flex align-items-center justify-content-center">
                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                </div>
                <% 
                                        }
                                            con.close();
                                            stmt.close();
                                            rs.close();
                                        } catch(Exception e) {
                                            out.println(e);
                                        }
                %>
            </form>
            <br>
            <a href="viewData.jsp" class="text-decoration-none align-items-center justify-content-center d-flex">View Data</a>
        </div>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
        <script src="assets/js/dataTables.min.js"></script>
    </body>
</html>
