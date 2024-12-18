<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Models.Room" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Gestion des Chambres - ${hotelName}</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #007bff;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 15px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        form label {
            font-size: 14px;
            margin-bottom: 8px;
            color: #333;
        }
        form input[type="number"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        form button:hover {
            background-color: #218838;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
            text-align: center;
            padding: 10px;
        }
        td {
            text-align: center;
            padding: 10px;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9ecef;
        }
    </style>
</head>
<body>
    <h1>Gestion des Chambres pour Hôtel : ${hotelName}</h1>
    <br>

    <form action="RoomHotelServlet" method="get">
        <label for="maxPrice">Prix maximum :</label>
        <input type="number" name="maxPrice" id="maxPrice">
        <input type="hidden" name="hotelId" value="<%= request.getAttribute("hotelId") %>">
        <button type="submit">Filtrer</button>
    </form>

    <!-- Liste des Chambres -->
    <h2>Liste des Chambres</h2>
    <table>
        <tr>
            <th>Label</th>
            <th>Capacité</th>
            <th>Prix</th>
            <th>Actions</th>
        </tr>
        <%
        List<Room> rooms = (List<Room>) request.getAttribute("rooms");
        for (Room room : rooms){
        %>
            <tr>
                <td><%= room.label %></td>
                <td><%= room.capacity %></td>
                <td><%= room.price %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>
