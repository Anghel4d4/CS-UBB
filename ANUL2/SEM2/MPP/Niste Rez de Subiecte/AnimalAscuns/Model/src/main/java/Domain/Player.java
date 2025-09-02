package Domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.io.Serializable;

@Entity
@Table(name = "players")
public class Player extends BaseEntity implements Serializable {

    @Column(unique = true, nullable = false)
    @NotBlank(message = "Nickname cannot be empty")
    @Size(min = 3, max = 50, message = "Nickname must be between 3 and 50 characters")
    private String nickname;


    public Player(){

    }

    public Player(String nickname){
        this.nickname = nickname;
    }

    public String getNickname(){
        return nickname;
    }

    public void setNickname(String nickname){
        this.nickname = nickname;
    }
}
