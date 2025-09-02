package Xand0.Controller;

import Xand0.Domain.Game;
import Xand0.Domain.Move;
import Xand0.Domain.PositionRequest;
import Xand0.Persistence.IGameRepository;
import Xand0.Persistence.IMoveRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/games")
@CrossOrigin(origins = "http://localhost:3000")
public class GameController {
    private static final Logger logger = LogManager.getLogger(GameController.class);

    private final IGameRepository gameRepository;
    private final IMoveRepository moveRepository;


    public GameController(IGameRepository gameRepository, IMoveRepository moveRepository){
        this.gameRepository = gameRepository;
        this.moveRepository = moveRepository;
    }

    @GetMapping("/player/{alias}/won")
    public ResponseEntity<List<Game>> getWonGamesByPlayer(@PathVariable String alias) {
        logger.info("Received request to fetch won games for player: {}", alias);
        try {
            List<Game> games = gameRepository.findWonGamesByPlayerAlias(alias);
            if (games.isEmpty()) {
                logger.warn("No won games found for player: {}", alias);
                return ResponseEntity.noContent().build();
            }
            logger.debug("Returning {} won games for player: {}", games.size(), alias);
            return ResponseEntity.ok(games);
        } catch (Exception e) {
            logger.error("Error fetching won games for player: {}", alias, e);
            return ResponseEntity.status(500).build();
        }
    }


    @PostMapping("/{gameId}/move")
    public ResponseEntity<String> markPosition(
            @PathVariable Integer gameId,
            @RequestBody PositionRequest position) {
        logger.info("Received request to mark position ({}, {}) for game ID: {}",
                position.getRow(), position.getCol(), gameId);
        try {

            // Validate position (1-3 for row and col)
            if (position.getRow() < 1 || position.getRow() > 3 ||
                    position.getCol() < 1 || position.getCol() > 3) {
                logger.warn("Invalid position ({}, {}) for game ID: {}",
                        position.getRow(), position.getCol(), gameId);
                return ResponseEntity.badRequest().body("Position must be between 1 and 3");
            }

            // Check if game exists
            if (!moveRepository.gameExists(gameId)) {
                logger.warn("Game ID {} does not exist", gameId);
                return ResponseEntity.badRequest().body("Game does not exist");
            }

            // Check if position is already taken
            if (moveRepository.isPositionTaken(gameId, position.getRow(), position.getCol())) {
                logger.warn("Position ({}, {}) already taken for game ID: {}",
                        position.getRow(), position.getCol(), gameId);
                return ResponseEntity.badRequest().body("Position already taken");
            }

            Move move = new Move();
            move.setGameId(gameId);
            move.setRowPosition(position.getRow());
            move.setColPosition(position.getCol());
            move.setMark("X");

            moveRepository.saveMove(move);
            logger.info("Position ({}, {}) marked with X for game ID: {}",
                    position.getRow(), position.getCol(), gameId);
            return ResponseEntity.ok("Position marked successfully");
        } catch (Exception e) {
            logger.error("Error marking position for game ID: {}", gameId, e);
            return ResponseEntity.status(500).body("Failed to mark position");
        }
    }

}
