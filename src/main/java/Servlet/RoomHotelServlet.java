package Servlet;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import Models.Room;
import dao.DataBaseConnection;
public class RoomHotelServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int hotelId = Integer.parseInt(request.getParameter("hotelId"));
        String maxPrice = request.getParameter("maxPrice");
        List<Room> rooms = new ArrayList<>();
        try (Connection conn = DataBaseConnection.getConnection()) {
            StringBuilder hotelQuery =new StringBuilder("SELECT * FROM hotels WHERE id = ?");

            System.out.println(maxPrice+" here");
            PreparedStatement hotelStatement = conn.prepareStatement(hotelQuery.toString());
            hotelStatement.setInt(1, hotelId);
            if(maxPrice != null && !maxPrice.isEmpty())
                hotelStatement.setDouble(1,Double.parseDouble(maxPrice) );
            ResultSet hotelResultSet = hotelStatement.executeQuery();
            if (hotelResultSet.next()) {
                request.setAttribute("hotelName", hotelResultSet.getString("name"));
            }
            StringBuilder roomQuery =new StringBuilder( "SELECT * FROM rooms WHERE hotel_id = ?");
            if (maxPrice != null && !maxPrice.isEmpty()) {
                roomQuery.append(" AND price <= ?");
            }
            PreparedStatement roomStatement = conn.prepareStatement(roomQuery.toString());
            roomStatement.setInt(1, hotelId);
            if (maxPrice != null && !maxPrice.isEmpty()) {
                roomStatement.setDouble(2,Double.parseDouble(maxPrice) );
            }
            ResultSet roomResultSet = roomStatement.executeQuery();
            while (roomResultSet.next()) {
                rooms.add(new Room(
                        roomResultSet.getInt("id"),
                        roomResultSet.getInt("hotel_id"),
                        roomResultSet.getString("label"),
                        roomResultSet.getInt("capacity"),
                        roomResultSet.getDouble("price")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("rooms", rooms);

        request.setAttribute("hotelId", hotelId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("roomhotel.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
