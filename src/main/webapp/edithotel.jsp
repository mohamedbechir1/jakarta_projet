<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Models.Hotel" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier l'Hôtel</title>
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

        /* Conteneur principal */
        .container {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            padding: 20px 30px;
            width: 100%;
            max-width: 500px;
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        /* Formulaire et champs */
        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 1em;
        }

        textarea {
            resize: none;
            height: 80px;
        }

        /* Boutons */
        button, input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            font-weight: bold;
            text-transform: uppercase;
            width: 100%;
            margin-top: 10px;
            box-shadow: 0 4px 6px rgba(0, 123, 255, 0.2);
            transition: background-color 0.3s, box-shadow 0.3s;
        }

        button:hover, input[type="submit"]:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 10px rgba(0, 123, 255, 0.3);
        }

        /* Retour vers la liste */
        .back-button {
            display: inline-block;
            margin-bottom: 20px;
            text-decoration: none;
            color: #fff;
            background-color: #6c757d;
            padding: 10px 15px;
            border-radius: 5px;
            text-align: center;
            font-weight: bold;
        }

        .back-button:hover {
            background-color: #5a6268;
        }

        /* Responsive */
        @media (max-width: 600px) {
            .container {
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <% Hotel hotel = (Hotel) request.getAttribute("hotel"); %>
    <div class="container">
        <a href="AgentServlet" class="back-button">Retour à la Liste des Hôtels</a>
        <h1>Modifier l'Hôtel</h1>
        <form action="UpdateHotelServlet" method="post">
            <input type="hidden" name="id" value="<%= hotel.id %>">

            <label for="name">Nom :</label>
            <input type="text" id="name" name="name" value="<%= hotel.name %>" required>

            <label for="city">Ville :</label>
            <input type="text" id="city" name="city" value="<%= hotel.city %>" required>

            <label for="stars">Étoiles :</label>
            <input type="number" id="stars" name="stars" min="1" max="5" value="<%= hotel.stars %>" required>

            <label for="description">Description :</label>
            <textarea id="description" name="description" required><%= hotel.descriptions %></textarea>

            <button type="submit">Enregistrer les modifications</button>
        </form>
    </div>
</body>
</html>
