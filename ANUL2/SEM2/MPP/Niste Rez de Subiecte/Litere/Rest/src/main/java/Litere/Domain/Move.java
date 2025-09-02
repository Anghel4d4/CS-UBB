package Litere.Domain;

import jakarta.persistence.*;

@Entity
@Table(name = "moves")
public class Move extends BaseEntity {
    @ManyToOne
    @JoinColumn(name = "game_id", nullable = false)
    private Game game;

    @Column(name = "player_letter", nullable = false)
    private String playerLetter;

    @Column(name = "server_letter", nullable = false)
    private String serverLetter;

    @Column(name = "player_letter_value", nullable = false)
    private int playerLetterValue;

    @Column(name = "server_letter_value", nullable = false)
    private int serverLetterValue;

    @Column(name = "move_number", nullable = false)
    private int moveNumber;

    @Column(name = "score", nullable = false)
    private int score;

    public Game getGame() { return game; }
    public void setGame(Game game) { this.game = game; }
    public String getPlayerLetter() { return playerLetter; }
    public void setPlayerLetter(String playerLetter) { this.playerLetter = playerLetter; }
    public String getServerLetter() { return serverLetter; }
    public void setServerLetter(String serverLetter) { this.serverLetter = serverLetter; }
    public int getPlayerLetterValue() { return playerLetterValue; }
    public void setPlayerLetterValue(int playerLetterValue) { this.playerLetterValue = playerLetterValue; }
    public int getServerLetterValue() { return serverLetterValue; }
    public void setServerLetterValue(int serverLetterValue) { this.serverLetterValue = serverLetterValue; }
    public int getMoveNumber() { return moveNumber; }
    public void setMoveNumber(int moveNumber) { this.moveNumber = moveNumber; }
    public int getScore() { return score; }
    public void setScore(int score) { this.score = score; }
}