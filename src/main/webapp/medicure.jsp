<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Medicure Doctor Registration By Mathew Joseph</title>
    <style>
        /* Insert your CSS styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #d3e0ea;
            padding: 50px;
        }
        .container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-header {
            text-align: center;
            margin-bottom: 20px;
            color: #2e4053;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #2e4053;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #bdc3c7;
            border-radius: 3px;
            color: #2e4053;
        }
        .search{
            width: 100%;
            padding: 10px;
            border: 1px solid #bdc3c7;
            border-radius: 3px;
            color: #2e4053;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #bdc3c7;
            padding: 8px;
            text-align: left;
            background-color: #ecf0f1;
            color: #2e4053;
        }
        .buttons {
            text-align: center;
            margin-top: 20px;
        }
        input[type="submit"] {
            background-color: #2ecc71;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin: 5px;
        }
        input[type="button"] {
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin: 5px;
        }
        input[type="button"][value="Update Doctor"] {
            background-color: #3498db;
            color: #fff;
        }
        input[type="button"][value="Delete Doctor"] {
            background-color: #e74c3c;
            color: #fff;
        }
        .search-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .search-container input[type="button"] {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h3 class="form-header">Medicure Doctor Registration By Mathew Joseph</h3>
        <form action="addAccounts" id="bankingForm" method="POST">
            <label for="id">Enter your Doctor ID</label>
            <input type="text" name="id" id="id" size="20">

            <label for="name">Enter your name:</label>
            <input type="text" name="name" id="name" size="20">

            <label for="address">Enter your address:</label>
            <input type="text" name="address" id="address" size="50">

            <label for="contact">Enter your contact:</label>
            <input type="text" name="contact" id="contact" size="50">
            
            <div class="buttons">
                <input type="submit" value="Add Doctor" onclick="addDoctor()">
                <input type="button" value="Update Doctor" onclick="updateDoctor()">
                <input type="button" value="Delete Doctor" onclick="deleteDoctor()">
            </div>
        </form>

        <div class="search-container">
            <label for="sid">Search Doctor by ID:</label>
            <input class="search" type="text" name="sid" id="sid" size="2" style="width:20%">
            <input type="button" value="Search" id="sbtn" onclick="searchDoctor()">
        </div>

        <div>
            <h4>Account Details</h4>
            <table id="doctordetailstb">
                <thead>
                    <tr>
                        <th>Doctor ID</th>
                        <th>Doctor Name</th>
                        <th>Doctor Address</th>
                        <th>Contact Number</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${bankingList}" var="banking">
                        <tr>
                            <td>${banking.bankingId}</td>
                            <td>${banking.customerName}</td>
                            <td>${banking.customerAddress}</td>
                            <td>${banking.contactNumber}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <script>
        function addDoctor() {
            var form = document.getElementById("bankingForm");
            form.action = "addDoctor";
            form.method = "POST";
            form.submit();
        }

        function searchDoctor() {
            var searchform = document.getElementById('sid').value;
            console.log(searchform);
            fetch("http://localhost:8080/Doctor/" + searchform)
                .then(response => response.json())
                .then(data => {
                    console.log(data);
                    printdatatotable(data);
                })
                .catch(error => {
                    console.error(error);
                });
        }

        function printdatatotable(data) {
            var tableBody = document.getElementById("doctordetailstb").getElementsByTagName('tbody')[0];
            tableBody.innerHTML = '';

            var row = tableBody.insertRow(0);

            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);

            cell1.innerHTML = data.bankingId;
            cell2.innerHTML = data.customerName;
            cell3.innerHTML = data.customerAddress;
            cell4.innerHTML = data.contactNumber;
        }

        function updateDoctor() {
            var form = document.getElementById("bankingForm");
            form.action = "updateDoctor";
            form.method = "PUT";
            form.submit();
        }

        function deleteDoctor() {
            var form = document.getElementById("bankingForm");
            form.action = "deleteDoctor";
            form.method = "DELETE";
            form.submit();
        }
    </script>  
</body>
</html>
