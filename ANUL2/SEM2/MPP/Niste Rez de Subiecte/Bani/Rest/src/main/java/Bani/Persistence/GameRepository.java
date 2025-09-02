package Bani.Persistence;

import Bani.Domain.GameConfig;
import Bani.Domain.GameResult;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface GameRepository {

    List<GameResult> finResultByAlias(String alias);
    GameConfig save(GameConfig configuration);
}
