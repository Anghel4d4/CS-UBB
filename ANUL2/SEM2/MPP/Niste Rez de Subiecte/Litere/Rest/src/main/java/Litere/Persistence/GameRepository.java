package Litere.Persistence;

import Litere.Domain.Game;

import java.util.List;

public interface GameRepository {
    List<Game> findGamesWithMatchingLettersByPlayerAlias(String alias);
}