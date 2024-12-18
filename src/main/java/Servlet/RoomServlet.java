package Servlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Models.Room;
import dao.DataBaseConnection;
import dao.RoomDao;
public class RoomServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int hotelId = Integer.parseInt(request.getParameter("hotelId"));
        List<Room> rooms = new ArrayList<>();
        try (Connection conn = DataBaseConnection.getConnection()) {
            String hotelQuery = "SELECT * FROM hotels WHERE id = ?";
            PreparedStatement hotelStatement = conn.prepareStatement(hotelQuery);
            hotelStatement.setInt(1, hotelId);
            ResultSet hotelResultSet = hotelStatement.executeQuery();
            if (hotelResultSet.next()) {
                request.setAttribute("hotelName", hotelResultSet.getString("name"));
            }
            rooms=RoomDao.getRooms(hotelId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("rooms", rooms);
        request.setAttribute("hotelId", hotelId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("room.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        char id = request.getParameter("hotelId").charAt(0);
        String hotelId=String.valueOf(id);

        try (Connection conn = DataBaseConnection.getConnection()) {
            if ("addRoom".equals(action)) {
                StringBuilder error=new StringBuilder();
                boolean test=false;
                String label = request.getParameter("label");
                int capacity = Integer.parseInt(request.getParameter("capacity"));
                double price = Double.parseDouble(request.getParameter("price"));
                if(price<=0) {
                    test=true;
                    error.append("price must be positive");
                }
                if(capacity<=0) {
                    test=true;
                    error.append("capacity must be positive");
                }
                if(label.length()<2) {
                    test=true;
                    error.append("label invalided");
                }
                if(test==true) {
                    String errorMessage=error.toString();
                    request.setAttribute("rooms", RoomDao.getRooms( Integer.parseInt(hotelId)));
                    request.setAttribute("hotelId", hotelId);
                    request.setAttribute("error", errorMessage);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("room.jsp");
                    dispatcher.forward(request, response);
                }
                RoomDao.addRoom(hotelId, label, capacity, price);
            } else if ("deleteRoom".equals(action)) {
                char id1 = request.getParameter("roomId").charAt(0);
                String idd=String.valueOf(id1);
                RoomDao.deleteRoom(idd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("RoomServlet?hotelId=" + hotelId);
    }
}