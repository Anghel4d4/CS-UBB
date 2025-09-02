package Domain;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "games")
public class Game extends BaseEntity implements Serializable {

    @ManyToOne
    @JoinColumn(name = "player_id", nullable = false)
    @NotNull(message = "Player cannot be null")
    private Player player;

    @ManyToOne
    @JoinColumn(name = "configuration_id", nullable = false)
    @NotNull(message = "Configuration cannot be null")
    private Configuration configuration;


    @Column(nullable = false)
    @NotNull(message = "Start time cannot be null" )
    @Convert(converter = LocalDateTimeConverter.class)
    private LocalDateTime startTime;

    @Column
    @Min(value = 0, message = "Number of guesses cannot be negative")
    private Integer numberOfGuesses;

    @Column
    private boolean isSuccessful;


    public Game() {
    }


    public Game(Player player, Configuration configuration, LocalDateTime startTime) {
        this.player = player;
        this.configuration = configuration;
        this.startTime = startTime;
        this.numberOfGuesses = 0;
        this.isSuccessful = false;
    }


    public Player getPlayer() {
        return player;
    }
    public void setPlayer(Player player) {
        this.player = player;
    }

    public Configuration getConfiguration() {
        return configuration;
    }
    public void setConfiguration(Configuration configuration) {
        this.configuration = configuration; }

    public LocalDateTime getStartTime() {
        return startTime;
    }
    public void setStartTime(LocalDateTime startTime) {
        this.startTime = startTime;
    }

    public Integer getNumberOfGuesses() {
        return numberOfGuesses;
    }
    public void setNumberOfGuesses(Integer numberOfGuesses) {
        this.numberOfGuesses = numberOfGuesses;
    }

    public boolean isSuccessful() {
        return isSuccessful;
    }
    public void setSuccessful(boolean successful) {
        this.isSuccessful = successful;
    }
}
