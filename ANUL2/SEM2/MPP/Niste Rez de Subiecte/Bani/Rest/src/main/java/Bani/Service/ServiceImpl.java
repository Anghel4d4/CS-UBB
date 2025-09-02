package Bani.Service;
import Bani.Domain.GameConfig;
import Bani.Domain.GameResult;
import Bani.Persistence.GameRepository;
import Bani.Persistence.GameRepositoryImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceImpl implements IService{
    private static final Logger logger = LogManager.getLogger(ServiceImpl.class);

    private final GameRepository gameRepository;


    public ServiceImpl(GameRepository gameRepository){
        this.gameRepository = gameRepository;
    }

    @Override
    public List<GameResult> getResultGames(String alias) {
        logger.info("Getting game results for alias: {}", alias);
        try {
            List<GameResult> results = gameRepository.finResultByAlias(alias);
            logger.info("Retrieved {} game results for alias: {}", results.size(), alias);
            return results;
        } catch (Exception e) {
            logger.error("Failed to get game results for alias {}: {}", alias, e.getMessage(), e);
            throw e;
        }
    }

    @Override
    public GameConfig saveConfiguration(GameConfig configuration) {
        logger.info("Saving game configuration: {}", configuration.getPositions());
        try {
            GameConfig saved = gameRepository.save(configuration);
            logger.info("Saved game configuration with ID: {}", saved.getId());
            return saved;
        } catch (Exception e) {
            logger.error("Failed to save game configuration: {}", e.getMessage(), e);
            throw e;
        }
    }




}
