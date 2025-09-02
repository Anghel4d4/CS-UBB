package Litere.Persistence;

import Litere.Domain.Move;
import Litere.Persistence.Utils.HibernateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class MoveRepositoryImpl implements MoveRepository {
    private static final Logger logger = LogManager.getLogger(MoveRepositoryImpl.class);

    @Override
    public List<Move> findByGameId(Integer gameId) {
        logger.debug("Finding moves for game id: {}", gameId);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Query<Move> query = session.createQuery(
                    "FROM Move WHERE game.id = :gameId ORDER BY moveNumber",
                    Move.class
            );
            query.setParameter("gameId", gameId);
            List<Move> moves = query.getResultList();
            logger.debug("Found {} moves for game id {}", moves.size(), gameId);
            return moves;
        } catch (Exception e) {
            logger.error("Error finding moves for game id {}: {}", gameId, e.getMessage());
            throw e;
        }
    }
}