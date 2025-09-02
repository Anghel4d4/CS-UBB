package Xand0.Domain;

import jakarta.persistence.*;

@Entity
@Table(name = "moves")
public class Move extends BaseEntity {

    @Column(name = "game_id", nullable = false)
    private Integer gameId;

    @Column(name = "row_position", nullable = false)
    private Integer rowPosition;

    @Column(name = "col_position", nullable = false)
    private Integer colPosition;

    @Column(name = "mark", nullable = false)
    private String mark;

    public Integer getGameId() {
        return gameId;
    }

    public void setGameId(Integer gameId) {
        this.gameId = gameId;
    }

    public Integer getRowPosition() {
        return rowPosition;
    }

    public void setRowPosition(Integer rowPosition) {
        this.rowPosition = rowPosition;
    }

    public Integer getColPosition() {
        return colPosition;
    }

    public void setColPosition(Integer colPosition) {
        this.colPosition = colPosition;
    }

    public String getMark() {
        return mark;
    }

    public void setMark(String mark) {
        this.mark = mark;
    }
}
