package Traseu.Controller;

import Traseu.Domain.PathConfig;
import Traseu.Domain.PlayerProgress;
import Traseu.Domain.PositionUpdateRequest;
import Traseu.Persistence.PathRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:5173")
public class GameController {
    private static final Logger logger = LogManager.getLogger(GameController.class);
    private final PathRepository repository;

    @Autowired
    public GameController(PathRepository repository) {
        this.repository = repository;
    }

    @GetMapping("/progress/{alias}")
    public ResponseEntity<List<PlayerProgress>> getUnfinishedGames(@PathVariable String alias) {
        logger.debug("Fetching unfinished games for alias: {}", alias);
        try {
            List<PlayerProgress> games = repository.findUnfinishedGamesByAlias(alias);
            if (games.isEmpty()) {
                logger.info("No unfinished games found for alias: {}", alias);
                return ResponseEntity.noContent().build();
            }
            logger.info("Found {} unfinished games for alias: {}", games.size(), alias);
            return ResponseEntity.ok(games);
        } catch (Exception e) {
            logger.error("Error fetching unfinished games for alias {}: ", alias, e);
            return ResponseEntity.internalServerError().build();
        }
    }

    @PutMapping("/path/{configId}")
    public ResponseEntity<Void> updatePositionType(
            @PathVariable Long configId,
            @RequestBody PositionUpdateRequest request) {

        logger.debug("Replacing obstacle in config {}: [{} , {}] → [{},{}]",
                configId,
                request.getOldRow(), request.getOldCol(),
                request.getNewRow(), request.getNewCol());

        try {
            repository.updateObstacleCoordinates(
                    configId,
                    request.getOldRow(), request.getOldCol(),
                    request.getNewRow(), request.getNewCol()
            );
            logger.info("Obstacle coordinates updated for configId: {}", configId);
            return ResponseEntity.ok().build();
        } catch (Exception e) {
            logger.error("Error updating obstacle coordinates for configId {}: ", configId, e);
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/path/{configId}")
    public ResponseEntity<PathConfig> getConfigById(@PathVariable Long configId) {
        logger.debug("Fetching configuration with id: {}", configId);
        try {
            PathConfig config = repository.findConfigById(configId);
            if (config == null) {
                logger.info("No configuration found with id: {}", configId);
                return ResponseEntity.notFound().build();
            }
            logger.info("Found configuration with id: {}", configId);
            return ResponseEntity.ok(config);
        } catch (Exception e) {
            logger.error("Error fetching configuration with id {}: ", configId, e);
            return ResponseEntity.internalServerError().build();
        }
    }

    @GetMapping("/configs")
    public ResponseEntity<List<PathConfig>> getAllConfigs() {
        logger.debug("Fetching all configurations");
        try {
            List<PathConfig> configs = repository.findAllConfigs();
            if (configs.isEmpty()) {
                logger.info("No configurations found");
                return ResponseEntity.noContent().build();
            }
            logger.info("Found {} configurations", configs.size());
            return ResponseEntity.ok(configs);
        } catch (Exception e) {
            logger.error("Error fetching configurations: ", e);
            return ResponseEntity.internalServerError().build();
        }
    }

}