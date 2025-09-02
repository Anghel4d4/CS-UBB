package Traseu.Domain;


import jakarta.persistence.*;

import java.time.OffsetDateTime;

@Entity
@Table(name = "player_progress")
public class PlayerProgress extends BaseEntity{

    @Column(name = "alias",nullable = false)
    private String alias;

    @ManyToOne
    @JoinColumn(name = "config_id",nullable = false)
    private PathConfig pathConfig;

    @Column(name = "moves", nullable = false)
    private String moves;

    @Column(name = "score", nullable = false)
    private int score;

    @Column(name = "finalized", nullable = false)
    private boolean finalized;

    @Column(name = "duration_seconds")
    private Integer durationSeconds;

    @Column(name = "created_at", nullable = false)
    private String createdAt;


    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public PathConfig getPathConfig() {
        return pathConfig;
    }

    public void setPathConfig(PathConfig pathConfig) {
        this.pathConfig = pathConfig;
    }

    public String getMoves() {
        return moves;
    }

    public void setMoves(String moves) {
        this.moves = moves;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public boolean isFinalized() {
        return finalized;
    }

    public void setFinalized(boolean finalized) {
        this.finalized = finalized;
    }

    public Integer getDurationSeconds() {
        return durationSeconds;
    }

    public void setDurationSeconds(Integer durationSeconds) {
        this.durationSeconds = durationSeconds;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }


}
