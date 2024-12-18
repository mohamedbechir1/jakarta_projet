<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Models.Account" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Admin</title>
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
            margin-top: 40px;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
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
            <a class="navbar-brand" href="#">Page Admin</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="login.jsp">Déconnexion</a></li>
                    <li class="nav-item"><a class="nav-link" href="#createForm">Créer un Agent</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container">
        <!-- Table des Agents -->
        <h1 class="my-4 text-primary">Liste des Agents</h1>
        <div class="table-responsive">
            <table class="table table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Nom d'utilisateur</th>
                        <th>Mot de passe</th>
                        <th>Rôle</th>
                        <th>Email</th>
                        <th>ID</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% List<Account> agents = (List<Account>) request.getAttribute("agents"); %>
                    <% if (agents != null && !agents.isEmpty()) { %>
                        <% for (Account agent : agents) { %>
                            <tr>
                                <td><%= agent.username %></td>
                                <td><%= agent.password %></td>
                                <td><%= agent.role %></td>
                                <td><%= agent.email %></td>
                                <td><%= agent.id %></td>
                                <td>
                                    <form action="DeleteAgentServlet" method="get" class="d-inline">
                                        <input type="hidden" name="id" value="<%= agent.id %>">
                                        <button type="submit" class="btn btn-danger btn-sm">Supprimer</button>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr>
                            <td colspan="6" class="text-center">Aucun agent trouvé</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Formulaire pour Créer un Agent -->
        <div id="createForm" class="form-section">
            <h2 class="text-primary">Créer un Nouvel Agent</h2>
            <form action="CreateAgentServlet" method="post" class="row g-3">
                <div class="col-md-6">
                    <label for="username" class="form-label">Nom d'utilisateur :</label>
                    <input type="text" name="username" id="username" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label for="password" class="form-label">Mot de passe :</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label for="role" class="form-label">Rôle :</label>
                    <input type="text" name="role" id="role" class="form-control" required>
                </div>
                <div class="col-md-6">
                    <label for="email" class="form-label">Email :</label>
                    <input type="email" name="email" id="email" class="form-control" required>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-success">Créer</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        &copy; 2024 Gestion des Agents - Tous droits réservés.
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
