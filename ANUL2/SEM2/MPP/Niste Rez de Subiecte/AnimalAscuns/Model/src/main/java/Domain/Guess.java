package Domain;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "guesses")
public class Guess extends BaseEntity {
    @ManyToOne
    @JoinColumn(name = "game_id", nullable = false)
    @NotNull(message = "Game cannot be null")
    private Game game;

    @Column
    @Min(value = 0, message = "Row must be at least 0")
    @Max(value = 2, message = "Row must be at most 2")
    private int row;

    @Column
    @Min(value = 0, message = "Column must be at least 0")
    @Max(value = 3, message = "Column must be at most 3")
    private int column;

    @Column
    private String direction;

    @Column
    @NotNull(message = "Timestamp cannot be null")
    @Convert(converter = LocalDateTimeConverter.class)
    private LocalDateTime timestamp;


    public Guess() {
    }


    public Guess(Game game, int row, int column, String direction, LocalDateTime timestamp) {
        this.game = game;
        this.row = row;
        this.column = column;
        this.direction = direction;
        this.timestamp = timestamp;
    }


    public Game getGame() {
        return game;
    }
    public void setGame(Game game) {
        this.game = game;
    }
    public int getRow() {
        return row;
    }
    public void setRow(int row) {
        this.row = row;
    }
    public int getColumn() {
        return column;
    }
    public void setColumn(int column) {
        this.column = column;
    }
    public String getDirection() {
        return direction;
    }
    public void setDirection(String direction) {
        this.direction = direction;
    }
    public LocalDateTime getTimestamp() {
        return timestamp;
    }
    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }
}