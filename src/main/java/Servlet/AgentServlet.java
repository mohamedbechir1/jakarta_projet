package Servlet;




import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import Models.Hotel;
import dao.DataBaseConnection;

public class AgentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filterName = request.getParameter("name");
        String filterCity = request.getParameter("city");
        String filterStars = request.getParameter("stars");

        List<Hotel> hotels = new ArrayList<>();
        try (Connection conn = DataBaseConnection.getConnection()) {
            String sql = "SELECT * FROM hotels ";
            boolean test=false;
            if (filterName != null && !filterName.isEmpty()) {
                sql += "where name LIKE ?";
                test=true;
            }
            if (filterCity != null && !filterCity.isEmpty()) {
                if(test==false)
                {
                    sql+="where city LIKE ? ";
                    test=true;
                }
                else
                    sql += " AND city LIKE ? ";
            }
            if (filterStars != null && !filterStars.isEmpty()) {
                if(test==false)
                {
                    sql+="where stars = ? ";
                    test=true;
                }
                else
                    sql += " AND stars = ?";
            }

            PreparedStatement statement = conn.prepareStatement(sql);
            int paramIndex = 1;
            if (filterName != null && !filterName.isEmpty()) {
                statement.setString(paramIndex++, "%" + filterName + "%");
            }
            if (filterCity != null && !filterCity.isEmpty()) {
                statement.setString(paramIndex++, "%" + filterCity + "%");
            }
            if (filterStars != null && !filterStars.isEmpty()) {
                statement.setInt(paramIndex++, Integer.parseInt(filterStars));
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

        request.setAttribute("hotel", hotels);
        RequestDispatcher dispatcher = request.getRequestDispatcher("agent.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try (Connection conn = DataBaseConnection.getConnection()) {
            if ("addHotel".equals(action)) {
                String name = request.getParameter("name");
                String city = request.getParameter("city");
                int stars = Integer.parseInt(request.getParameter("stars"));
                String description = request.getParameter("description");

                String sql = "INSERT INTO hotels (name, city, image, descriptions,stars) VALUES (?, ?, ?, ?,?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, name);
                statement.setString(2, city);
                statement.setString(3,"image.png" );
                statement.setString(4, description);
                statement.setInt(5, stars);
                statement.executeUpdate();
            } else if ("deleteHotel".equals(action)) {
                char id = request.getParameter("id").charAt(0);
                String idd=String.valueOf(id);
                String sql = "DELETE FROM hotels WHERE id = ?";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, idd );
                statement.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("AgentServlet");
    }
}
