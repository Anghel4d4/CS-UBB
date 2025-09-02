package Xand0.Persistence;

import Xand0.Domain.Move;
import Xand0.Persistence.Utils.HibernateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class MoveRepositoryImpl implements IMoveRepository {
    private static final Logger logger = LogManager.getLogger(MoveRepositoryImpl.class);

    @Override
    public void saveMove(Move move) {
        Transaction transaction = null;
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            logger.debug("Saving move for game ID {} at position ({}, {}) with mark {}",
                    move.getGameId(), move.getRowPosition(), move.getColPosition(), move.getMark());
            session.persist(move);
            transaction.commit();
            logger.info("Move saved successfully for game ID {}", move.getGameId());
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
                logger.warn("Transaction rolled back for move save");
            }
            logger.error("Error saving move for game ID: {}", move.getGameId(), e);
            throw new RuntimeException("Failed to save move", e);
        }
    }

    @Override
    public boolean isPositionTaken(Integer gameId, Integer row, Integer col) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Query<Long> query = session.createQuery(
                    "SELECT COUNT(*) FROM Move m WHERE m.gameId = :gameId " +
                            "AND m.rowPosition = :row AND m.colPosition = :col", Long.class);
            query.setParameter("gameId", gameId);
            query.setParameter("row", row);
            query.setParameter("col", col);
            Long count = query.uniqueResult();
            logger.debug("Position ({}, {}) for game ID {} is taken: {}", row, col, gameId, count > 0);
            return count > 0;
        } catch (Exception e) {
            logger.error("Error checking position for game ID: {}", gameId, e);
            throw new RuntimeException("Failed to check position", e);
        }
    }

    @Override
    public boolean gameExists(Integer gameId) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Query<Long> query = session.createQuery(
                    "SELECT COUNT(*) FROM Game g WHERE g.id = :gameId", Long.class);
            query.setParameter("gameId", gameId);
            Long count = query.uniqueResult();
            logger.debug("Game ID {} exists: {}", gameId, count > 0);
            return count > 0;
        } catch (Exception e) {
            logger.error("Error checking game existence for ID: {}", gameId, e);
            throw new RuntimeException("Failed to check game existence", e);
        }
    }
}