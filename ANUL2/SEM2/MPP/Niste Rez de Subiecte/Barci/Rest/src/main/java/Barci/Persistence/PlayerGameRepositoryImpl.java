package Barci.Persistence;

import Barci.Domain.PlayerGame;
import Barci.Persistence.Utils.HibernateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class PlayerGameRepositoryImpl implements PlayerGameRepository {
    private static final Logger logger = LogManager.getLogger(PlayerGameRepositoryImpl.class);

    @Override
    public List<PlayerGame> findByPlayerAlias(String playerAlias) {
        logger.info("Fetching games for player alias: {}", playerAlias);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            session.beginTransaction();
            Query<PlayerGame> query = session.createQuery("FROM PlayerGame pg WHERE pg.user.alias = :alias", PlayerGame.class);
            query.setParameter("alias", playerAlias);
            List<PlayerGame> games = query.list();
            session.getTransaction().commit();
            logger.info("Found {} games for player alias: {}", games.size(), playerAlias);
            return games;
        } catch (Exception e) {
            logger.error("Error fetching games for player alias: {}", playerAlias, e);
            throw e;
        }
    }
}