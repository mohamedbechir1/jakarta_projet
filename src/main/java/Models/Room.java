package Models;

import java.math.BigDecimal;

public class Room {
    public  int id;
    public  int hotelId;
    public  String label;
    public  int capacity;
    public double price;

    public Room(int id, int hotelId, String label, int capacity, double price) {
        this.id = id;
        this.hotelId = hotelId;
        this.label = label;
        this.capacity = capacity;
        this.price = price;
    }


}
