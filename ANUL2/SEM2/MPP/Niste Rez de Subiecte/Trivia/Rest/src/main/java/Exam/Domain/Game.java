package Exam.Domain;

import jakarta.persistence.*;


@Entity
@Table(name = "games")
public class Game extends BaseEntity{

    @ManyToOne
    @JoinColumn(name = "player_id", nullable = false)
    private Player player;

    @Column(name = "start_time", nullable = false)
    private String startTime;

    @Column(name = "total_points", nullable = false)
    private Integer totalPoints;

    @Column(name = "duration_seconds", nullable = false)
    private Integer durationSeconds;

    public Player getPlayer() {
        return player;
    }

    public void setPlayer(Player player) {
        this.player = player;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public Integer getTotalPoints() {
        return totalPoints;
    }

    public void setTotalPoints(Integer totalPoints) {
        this.totalPoints = totalPoints;
    }

    public Integer getDurationSeconds() {
        return durationSeconds;
    }

    public void setDurationSeconds(Integer durationSeconds) {
        this.durationSeconds = durationSeconds;
    }
}
