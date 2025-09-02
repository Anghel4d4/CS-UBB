package Barci.Domain;

import jakarta.persistence.*;


@Entity
@Table(name = "users")
public class User extends BaseEntity {

    @Column(name = "alias", nullable = false,unique = true)
    private String alias;

    public String getAlias() { return alias; }
    public void setAlias(String alias) { this.alias = alias; }
}
