package Litere.Domain;

import jakarta.persistence.*;

@Entity
@Table(name = "players")
public class Player extends BaseEntity{

    @Column(name = "alias",nullable = false)
    private String alias;

    public String getAlias(){
        return alias;
    }

    public void setAlias(String alias){
        this.alias = alias;
    }
}
