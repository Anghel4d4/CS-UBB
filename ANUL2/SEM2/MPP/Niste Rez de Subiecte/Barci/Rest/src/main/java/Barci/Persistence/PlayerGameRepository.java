package Barci.Persistence;

import Barci.Domain.PlayerGame;

import java.util.List;

public interface PlayerGameRepository {
    List<PlayerGame> findByPlayerAlias(String playerAlias);
}