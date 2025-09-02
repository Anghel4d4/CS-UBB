package Exam.Domain;

public class QuestionUpdateRequest {
    private String text;
    private String correctAnswer;
    private Integer difficultyLevel;


    public QuestionUpdateRequest() {
    }


    public QuestionUpdateRequest(String text, String correctAnswer, Integer difficultyLevel) {
        this.text = text;
        this.correctAnswer = correctAnswer;
        this.difficultyLevel = difficultyLevel;
    }

    public String getText() {
        return text;
    }

    public String getCorrectAnswer() {
        return correctAnswer;
    }

    public Integer getDifficultyLevel() {
        return difficultyLevel;
    }

}