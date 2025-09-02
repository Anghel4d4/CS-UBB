package Litere.Persistence;

import Litere.Domain.Player;

public interface PlayerRepository {
    Player findByAlias(String alias);
}