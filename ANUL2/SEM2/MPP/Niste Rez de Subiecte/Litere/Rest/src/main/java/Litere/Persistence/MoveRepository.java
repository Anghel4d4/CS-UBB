package Litere.Persistence;

import Litere.Domain.Move;

import java.util.List;

public interface MoveRepository {
    List<Move> findByGameId(Integer gameId);
}