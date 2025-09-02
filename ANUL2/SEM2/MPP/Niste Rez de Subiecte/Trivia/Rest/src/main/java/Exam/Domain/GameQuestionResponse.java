package Exam.Domain;


public class GameQuestionResponse {
    private String questionText;
    private String playerAnswer;
    private String correctAnswer;
    private Integer pointsEarned;
    private Integer difficultyLevel;


    public GameQuestionResponse() {
    }


    public GameQuestionResponse(String questionText, String playerAnswer, String correctAnswer, Integer pointsEarned, Integer difficultyLevel) {
        this.questionText = questionText;
        this.playerAnswer = playerAnswer;
        this.correctAnswer = correctAnswer;
        this.pointsEarned = pointsEarned;
        this.difficultyLevel = difficultyLevel;
    }


    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public String getPlayerAnswer() {
        return playerAnswer;
    }

    public void setPlayerAnswer(String playerAnswer) {
        this.playerAnswer = playerAnswer;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(String correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public Integer getPointsEarned() {
        return pointsEarned;
    }

    public void setPointsEarned(Integer pointsEarned) {
        this.pointsEarned = pointsEarned;
    }

    public Integer getDifficultyLevel() {
        return difficultyLevel;
    }

    public void setDifficultyLevel(Integer difficultyLevel) {
        this.difficultyLevel = difficultyLevel;
    }
}