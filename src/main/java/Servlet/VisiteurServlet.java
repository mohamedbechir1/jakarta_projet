package Servlet;



import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Models.Hotel;
import dao.DataBaseConnection;

public class VisiteurServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String city = request.getParameter("city");
        String minStars = request.getParameter("minStars");
        String maxPrice = request.getParameter("maxPrice");

        List<Hotel> hotels = new ArrayList<>();

        try (Connection conn = DataBaseConnection.getConnection()) {
            StringBuilder query = new StringBuilder("SELECT * FROM hotels WHERE 1=1");

            if (city != null && !city.isEmpty()) {
                query.append(" AND city LIKE ?");
            }
            if (minStars != null && !minStars.isEmpty()) {
                query.append(" AND stars >= ?");
            }
            if (maxPrice != null && !maxPrice.isEmpty()) {
                query.append(" AND price_per_night <= ?");
            }

            PreparedStatement statement = conn.prepareStatement(query.toString());

            int paramIndex = 1;
            if (city != null && !city.isEmpty()) {
                statement.setString(paramIndex++, "%"+city+"%");
            }
            if (minStars != null && !minStars.isEmpty()) {
                statement.setInt(paramIndex++, Integer.parseInt(minStars));
            }
            if (maxPrice != null && !maxPrice.isEmpty()) {
                statement.setDouble(paramIndex++, Double.parseDouble(maxPrice));
            }

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                hotels.add(new Hotel(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getString("city"),
                        resultSet.getInt("stars"),
                        resultSet.getString("descriptions"),
                        resultSet.getString("image")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("hotels for visiteur "+hotels.size());
        request.setAttribute("hotels", hotels);
        RequestDispatcher dispatcher = request.getRequestDispatcher("visiteur.jsp");
        dispatcher.forward(request, response);
    }
}
