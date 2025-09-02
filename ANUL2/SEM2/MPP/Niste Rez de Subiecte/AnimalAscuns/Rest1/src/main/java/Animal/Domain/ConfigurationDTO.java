package Animal.Domain;

public class ConfigurationDTO {
    private Integer row;
    private Integer column;
    private String animalName;
    private String imageUrl;

    public ConfigurationDTO() {
    }

    public Integer getRow() { return row; }
    public void setRow(Integer row) { this.row = row; }
    public Integer getColumn() { return column; }
    public void setColumn(Integer column) { this.column = column; }
    public String getAnimalName() { return animalName; }
    public void setAnimalName(String animalName) { this.animalName = animalName; }
    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
}