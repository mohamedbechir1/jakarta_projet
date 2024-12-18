package Models;

import java.util.List;

public class Hotel {

    public int id;
    public String name;
    public String city;
    public int stars;
    public String descriptions;
    public String image;

    public Hotel(int id,String name,String city,int stars,String description
            ,String image){
        this.id=id;
        this.city=city;
        this.descriptions=description;
        this.image=image;
        this.name=name;
        this.stars=stars;

    }
}
