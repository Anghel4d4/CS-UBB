package Exam.Domain;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;

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
