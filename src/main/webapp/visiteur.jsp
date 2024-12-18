<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Models.Hotel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Visiteur - Liste des Hôtels</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 30px;
        }
        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }
        .form-control, .btn {
            margin-top: 10px;
        }
        table {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        td {
            vertical-align: middle;
        }
        .details-btn {
            background-color: #28a745;
            color: white;
        }
        .details-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <!-- Container principal -->
    <div class="container">
        <h1 class="text-center">Liste des Hôtels</h1>

        <!-- Formulaire de Filtrage -->
        <div class="card p-4 mb-4">
            <h3 class="text-primary">Filtrer les Hôtels</h3>
            <form action="VisiteurServlet" method="get" class="row g-3">
                <div class="col-md-6">
                    <label for="city" class="form-label">Ville :</label>
                    <input type="text" name="city" id="city" class="form-control" placeholder="Entrez une ville">
                </div>
                <div class="col-md-6">
                    <label for="minStars" class="form-label">Étoiles (min) :</label>
                    <input type="number" name="minStars" id="minStars" class="form-control" min="1" max="5">
                </div>
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-primary w-25">Filtrer</button>
                </div>
            </form>
        </div>

        <!-- Liste des Hôtels -->
        <div class="table-responsive">
            <table class="table table-bordered table-hover text-center">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Ville</th>
                        <th>Étoiles</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotels");
                    if (hotels != null && !hotels.isEmpty()) {
                        for (Hotel hotel : hotels) {
                    %>
                        <tr>
                            <td><%= hotel.name %></td>
                            <td><%= hotel.city %></td>
                            <td><%= hotel.stars %></td>
                            <td><%= hotel.descriptions %></td>
                            <td>
                                <form action="RoomHotelServlet" method="get" class="d-inline">
                                    <input type="hidden" name="hotelId" value="<%= hotel.id %>">
                                    <button type="submit" class="btn details-btn btn-sm">Détails</button>
                                </form>
                            </td>
                        </tr>
                    <%
                        }
                    } else {
                    %>
                        <tr>
                            <td colspan="5" class="text-muted">Aucun hôtel trouvé</td>
                        </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
