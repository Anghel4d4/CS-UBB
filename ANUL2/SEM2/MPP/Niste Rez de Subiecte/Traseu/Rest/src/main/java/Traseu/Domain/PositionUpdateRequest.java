package Traseu.Domain;

public class PositionUpdateRequest {
    private int oldRow;
    private int oldCol;
    private int newRow;
    private int newCol;



    public int getOldRow() {
        return oldRow;
    }

    public void setOldRow(int oldRow) {
        this.oldRow = oldRow;
    }

    public int getOldCol() {
        return oldCol;
    }
    
    public void setOldCol(int oldCol) {
        this.oldCol = oldCol;
    }

    public int getNewRow() {
        return newRow;
    }

    public void setNewRow(int newRow) {
        this.newRow = newRow;
    }

    public int getNewCol() {
        return newCol;
    }

    public void setNewCol(int newCol) {
        this.newCol = newCol;
    }


}
