package Servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.IOException;

import dao.AdminDao;

public class DeleteAgentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String agentId = request.getParameter("id"); // Récupère l'id de l'agent depuis la requête

        AdminDao.deleteAccount(agentId);

        // Redirection vers la page admin après suppression
        response.sendRedirect("AdminServlet");
    }
}

