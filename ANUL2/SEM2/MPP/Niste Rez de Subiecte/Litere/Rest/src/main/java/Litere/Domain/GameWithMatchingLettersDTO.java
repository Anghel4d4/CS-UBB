package Litere.Domain;

import java.util.List;

public class GameWithMatchingLettersDTO {
    private Integer id;
    private int totalScore;
    private String startDateTime;
    private List<String> playerLetters;
    private List<String> serverLetters;

    public GameWithMatchingLettersDTO(Integer id, int totalScore, String startDateTime, List<String> playerLetters, List<String> serverLetters) {
        this.id = id;
        this.totalScore = totalScore;
        this.startDateTime = startDateTime;
        this.playerLetters = playerLetters;
        this.serverLetters = serverLetters;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(int totalScore) {
        this.totalScore = totalScore;
    }

    public String getStartDateTime() {
        return startDateTime;
    }

    public void setStartDateTime(String startDateTime) {
        this.startDateTime = startDateTime;
    }

    public List<String> getPlayerLetters() {
        return playerLetters;
    }

    public void setPlayerLetters(List<String> playerLetters) {
        this.playerLetters = playerLetters;
    }

    public List<String> getServerLetters() {
        return serverLetters;
    }

    public void setServerLetters(List<String> serverLetters) {
        this.serverLetters = serverLetters;
    }
}