<%-- 
    Document   : viewData.jsp
    Created on : 14-Nov-2024, 7:13:06 PM
    Author     : Rahul
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Data</title>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="assets/css/dataTables.dataTables.min.css"/>
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-8">
                    <h1 class="text-center text-danger mb-4">Student Data</h1>
                    <div class="card">
                        <div class="card-body">
                            <table id="myTable" class="table table-dark table-striped table-bordered">
                                <% 
                                    Connection con = null;
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root","");
                                        String query = "SELECT * FROM data";
                                        Statement stmt = con.createStatement();
                                        ResultSet rs = stmt.executeQuery(query);
                                    
                                %>
                                <thead>
                                    <tr>
                                        <th class="text-center">Name</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Contact Number</th>
                                        <th class="text-center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String id = "";
                                        while(rs.next()){
                                            rs.getString("id");
                                        
                                    %>
                                    <tr>
                                        <td class="text-center"><%= rs.getString("name") %></td>
                                        <td class="text-center"><%= rs.getString("email") %></td>
                                        <td class="text-center"><%= rs.getString("mobile") %></td>
                                        <td class="text-center">
                                            <a href="updateData.jsp?userId=<%= rs.getString("id")%>" class="text-success text-decoration-none">Update</a>&nbsp;
                                            <a href="deleteData.jsp?<%= rs.getString("id")%>" class="text-danger text-decoration-none">Delete</a>
                                        </td>
                                    </tr>
                                    <% 
                                        }
                                            con.close();
                                            stmt.close();
                                            rs.close();
                                        } catch(Exception e) {
                                            out.println(e);
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br>
                    <a href="index.jsp" class="text-decoration-none align-items-center justify-content-center d-flex">Add Data</a>
                </div>
            </div>
        </div>

        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
        <script src="assets/js/dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#myTable').DataTable();
            });
        </script>
    </body>
</html>
