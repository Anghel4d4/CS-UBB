package Bani.Service;

import Bani.Domain.GameConfig;
import Bani.Domain.GameResult;

import java.util.List;

public interface IService {
    List<GameResult> getResultGames(String alias);

    GameConfig saveConfiguration(GameConfig configuration);
}
