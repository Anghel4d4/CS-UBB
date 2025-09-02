package Litere.Persistence;

import Litere.Domain.Game;
import Litere.Persistence.Utils.HibernateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GameRepositoryImpl implements GameRepository {
    private static final Logger logger = LogManager.getLogger(GameRepositoryImpl.class);

    @Override
    public List<Game> findGamesWithMatchingLettersByPlayerAlias(String alias) {
        logger.debug("Finding games with matching letters for player alias: {}", alias);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Query<Game> query = session.createQuery(
                    "SELECT DISTINCT g FROM Game g JOIN g.player p JOIN Move m ON m.game.id = g.id " +
                            "WHERE p.alias = :alias AND m.playerLetter = m.serverLetter AND g.finalized = true",
                    Game.class
            );
            query.setParameter("alias", alias);
            List<Game> games = query.getResultList();
            logger.debug("Found {} games with matching letters for alias {}", games.size(), alias);
            return games;
        } catch (Exception e) {
            logger.error("Error finding games for alias {}: {}", alias, e.getMessage());
            throw e;
        }
    }
}
