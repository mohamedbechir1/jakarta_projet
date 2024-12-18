package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Models.Account;

public class AdminDao {
    public static List<Account> getAgent(){
        List<Account> agents = new ArrayList<>();
        try (Connection conn = DataBaseConnection.getConnection()) {
            String sql = "SELECT * FROM accounts";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Account agent = new Account(

                        resultSet.getString("username"),
                        resultSet.getString("password"),
                        resultSet.getString("role"),
                        resultSet.getString("email")
                );
                agent.id=resultSet.getInt("id");
                agents.add(agent);
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return agents;
    }

    public static void createAccount(String username, String password,String role,String email) {
        try (Connection conn = DataBaseConnection.getConnection()) {
            String sql = "INSERT INTO accounts (username, password, role, email) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, role);
            statement.setString(4, email);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void deleteAccount(String agentId) {
        try (Connection conn = DataBaseConnection.getConnection()) {
            String sql = "DELETE FROM accounts WHERE id = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, agentId);
            statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}