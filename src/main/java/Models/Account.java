package Models;

public class Account{
    public  String username;
    public  String password;
    public  String role;
    public  String email;
    public int id=-1;

    public Account(String username, String password, String role, String email) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getRole() {
        return role;
    }

    public String getEmail() {
        return email;
    }
}

