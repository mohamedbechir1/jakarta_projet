<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Créer un compte</title>
    <!-- Intégration de Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #e9ecef;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        .form-container {
            max-width: 450px;
            margin: 50px auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        h2 {
            color: #343a40;
            text-align: center;
            margin-bottom: 25px;
        }
        .form-label {
            font-weight: 500;
            color: #495057;
        }
        .form-control {
            border-radius: 10px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        .form-control:focus {
            box-shadow: 0 0 0 0.25rem rgba(0, 123, 255, 0.25);
            border-color: #007bff;
        }
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            border-radius: 10px;
            padding: 12px;
            font-size: 16px;
        }
        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }
        .btn-primary:focus {
            box-shadow: 0 0 0 0.25rem rgba(0, 123, 255, 0.5);
        }
        .text-center {
            font-size: 14px;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Créer un compte</h2>
        <form action="SignUpServlet" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">Nom d'utilisateur :</label>
                <input type="text" name="username" id="username" class="form-control" placeholder="Entrez votre nom d'utilisateur" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Mot de passe :</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Entrez votre mot de passe" required>
            </div>
            <div class="mb-3">
                <label for="phone" class="form-label">Numéro de téléphone :</label>
                <input type="tel" name="phone" id="phone" class="form-control" placeholder="Entrez votre numéro de téléphone" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Créer un compte</button>
        </form>
        <div class="text-center mt-3">
            <p>Vous avez déjà un compte ? <a href="#">Se connecter</a></p>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
