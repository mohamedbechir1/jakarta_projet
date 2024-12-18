package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Models.Hotel;

public class AgentDao {

    public static List<Hotel>getHotels(String filterName,String filterCity,String filterStars){

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
        return hotels;

    }


    public static void createHotel(String name,String city,int stars,String description) {
        try (Connection conn = DataBaseConnection.getConnection()) {


            String sql = "INSERT INTO hotels (name, city, image, descriptions,stars) VALUES (?, ?, ?, ?,?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, city);
            statement.setString(3,"image.png" );
            statement.setString(4, description);
            statement.setInt(5, stars);
            statement.executeUpdate();
        }

        catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void deleteHotel(String id) {
        try (Connection conn = DataBaseConnection.getConnection()) {
            String sql = "DELETE FROM hotels WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id );
            statement.executeUpdate();
        }catch(Exception e) {

        }
    }


    public static Hotel getHotelById(int hotelId) {
        Hotel hotel=new Hotel(0,"","",0,""
                ,"");
        try (Connection conn = DataBaseConnection.getConnection()) {
            String query = "SELECT * FROM hotels WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setInt(1, hotelId);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {

                hotel.id= resultSet.getInt("id");
                hotel.name= resultSet.getString("name");
                hotel.city=resultSet.getString("city");
                hotel.stars= resultSet.getInt("stars");
                hotel.descriptions= resultSet.getString("descriptions");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return hotel;
    }


    public static void updateHotel(String name,String city,int stars,String description,int id) {
        try (Connection conn = DataBaseConnection.getConnection()) {
            String query = "UPDATE hotels SET name = ?, city = ?, stars = ?,  image= ?,descriptions = ? WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, name);
            statement.setString(2, city);
            statement.setInt(3, stars);
            statement.setString(4, description);
            statement.setString(5, description);
            statement.setInt(6, id);

            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
