package Animal.Persistence;

import Animal.Domain.Game;
import Animal.Persistence.Utils.HibernateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GameRepositoryImpl implements GameRepository {
    private static final Logger logger = LogManager.getLogger(GameRepositoryImpl.class);
    private final SessionFactory sessionFactory;

    public GameRepositoryImpl() {
        this.sessionFactory = HibernateUtils.getSessionFactory();
        logger.info("GameRepositoryImpl initialized with SessionFactory");
    }

    @Override
    public List<Game> findFailedGamesByPlayerNickname(String nickname) {
        logger.debug("Retrieving failed games for player: {}", nickname);
        try (Session session = sessionFactory.openSession()) {
            Query<Game> query = session.createQuery(
                    "FROM Game g JOIN FETCH g.player p JOIN FETCH g.configuration c LEFT JOIN FETCH g.guesses WHERE p.nickname = :nickname AND g.isSuccessful = 0",
                    Game.class
            );
            query.setParameter("nickname", nickname);
            List<Game> failedGames = query.getResultList();
            logger.info("Found {} failed games for player: {}", failedGames.size(), nickname);
            return failedGames;
        } catch (Exception e) {
            logger.error("Failed to retrieve games for player: {}", nickname, e);
            throw new RuntimeException("Error retrieving failed games for player: " + nickname, e);
        }
    }
}
