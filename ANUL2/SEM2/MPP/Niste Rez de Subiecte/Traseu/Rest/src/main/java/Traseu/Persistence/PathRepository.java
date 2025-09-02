package Traseu.Persistence;


import Traseu.Domain.PathConfig;
import Traseu.Domain.PlayerProgress;

import java.util.List;

public interface PathRepository {

    List<PlayerProgress> findUnfinishedGamesByAlias(String alias);

    void updateObstacleCoordinates(
            Long configId,
            int oldRow, int oldCol,
            int newRow, int newCol);

    PathConfig findConfigById(Long configId);

    List<PathConfig> findAllConfigs();
}
