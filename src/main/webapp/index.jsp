<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Accueil</title>
    <style>
        /* Styling du corps de la page */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to bottom right, #6dd5ed, #2193b0);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #333;
        }

        /* Conteneur principal */
        .container {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
            padding: 40px 30px;
            text-align: center;
            width: 100%;
            max-width: 450px;
            animation: fadeIn 1s ease-in-out;
        }

        /* Animation d'apparition */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: scale(0.9);
            }
            to {
                opacity: 1;
                transform: scale(1);
            }
        }

        h1 {
            color: #007bff;
            font-size: 2em;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            margin-bottom: 25px;
            font-size: 1.1em;
        }

        /* Liens et boutons */
        a, button {
            display: inline-block;
            margin: 10px 0;
            padding: 12px 20px;
            font-size: 1em;
            font-weight: bold;
            text-decoration: none;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        a {
            background-color: #007bff;
            color: #fff;
            box-shadow: 0 4px 6px rgba(0, 123, 255, 0.2);
        }

        a:hover {
            background-color: #0056b3;
            box-shadow: 0 6px 10px rgba(0, 123, 255, 0.3);
            transform: translateY(-2px);
        }

        button {
            background-color: #28a745;
            color: #fff;
            box-shadow: 0 4px 6px rgba(40, 167, 69, 0.2);
        }

        button:hover {
            background-color: #218838;
            box-shadow: 0 6px 10px rgba(40, 167, 69, 0.3);
            transform: translateY(-2px);
        }

        /* Style responsive */
        @media (max-width: 500px) {
            .container {
                padding: 20px;
            }
            h1 {
                font-size: 1.8em;
            }
            p {
                font-size: 1em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Bienvenue !</h1>
        <p>Choisissez une option :</p>
        <a href="login.jsp">Se connecter</a>
        <form action="VisiteurServlet" method="get" style="margin: 0;">
            <button type="submit">Accéder en tant que visiteur</button>
        </form>
    </div>
</body>
</html>
