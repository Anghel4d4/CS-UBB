package Domain;

import java.io.Serializable;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "configurations")
public class Configuration extends BaseEntity implements Serializable {

    @Column
    @Min(value = 0, message = "Row must be at least 0")
    @Max(value = 2, message = "Row must be at most 2")
    private int row;

    @Column
    @Min(value = 0, message = "Column must be at least 0")
    @Max(value = 3, message = "Column must be at most 3")
    private int column;

    @Column
    @NotBlank(message = "Animal name cannot be empty")
    private String animalName;

    @Column
    @NotBlank(message = "Image URL cannot be empty")
    private String imageUrl;


    public Configuration(){

    }

    public Configuration(int row, int column, String animalName, String imageUrl){
        this.row = row;
        this.column = column;
        this.animalName = animalName;
        this.imageUrl = imageUrl;
    }

    public int getRow(){
        return row;
    }

    public void setRow(int row){
        this.row = row;
    }

    public int getColumn(){
        return column;
    }

    public void setColumn(int column){
        this.column = column;
    }

    public String getAnimalName(){
        return animalName;
    }

    public void setAnimalName(String animalName){
        this.animalName= animalName;
    }

    public String getImageUrl(){
        return imageUrl;
    }

    public void setImageUrl(String imageUrl){
        this.imageUrl = imageUrl;
    }
}
