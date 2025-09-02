package Bani.Domain;

import jakarta.persistence.*;


import java.io.Serializable;

@Entity
@Table(name = "game_result")
public class GameResult extends BaseEntity implements Serializable {

    @Column(name ="alias",nullable = false)
    private String alias;

    @Column(name ="date",nullable = false)
    private String date;

    @Column(name ="score",nullable = false)
    private int score;

    @Column(name="finalized", nullable = false)
    private int finalized = 0;


    public GameResult(){

    }

    public GameResult(String alias, String date, int score, int finalized){
        this.alias = alias;
        this.date = date;
        this.score = score;
        this.finalized = finalized;
    }

    public String getAlias() {
        return alias;
    }
    public void setAlias(String alias) {
        this.alias = alias;
    }
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
       }
    public int getScore() {
        return score;
    }
    public void setScore(int score) {
        this.score = score;
    }

    public int getFinalized(){
        return finalized;
    }

    public void setFinalized(int finalized){
        this.finalized = finalized;
    }


}
