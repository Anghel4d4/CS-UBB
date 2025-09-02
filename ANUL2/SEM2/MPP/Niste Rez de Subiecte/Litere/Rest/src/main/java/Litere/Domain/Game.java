package Litere.Domain;

import jakarta.persistence.*;

@Entity
@Table(name = "games")
public class Game extends BaseEntity {
    @ManyToOne
    @JoinColumn(name = "player_id", nullable = false)
    private Player player;

    @ManyToOne
    @JoinColumn(name = "letter_set_id", nullable = false)
    private LetterSet letterSet;

    @Column(name = "start_date_time", nullable = false)
    private String startDateTime;

    @Column(name = "total_score", nullable = false)
    private int totalScore;

    @Column(name = "finalized", nullable = false)
    private boolean finalized;

    public String getStartDateTime() { return startDateTime; }
    public int getTotalScore() { return totalScore; }

}