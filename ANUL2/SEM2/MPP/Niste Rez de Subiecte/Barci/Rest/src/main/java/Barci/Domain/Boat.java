package Barci.Domain;

import jakarta.persistence.*;

@Entity
@Table(name = "boats")
public class Boat extends BaseEntity {

    @Column(name = "position1", nullable = false)
    private String position1;

    @Column(name = "position2", nullable = false)
    private String position2;

    @Column(name = "position3", nullable = false)
    private String position3;


    public String getPosition1() {
        return position1;
    }

    public void setPosition1(String position1) {
        this.position1 = position1;
    }

    public String getPosition2() {
        return position2;
    }

    public void setPosition2(String position2) {
        this.position2 = position2;
    }

    public String getPosition3() {
        return position3;
    }

    public void setPosition3(String position3) {
        this.position3 = position3;
    }
}