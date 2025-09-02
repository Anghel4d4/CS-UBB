package Traseu.Persistence;

import Traseu.Domain.PathConfig;
import Traseu.Domain.PlayerProgress;
import Traseu.Persistence.Utils.HibernateUtils;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.Arrays;
import java.util.List;

@Repository
public class PathRepositoryImpl implements PathRepository {
    private static final Logger logger = LogManager.getLogger(PathRepositoryImpl.class);
    private final ObjectMapper mapper = new ObjectMapper();

    @Override
    public java.util.List<PlayerProgress> findUnfinishedGamesByAlias(String alias) {
        logger.debug("Fetching unfinished games for alias: {}", alias);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Query<PlayerProgress> query = session.createQuery(
                    "FROM PlayerProgress pp WHERE pp.alias = :alias AND pp.finalized = false",
                    PlayerProgress.class
            );
            query.setParameter("alias", alias);
            query.setComment("findUnfinishedGamesByAlias");
            java.util.List<PlayerProgress> games = query.list();
            logger.debug("Found {} unfinished games for alias: {}", games.size(), alias);
            return games;
        } catch (Exception e) {
            logger.error("Error fetching unfinished games for alias {}: ", alias, e);
            throw new RuntimeException("Failed to fetch unfinished games", e);
        }
    }


    @Override
    public PathConfig findConfigById(Long configId) {
        logger.debug("Fetching configuration with id: {}", configId);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            PathConfig config = session.get(PathConfig.class, configId);
            logger.debug("Found configuration with id: {}", configId);
            return config;
        } catch (Exception e) {
            logger.error("Error fetching configuration with id {}: ", configId, e);
            throw new RuntimeException("Failed to fetch configuration", e);
        }
    }


    @Override
    public List<PathConfig> findAllConfigs() {
        logger.debug("Fetching all configurations");
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Query<PathConfig> query = session.createQuery("FROM PathConfig", PathConfig.class);
            query.setComment("findAllConfigs");
            List<PathConfig> configs = query.list();
            logger.debug("Found {} configurations", configs.size());
            return configs;
        } catch (Exception e) {
            logger.error("Error fetching all configurations: ", e);
            throw new RuntimeException("Failed to fetch configurations", e);
        }
    }


    @Override
    public void updateObstacleCoordinates( Long configId,
            int oldRow, int oldCol,
            int newRow, int newCol) {

        String oldEntry = String.format("[%d,%d]", oldRow, oldCol);
        String newEntry = String.format("[%d,%d]", newRow, newCol);

        Transaction tx = null;
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            tx = session.beginTransaction();

            PathConfig config = session.get(PathConfig.class, configId);
            if (config == null) {
                throw new RuntimeException("PathConfig not found: " + configId);
            }

            String json = config.getObstacles();
            if (json != null && json.contains(oldEntry)) {

                String updated = json.replace(oldEntry, newEntry);
                config.setObstacles(updated);
                session.merge(config);
                logger.info("Replaced {} → {} in config {}", oldEntry, newEntry, configId);
            } else {
                logger.debug("No '{}' found in config {}", oldEntry, configId);
            }

            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            throw new RuntimeException("Failed to update coordinates", e);
        }
    }

}
