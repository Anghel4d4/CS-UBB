package Xand0.Persistence;

import Xand0.Domain.Move;

public interface IMoveRepository {
    void saveMove(Move move);
    boolean isPositionTaken(Integer gameId, Integer row, Integer col);
    boolean gameExists(Integer gameId);
}