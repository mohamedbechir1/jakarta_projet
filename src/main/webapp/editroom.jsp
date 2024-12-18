<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Models.Room" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier une Chambre</title>
    <style>
        /* Styles généraux */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Conteneur du formulaire */
        .container {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 500px;
            width: 100%;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Styles des étiquettes et champs */
        label {
            display: block;
            font-weight: bold;
            margin: 10px 0 5px;
            color: #555;
        }

        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 1em;
        }

        /* Bouton d'enregistrement */
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            width: 100%;
            text-transform: uppercase;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 123, 255, 0.2);
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        button:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 10px rgba(0, 123, 255, 0.3);
        }

        /* Responsive */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <% Room room = (Room) request.getAttribute("room"); %>
    <div class="container">
        <h1>Modifier la Chambre</h1>
        <form action="UpdateRoomServlet" method="post">
            <input type="hidden" name="id" value="<%= room.id %>">

            <label for="label">Label :</label>
            <input type="text" id="label" name="label" value="<%= room.label %>" required>

            <label for="capacity">Capacité :</label>
            <input type="number" id="capacity" name="capacity" value="<%= room.capacity %>" required>

            <label for="price">Prix :</label>
            <input type="number" id="price" name="price" step="0.01" value="<%= room.price %>" required>

            <button type="submit">Enregistrer les modifications</button>
        </form>
    </div>
</body>
</html>
