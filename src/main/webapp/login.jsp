<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion</title>
    <style>
        /* Styling général */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom, #6dd5ed, #2193b0);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        /* Container principal */
        .container {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            padding: 30px;
            width: 100%;
            max-width: 400px;
            text-align: center;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .container:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 20px rgba(0, 0, 0, 0.3);
        }

        /* Titre */
        h2 {
            color: #007bff;
            margin-bottom: 20px;
            font-size: 1.8em;
        }

        /* Labels */
        label {
            display: block;
            text-align: left;
            margin-bottom: 5px;
            font-weight: 600;
            color: #444;
        }

        /* Champs de saisie */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 8px 0 15px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1em;
            box-sizing: border-box;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            outline: none;
        }

        /* Bouton */
        button {
            width: 100%;
            padding: 12px;
            background: #007bff;
            border: none;
            color: #fff;
            font-size: 1.1em;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s, box-shadow 0.3s;
        }

        button:hover {
            background: #0056b3;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* Pied de page */
        .footer {
            margin-top: 20px;
            font-size: 0.9em;
            color: #666;
        }

        .footer a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s;
        }

        .footer a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Connexion</h2>
        <form action="LoginServlet" method="POST">
            <label for="username">Nom d'utilisateur :</label>
            <input type="text" id="username" name="username" placeholder="Entrez votre nom d'utilisateur" required>

            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="password" placeholder="Entrez votre mot de passe" required>

            <button type="submit">Se connecter</button>
        </form>
        <div class="footer">
            <p>Pas encore de compte ? <a href="signup.jsp">Créer un compte</a></p>
        </div>
    </div>
</body>
</html>
