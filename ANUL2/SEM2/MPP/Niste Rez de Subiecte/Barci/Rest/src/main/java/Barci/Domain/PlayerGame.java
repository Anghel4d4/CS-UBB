package Barci.Domain;


import jakarta.persistence.*;

@Entity
@Table(name = "player_games")
public class PlayerGame extends BaseEntity {

    @ManyToOne
    @JoinColumn(name = "player_alias", referencedColumnName = "alias", nullable = false)
    private User user;

    @Column(name = "game_id", nullable = false)
    private Integer gameId;

    @Column(name = "guessed_positions", nullable = false)
    private String guessedPositions;

    @Column(name = "boat_positions", nullable = false)
    private String boatPositions;

    @Column(name = "score", nullable = false)
    private Integer score;

    @Column(name = "game_start_time", nullable = false)
    private String gameStartTime;


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Integer getGameId() {
        return gameId;
    }

    public void setGameId(Integer gameId) {
        this.gameId = gameId;
    }

    public String getGuessedPositions() {
        return guessedPositions;
    }

    public void setGuessedPositions(String guessedPositions) {
        this.guessedPositions = guessedPositions;
    }

    public String getBoatPositions() {
        return boatPositions;
    }

    public void setBoatPositions(String boatPositions) {
        this.boatPositions = boatPositions;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public String getGameStartTime() {
        return gameStartTime;
    }

    public void setGameStartTime(String gameStartTime) {
        this.gameStartTime = gameStartTime;
    }
}
