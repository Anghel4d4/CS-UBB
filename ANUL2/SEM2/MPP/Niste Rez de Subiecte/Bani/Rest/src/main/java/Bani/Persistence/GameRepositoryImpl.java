package Bani.Persistence;

import Bani.Domain.GameConfig;
import Bani.Domain.GameResult;
import Bani.Persistence.Utils.HibernateUtils;
import Bani.Service.ServiceImpl;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class GameRepositoryImpl implements GameRepository {
    private static final Logger logger = LogManager.getLogger(GameRepositoryImpl.class);


    public final SessionFactory sessionFactory;


    public GameRepositoryImpl(SessionFactory sessionFactory){
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<GameResult> finResultByAlias(String alias) {
        logger.info("Finding game results for alias: {}", alias);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Query<GameResult> query = session.createQuery("FROM GameResult WHERE alias = :alias AND finalized = :finalized", GameResult.class);
            query.setParameter("alias", alias);
            query.setParameter("finalized", 1);
            List<GameResult> results = query.list();
            logger.info("Found {} game results for alias: {}", results.size(), alias);
            return results;
        } catch (Exception e) {
            logger.error("Error finding game results for alias {}: {}", alias, e.getMessage(), e);

            logger.warn("Returning empty result list due to database error");
            return new ArrayList<>();
        }
    }

    @Override
    public GameConfig save(GameConfig configuration) {
        logger.info("Saving game configuration");
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            try {
                session.persist(configuration);
                transaction.commit();
                logger.info("Successfully saved game configuration with ID: {}", configuration.getId());
                return configuration;
            } catch (Exception e) {
                transaction.rollback();
                logger.error("Error saving game configuration: {}", e.getMessage(), e);
                throw e;
            }
        }
    }
}
