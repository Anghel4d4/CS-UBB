package Litere.Domain;

import jakarta.validation.constraints.*;

public class LetterSetUpdateDTO {
    @NotNull
    @Size(min = 1, max = 1)
    private String letter1;
    @NotNull
    @Min(1)
    @Max(10)
    private int value1;
    @NotNull
    @Size(min = 1, max = 1)
    private String letter2;
    @NotNull
    @Min(1)
    @Max(10)
    private int value2;
    @NotNull
    @Size(min = 1, max = 1)
    private String letter3;
    @NotNull
    @Min(1)
    @Max(10)
    private int value3;
    @NotNull
    @Size(min = 1, max = 1)
    private String letter4;
    @NotNull
    @Min(1)
    @Max(10)
    private int value4;

    public String getLetter1() { return letter1; }
    public void setLetter1(String letter1) { this.letter1 = letter1; }
    public int getValue1() { return value1; }
    public void setValue1(int value1) { this.value1 = value1; }
    public String getLetter2() { return letter2; }
    public void setLetter2(String letter2) { this.letter2 = letter2; }
    public int getValue2() { return value2; }
    public void setValue2(int value2) { this.value2 = value2; }
    public String getLetter3() { return letter3; }
    public void setLetter3(String letter3) { this.letter3 = letter3; }
    public int getValue3() { return value3; }
    public void setValue3(int value3) { this.value3 = value3; }
    public String getLetter4() { return letter4; }
    public void setLetter4(String letter4) { this.letter4 = letter4; }
    public int getValue4() { return value4; }
    public void setValue4(int value4) { this.value4 = value4; }
}