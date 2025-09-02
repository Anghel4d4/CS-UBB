package Animal.Persistence;


import Animal.Domain.Game;
import java.util.List;

public interface GameRepository {
    List<Game> findFailedGamesByPlayerNickname(String nickname);
}