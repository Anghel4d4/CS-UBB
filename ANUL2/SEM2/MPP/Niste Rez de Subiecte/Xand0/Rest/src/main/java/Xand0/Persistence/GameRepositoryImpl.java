package Xand0.Persistence;

import Xand0.Domain.Game;
import Xand0.Persistence.Utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.*;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

@Repository
public class GameRepositoryImpl implements IGameRepository {
    private static final Logger logger = LogManager.getLogger(GameRepositoryImpl.class);


    @Override
    public List<Game> findWonGamesByPlayerAlias(String alias) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            logger.debug("Fetching won games for player alias: {}", alias);
            Query<Game> query = session.createQuery(
                    "FROM Game g WHERE g.player.alias = :alias AND g.outcome = 'WIN' " +
                            "ORDER BY g.duration DESC", Game.class);
            query.setParameter("alias", alias);
            List<Game> games = query.list();
            logger.debug("Found {} won games for player {}", games.size(), alias);
            return games;
        } catch (Exception e) {
            logger.error("Error fetching won games for alias: {}", alias, e);
            throw new RuntimeException("Failed to fetch won games", e);
        }
    }
}
