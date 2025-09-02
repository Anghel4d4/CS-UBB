package Litere.Controller;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import Litere.Domain.*;
import Litere.Persistence.GameRepository;
import Litere.Persistence.LetterSetRepository;
import Litere.Persistence.MoveRepository;
import Litere.Persistence.PlayerRepository;

import jakarta.validation.Valid;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;


@RestController
@RequestMapping("/api")
@CrossOrigin(origins = "http://localhost:5173")

public class GameController {
    private static final Logger logger = LogManager.getLogger(GameController.class);

    @Autowired
    private PlayerRepository playerRepository;

    @Autowired
    private GameRepository gameRepository;

    @Autowired
    private MoveRepository moveRepository;

    @Autowired
    private LetterSetRepository letterSetRepository;

    // Exercise 4: Get games with matching letters for a player
    @GetMapping("/games/{alias}/matching-letters")
    public ResponseEntity<List<GameWithMatchingLettersDTO>> getGamesWithMatchingLetters(@PathVariable String alias) {
        logger.debug("Received request to find games with matching letters for alias: {}", alias);
        try {
            Player player = playerRepository.findByAlias(alias);
            if (player == null) {
                logger.warn("Player with alias {} not found", alias);
                return ResponseEntity.notFound().build();
            }

            List<Game> games = gameRepository.findGamesWithMatchingLettersByPlayerAlias(alias);
            List<GameWithMatchingLettersDTO> dtos = new ArrayList<>();

            for (Game game : games) {
                List<Move> moves = moveRepository.findByGameId(game.getId());
                List<String> playerLetters = new ArrayList<>();
                List<String> serverLetters = new ArrayList<>();

                for (Move move : moves) {
                    playerLetters.add(move.getPlayerLetter());
                    serverLetters.add(move.getServerLetter());
                }

                dtos.add(new GameWithMatchingLettersDTO(
                        game.getId(),
                        game.getTotalScore(),
                        game.getStartDateTime(),
                        playerLetters,
                        serverLetters
                ));
            }

            logger.info("Returning {} games with matching letters for alias {}", dtos.size(), alias);
            return ResponseEntity.ok(dtos);
        } catch (Exception e) {
            logger.error("Error retrieving games for alias {}: {}", alias, e.getMessage());
            return ResponseEntity.status(500).build();
        }
    }

    // Exercise 5: Update a letter set
    @PutMapping("/letter-sets/{id}")
    public ResponseEntity<LetterSet> updateLetterSet(@PathVariable Integer id, @Valid @RequestBody LetterSetUpdateDTO dto) {
        logger.debug("Received request to update letter set with id: {}", id);
        try {
            LetterSet letterSet = letterSetRepository.findById(id);
            if (letterSet == null) {
                logger.warn("Letter set with id {} not found", id);
                return ResponseEntity.notFound().build();
            }

            // Validate distinct letters
            Set<String> letters = new HashSet<>();
            letters.add(dto.getLetter1());
            letters.add(dto.getLetter2());
            letters.add(dto.getLetter3());
            letters.add(dto.getLetter4());
            if (letters.size() != 4) {
                logger.warn("Letters must be distinct for letter set id {}", id);
                return ResponseEntity.badRequest().body(null);
            }

            // Update letter set
            letterSet.setLetter1(dto.getLetter1());
            letterSet.setValue1(dto.getValue1());
            letterSet.setLetter2(dto.getLetter2());
            letterSet.setValue2(dto.getValue2());
            letterSet.setLetter3(dto.getLetter3());
            letterSet.setValue3(dto.getValue3());
            letterSet.setLetter4(dto.getLetter4());
            letterSet.setValue4(dto.getValue4());

            letterSetRepository.update(letterSet);
            logger.info("Letter set with id {} updated successfully", id);
            return ResponseEntity.ok(letterSet);
        } catch (Exception e) {
            logger.error("Error updating letter set with id {}: {}", id, e.getMessage());
            return ResponseEntity.status(500).build();
        }
    }
}