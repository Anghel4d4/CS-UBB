package Xand0.Persistence;

import Xand0.Domain.Game;

import java.util.List;

public interface  IGameRepository {
    List<Game> findWonGamesByPlayerAlias(String alias);
}
