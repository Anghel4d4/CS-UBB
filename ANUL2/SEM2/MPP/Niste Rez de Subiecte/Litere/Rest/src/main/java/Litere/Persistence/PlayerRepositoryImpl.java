package Litere.Persistence;

import Litere.Domain.Player;
import Litere.Persistence.Utils.HibernateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;


@Repository
public class PlayerRepositoryImpl implements PlayerRepository {
    private static final Logger logger = LogManager.getLogger(PlayerRepositoryImpl.class);

    @Override
    public Player findByAlias(String alias) {
        logger.info("Finding player with alias: {}", alias);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Query<Player> query = session.createQuery("FROM Player WHERE alias = :alias", Player.class);
            query.setParameter("alias", alias);
            Player player = query.uniqueResult();
            logger.info("Found player: {}", player);
            return player;
        } catch (Exception e) {
            logger.error("Error finding player with alias {}: {}", alias, e.getMessage());
            throw e;
        }
    }
}