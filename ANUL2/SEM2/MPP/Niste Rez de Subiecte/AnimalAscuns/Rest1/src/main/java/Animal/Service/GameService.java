package Animal.Service;

import Animal.Domain.Game;
import Animal.Domain.Guess;
import Animal.Domain.FailedGameDTO;
import Animal.Persistence.GameRepository;
import jakarta.transaction.Transactional;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class GameService {
    private static final Logger logger = LogManager.getLogger(GameService.class);
    private final GameRepository gameRepository;

    public GameService(GameRepository gameRepository) {
        this.gameRepository = gameRepository;
        logger.info("GameService initialized");
    }

    @Transactional
    public List<FailedGameDTO> getFailedGamesByPlayerNickname(String nickname) {
        logger.debug("Processing failed games request for player: {}", nickname);
        try {
            List<Game> failedGames = gameRepository.findFailedGamesByPlayerNickname(nickname);
            List<FailedGameDTO> result = failedGames.stream()
                    .map(this::mapToFailedGameDTO)
                    .collect(Collectors.toList());
            logger.info("Mapped {} failed games to DTO for player: {}", result.size(), nickname);
            return result;
        } catch (Exception e) {
            logger.error("Error processing failed games for player: {}", nickname, e);
            throw new RuntimeException("Error processing failed games for player: " + nickname, e);
        }
    }

    private FailedGameDTO mapToFailedGameDTO(Game game) {
        logger.debug("Mapping game ID {} to FailedGameDTO", game.getId());
        List<FailedGameDTO.Position> proposedPositions = game.getGuesses().stream()
                .map(guess -> new FailedGameDTO.Position(guess.getRow(), guess.getColumn()))
                .collect(Collectors.toList());
        FailedGameDTO.Position animalPosition = new FailedGameDTO.Position(
                game.getConfiguration().getRow(),
                game.getConfiguration().getColumn()
        );
        return new FailedGameDTO(game.getNumberOfGuesses(), proposedPositions, animalPosition);
    }
}
