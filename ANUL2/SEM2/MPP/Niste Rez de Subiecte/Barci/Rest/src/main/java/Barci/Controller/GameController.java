package Barci.Controller;


import Barci.Domain.*;
import Barci.Persistence.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/games")
@CrossOrigin(origins = "http://localhost:3000")
public class GameController {
    private static final Logger logger = LogManager.getLogger(GameController.class);

    @Autowired
    private PlayerGameRepositoryImpl playerGameRepository;

    @Autowired
    private UserRepositoryImpl userRepository;

    @Autowired
    private BoatRepositoryImpl boatRepository;

    @GetMapping("/player/{playerAlias}")
    public ResponseEntity<List<PlayerGame>> getPlayerGames(@PathVariable String playerAlias) {
        logger.debug("Request to get games for player: {}", playerAlias);
        User user = userRepository.findByAlias(playerAlias);
        if (user == null) {
            logger.warn("User not found: {}", playerAlias);
            return ResponseEntity.notFound().build();
        }
        List<PlayerGame> games = playerGameRepository.findByPlayerAlias(playerAlias);
        List<PlayerGame> filteredGames = games.stream()
                .filter(game -> !game.getGuessedPositions().isEmpty())
                .collect(Collectors.toList());
        logger.debug("Found {} games for player: {}", filteredGames.size(), playerAlias);
        return ResponseEntity.ok(filteredGames);
    }

    @PostMapping("/boat")
    public ResponseEntity<String> addBoat(@RequestBody Boat boat) {
        logger.debug("Request to add boat with positions: {}, {}, {}", boat.getPosition1(), boat.getPosition2(), boat.getPosition3());
        if (!boatRepository.arePositionsValid(boat.getPosition1(), boat.getPosition2(), boat.getPosition3())) {
            logger.warn("Invalid boat positions: {}, {}, {}", boat.getPosition1(), boat.getPosition2(), boat.getPosition3());
            return ResponseEntity.badRequest().body("Positions must be adjacent on the same row or column");
        }
        boatRepository.saveBoat(boat);
        return ResponseEntity.ok("Boat added successfully");
    }
}
