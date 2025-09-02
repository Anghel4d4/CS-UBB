package Bani.Controller;


import Bani.Domain.GameConfig;
import Bani.Service.ServiceImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/config")
@CrossOrigin(origins = "http://localhost:5173")
public class GameConfigController {
    private static final Logger logger = LogManager.getLogger(GameConfigController.class);

    @Autowired
    private ServiceImpl gameService;

    @PostMapping
    public ResponseEntity<GameConfig> addGameConfig(@RequestBody GameConfig configuration) {
        logger.info("Received request to add game configuration");
        try {
            logger.debug("Configuration positions: {}", configuration.getPositions());
            GameConfig saved = gameService.saveConfiguration(configuration);
            logger.info("Successfully saved configuration with ID: {}", saved.getId());
            return ResponseEntity.ok(saved);
        } catch (Exception e) {
            logger.error("Error saving game configuration: {}", e.getMessage(), e);
            throw e;
        }
    }
}
