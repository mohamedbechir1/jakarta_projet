package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import Models.Room;

public class RoomDao {
    public static List<Room>getRooms(int id){
        List<Room> rooms = new ArrayList<>();
        try (Connection conn = DataBaseConnection.getConnection()) {

            String roomQuery = "SELECT * FROM rooms WHERE hotel_id = ?";
            PreparedStatement roomStatement = conn.prepareStatement(roomQuery);
            roomStatement.setInt(1, id);
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
        return rooms;
    }

    public static void deleteRoom(String id) {
        try(Connection conn = DataBaseConnection.getConnection()) {
            String sql = "DELETE FROM rooms WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addRoom(String id,String label,int capacity,double price) {
        try (Connection conn = DataBaseConnection.getConnection()) {
            String sql = "INSERT INTO rooms (hotel_id, label, capacity, price) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, id);
            statement.setString(2, label);
            statement.setInt(3, capacity);
            statement.setDouble(4, price);
            statement.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Room getRoomById(int roomId) {
        Room room=new Room(0,0," ",0, 0.0);
        try (Connection conn = DataBaseConnection.getConnection()) {
            String query = "SELECT * FROM rooms WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setInt(1, roomId);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                room.id= resultSet.getInt("id");
                room.label= resultSet.getString("label");
                room.capacity= resultSet.getInt("capacity");
                room.price= resultSet.getDouble("price");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }

    public static void updateRoom(String label,int capacity,double price,int id) {
        try (Connection conn = DataBaseConnection.getConnection()) {
            String query = "UPDATE rooms SET label = ?, capacity = ?, price = ? WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, label);
            statement.setInt(2, capacity);
            statement.setDouble(3, price);
            statement.setInt(4, id);

            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
