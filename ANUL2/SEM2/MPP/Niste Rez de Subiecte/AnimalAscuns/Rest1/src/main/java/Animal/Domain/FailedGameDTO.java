package Animal.Domain;

import java.util.List;

public class FailedGameDTO {
    private int numberOfGuesses;
    private List<Position> proposedPositions;
    private Position animalPosition;

    public static class Position {
        private int row;
        private int column;

        public Position(int row, int column) {
            this.row = row;
            this.column = column;
        }

        public int getRow() { return row; }
        public void setRow(int row) { this.row = row; }
        public int getColumn() { return column; }
        public void setColumn(int column) { this.column = column; }
    }

    public FailedGameDTO(int numberOfGuesses, List<Position> proposedPositions, Position animalPosition) {
        this.numberOfGuesses = numberOfGuesses;
        this.proposedPositions = proposedPositions;
        this.animalPosition = animalPosition;
    }

    public int getNumberOfGuesses() { return numberOfGuesses; }
    public void setNumberOfGuesses(int numberOfGuesses) { this.numberOfGuesses = numberOfGuesses; }
    public List<Position> getProposedPositions() { return proposedPositions; }
    public void setProposedPositions(List<Position> proposedPositions) { this.proposedPositions = proposedPositions; }
    public Position getAnimalPosition() { return animalPosition; }
    public void setAnimalPosition(Position animalPosition) { this.animalPosition = animalPosition; }
}