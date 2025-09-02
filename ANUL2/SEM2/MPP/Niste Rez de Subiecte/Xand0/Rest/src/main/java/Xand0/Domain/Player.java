package Xand0.Domain;


import jakarta.persistence.*;

@Entity
@Table(name = "players")
public class Player extends BaseEntity{

    @Column(name = "alias", nullable = false)
    private String alias;


    public Player(){

    }

    public String getAlias(){
        return alias;
    }

    public void setAlias(String alias){
        this.alias = alias;
    }
}
