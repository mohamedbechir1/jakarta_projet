package Servlet;


import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;

import Models.Room;
import dao.RoomDao;

public class EditRoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        BigDecimal bigDecimal = new BigDecimal(1.5);
        Room room=RoomDao.getRoomById(roomId);

        request.setAttribute("room", room);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editroom.jsp");
        dispatcher.forward(request, response);
    }
}
