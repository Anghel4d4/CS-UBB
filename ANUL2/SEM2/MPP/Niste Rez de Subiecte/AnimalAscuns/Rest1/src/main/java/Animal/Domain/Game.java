package Animal.Domain;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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


    @Column(name= "start_time", nullable = false)
    @NotNull(message = "Start time cannot be null" )
    @Convert(converter = LocalDateTimeConverter.class)
    private LocalDateTime startTime;

    @Column(name = "number_of_guesses", nullable = false)
    @Min(value = 0, message = "Number of guesses cannot be negative")
    private Integer numberOfGuesses;

    @Column(name= "is_successful", nullable = false)
    private Integer isSuccessful;

    @OneToMany(mappedBy = "game", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<Guess> guesses = new ArrayList<>();


    public Game() {
    }


    public Game(Player player, Configuration configuration, LocalDateTime startTime) {
        this.player = player;
        this.configuration = configuration;
        this.startTime = startTime;
        this.numberOfGuesses = 0;
        this.isSuccessful = 0;
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

    public Integer isSuccessful() {
        return isSuccessful;
    }
    public void setSuccessful(Integer isSuccessful) {
        this.isSuccessful = isSuccessful;
    }

    public List<Guess> getGuesses() { return guesses; }
    public void setGuesses(List<Guess> guesses) { this.guesses = guesses; }
}
