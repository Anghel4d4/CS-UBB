package Bani.Domain;

import jakarta.persistence.*;

import java.io.Serializable;


@Entity
@Table(name = "game_config")
public class GameConfig extends BaseEntity implements Serializable {

    @Column(name = "positions",nullable = false)
    private String positions;


    public GameConfig(){

    }

    public GameConfig(String positions){
        this.positions = positions;
    }


    public String getPositions(){
        return positions;
    }

    public void setPositions(String positions){
        this.positions=positions;
    }
}
