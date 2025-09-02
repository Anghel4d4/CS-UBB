package Barci.Persistence;

import Barci.Domain.Boat;

public interface BoatRepository {
    void saveBoat(Boat boat);
    boolean arePositionsValid(String pos1, String pos2, String pos3);
}