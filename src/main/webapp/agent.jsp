<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Models.Hotel" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Hôtels</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #007bff;
        }
        .navbar-brand, .navbar-nav .nav-link {
            color: white;
        }
        .navbar-brand:hover, .navbar-nav .nav-link:hover {
            color: #e3f2fd;
        }
        .container {
            margin-top: 20px;
        }
        table {
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }
        .table th {
            background-color: #007bff;
            color: white;
        }
        .form-section {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }
        footer {
            margin-top: 40px;
            text-align: center;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container">
            <a class="navbar-brand" href="#">Gestion des Hôtels</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">Retour à la Connexion</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#creerHotel">Créer un Hôtel</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <!-- Formulaire de Filtrage -->
        <div class="form-section">
            <h2 class="text-primary">Filtres</h2>
            <form action="AgentServlet" method="get" class="row g-3">
                <div class="col-md-4">
                    <label for="name" class="form-label">Nom :</label>
                    <input type="text" name="name" id="name" class="form-control">
                </div>
                <div class="col-md-4">
                    <label for="city" class="form-label">Ville :</label>
                    <input type="text" name="city" id="city" class="form-control">
                </div>
                <div class="col-md-4">
                    <label for="stars" class="form-label">Étoiles :</label>
                    <input type="number" name="stars" id="stars" class="form-control" min="0">
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">Filtrer</button>
                </div>
            </form>
        </div>

        <!-- Liste des Hôtels -->
        <h2 class="text-primary my-4">Liste des Hôtels</h2>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Nom</th>
                        <th>Ville</th>
                        <th>Étoiles</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<Hotel> hotels = (List<Hotel>) request.getAttribute("hotel"); %>
                    <% if (hotels != null && !hotels.isEmpty()) { %>
                        <% for (Hotel hotel : hotels) { %>
                            <tr>
                                <td><%= hotel.name %></td>
                                <td><%= hotel.city %></td>
                                <td><%= hotel.stars %></td>
                                <td><%= hotel.descriptions %></td>
                                <td>
                                    <form action="AgentServlet" method="post" class="d-inline">
                                        <input type="hidden" name="id" value="<%= hotel.id %>">
                                        <input type="hidden" name="action" value="deleteHotel">
                                        <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                                    </form>
                                    <form action="EditHotelServlet" method="get" class="d-inline">
                                        <input type="hidden" name="hotelId" value="<%= hotel.id %>">
                                        <button type="submit" class="btn btn-warning btn-sm">Modifier</button>
                                    </form>
                                    <form action="RoomServlet" method="get" class="d-inline">
                                        <input type="hidden" name="hotelId" value="<%= hotel.id %>">
                                        <button type="submit" class="btn btn-info btn-sm">Gérer les Chambres</button>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="5" class="text-center">Aucun hôtel trouvé</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Formulaire pour Ajouter un Hôtel -->
        <div id="creerHotel" class="form-section">
            <h2 class="text-primary">Ajouter un Hôtel</h2>
            <form action="AgentServlet" method="post" class="row g-3">
                <input type="hidden" name="action" value="addHotel">
                <div class="col-md-6">
                    <label for="name" class="form-label">Nom :</label>
                    <input type="text" name="name" id="name" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label for="city" class="form-label">Ville :</label>
                    <input type="text" name="city" id="city" class="form-control" required>
                </div>
                <div class="col-md-4">
                    <label for="stars" class="form-label">Étoiles :</label>
                    <input type="number" name="stars" id="stars" class="form-control" min="0" required>
                </div>
                <div class="col-12">
                    <label for="description" class="form-label">Description :</label>
                    <textarea name="description" id="description" class="form-control" rows="4" required></textarea>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-success">Ajouter</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2024 Gestion des Hôtels - Tous droits réservés.
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
