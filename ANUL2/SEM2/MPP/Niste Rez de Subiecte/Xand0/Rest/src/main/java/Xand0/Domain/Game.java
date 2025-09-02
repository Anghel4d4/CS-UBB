package Xand0.Domain;

import jakarta.persistence.*;

@Entity
@Table(name = "games")
public class Game extends BaseEntity{

    @ManyToOne
    @JoinColumn(name = "player_id", nullable = false)
    private Player player;

    @Column(name = "points", nullable = false)
    private Integer points;

    @Column(name = "duration", nullable = false)
    private Integer duration;

    @Column(name = "outcome", nullable = false)
    private String outcome;


    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public Integer getPoints() {
        return points;
    }

    public void setPoints(Integer points) {
        this.points = points;
    }

    public Integer getDuration() {
        return duration;
    }

    public void setDuration(Integer duration) {
        this.duration = duration;
    }

    public String getOutcome() {
        return outcome;
    }

    public void setOutcome(String outcome) {
        this.outcome = outcome;
    }
}
