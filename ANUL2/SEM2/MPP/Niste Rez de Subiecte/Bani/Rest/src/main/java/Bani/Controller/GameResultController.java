package Bani.Controller;

import Bani.Domain.GameResult;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import Bani.Service.ServiceImpl;

import java.util.List;

@RestController
@RequestMapping("/api/results")
public class GameResultController {
    private static final Logger logger = LogManager.getLogger(GameResultController.class);


    @Autowired
    private ServiceImpl gameService;


    @GetMapping("/{alias}")
    public ResponseEntity<?> getPlayerResults(@PathVariable String alias) {
        logger.info("Received request to get results for player with alias: {}", alias);
        try {
            List<GameResult> results = gameService.getResultGames(alias);
            logger.info("Found {} results for player with alias: {}", results.size(), alias);
            return ResponseEntity.ok(results);
        } catch (Exception e) {
            logger.error("Error retrieving results for alias {}: {}", alias, e.getMessage(), e);
            return ResponseEntity.internalServerError().body("Error retrieving results: " + e.getMessage());
        }
    }
}