package Animal.Controller;


import Animal.Domain.FailedGameDTO;
import Animal.Service.GameService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/players")
public class GameController {
    private static final Logger logger = LogManager.getLogger(GameController.class);
    private final GameService gameService;

    public GameController(GameService gameService) {
        this.gameService = gameService;
        logger.info("GameController initialized");
    }

    @GetMapping("/{nickname}/failed-games")
    public ResponseEntity<List<FailedGameDTO>> getFailedGames(@PathVariable String nickname) {
        logger.info("Received request to get failed games for player: {}", nickname);
        try {
            List<FailedGameDTO> failedGames = gameService.getFailedGamesByPlayerNickname(nickname);
            logger.info("Returning {} failed games for player: {}", failedGames.size(), nickname);
            return ResponseEntity.ok(failedGames);
        } catch (Exception e) {
            logger.error("Error handling request for failed games for player: {}", nickname, e);
            return ResponseEntity.status(500).body(null);
        }
    }
}