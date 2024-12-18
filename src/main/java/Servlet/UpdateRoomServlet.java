package Servlet;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.RoomDao;

public class UpdateRoomServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String label = request.getParameter("label");
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        double price = Double.parseDouble(request.getParameter("price"));
        RoomDao.updateRoom(label, capacity, price, id);
    }
}

