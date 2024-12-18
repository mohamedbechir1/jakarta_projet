<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Models.Room" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Chambres - ${hotelName}</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 30px;
        }
        h1, h2 {
            color: #007bff;
            text-align: center;
        }
        table {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }
        td {
            text-align: center;
        }
        .btn-action {
            margin-right: 5px;
        }
        .error-msg {
            color: red;
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Bouton Retour -->
        <form action="AgentServlet" method="get" class="mb-3">
            <button type="submit" class="btn btn-primary">Retour à la liste des hôtels</button>
        </form>

        <!-- Titre -->
        <h1>Gestion des Chambres pour Hôtel : ${hotelName}</h1>

        <!-- Liste des Chambres -->
        <h2 class="mt-4">Liste des Chambres</h2>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>Label</th>
                        <th>Capacité</th>
                        <th>Prix</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<Room> rooms = (List<Room>) request.getAttribute("rooms");
                    if (rooms != null && !rooms.isEmpty()) {
                        for (Room room : rooms) {
                    %>
                        <tr>
                            <td><%= room.label %></td>
                            <td><%= room.capacity %></td>
                            <td><%= room.price %> €</td>
                            <td>
                                <!-- Boutons d'action -->
                                <form action="RoomServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="deleteRoom">
                                    <input type="hidden" name="roomId" value="<%= room.id %>">
                                    <input type="hidden" name="hotelId" value="<%= room.hotelId %>">
                                    <button type="submit" class="btn btn-danger btn-sm btn-action">Supprimer</button>
                                </form>
                                <form action="EditRoomServlet" method="get" style="display:inline;">
                                    <input type="hidden" name="roomId" value="<%= room.id %>">
                                    <button type="submit" class="btn btn-warning btn-sm btn-action">Modifier</button>
                                </form>
                            </td>
                        </tr>
                    <%
                        }
                    } else {
                    %>
                        <tr>
                            <td colspan="4" class="text-muted text-center">Aucune chambre disponible.</td>
                        </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>

        <!-- Message d'erreur -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null && error.length() > 0) {
        %>
            <p class="error-msg"><%= error %></p>
        <%
            }
        %>

        <!-- Formulaire Ajouter une Chambre -->
        <h2 class="mt-5">Ajouter une Chambre</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <form action="RoomServlet" method="post" class="p-4 bg-white border rounded shadow-sm">
                    <input type="hidden" name="action" value="addRoom">
                    <input type="hidden" name="hotelId" value="<%= request.getAttribute("hotelId") %>">
                    <div class="mb-3">
                        <label for="label" class="form-label">Label :</label>
                        <input type="text" name="label" id="label" class="form-control" placeholder="Nom de la chambre" required>
                    </div>
                    <div class="mb-3">
                        <label for="capacity" class="form-label">Capacité :</label>
                        <input type="number" name="capacity" id="capacity" class="form-control" placeholder="Nombre de personnes" required>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Prix :</label>
                        <input type="number" step="0.01" name="price" id="price" class="form-control" placeholder="Prix par nuit" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Ajouter</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
