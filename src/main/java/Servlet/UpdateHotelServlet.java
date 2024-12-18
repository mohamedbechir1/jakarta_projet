package Servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.AgentDao;

public class UpdateHotelServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String city = request.getParameter("city");
        int stars = Integer.parseInt(request.getParameter("stars"));
        String description = request.getParameter("description");
        AgentDao.updateHotel(name, city, stars, description, id);


        response.sendRedirect("AgentServlet");
    }
}
