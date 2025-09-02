package Litere.Persistence;

import Litere.Domain.LetterSet;
import Litere.Persistence.Utils.HibernateUtils;
import org.hibernate.Transaction;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;


@Repository
public class LetterSetRepositoryImpl implements LetterSetRepository {
    private static final Logger logger = LogManager.getLogger(LetterSetRepositoryImpl.class);

    @Override
    public LetterSet findById(Integer id) {
        logger.debug("Finding letter set with id: {}", id);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            LetterSet letterSet = session.get(LetterSet.class, id);
            logger.debug("Found letter set: {}", letterSet);
            return letterSet;
        } catch (Exception e) {
            logger.error("Error finding letter set with id {}: {}", id, e.getMessage());
            throw e;
        }
    }

    @Override
    public void update(LetterSet letterSet) {
        logger.debug("Updating letter set with id: {}", letterSet.getId());
        Transaction transaction = null;
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.merge(letterSet);
            transaction.commit();
            logger.debug("Letter set updated successfully");
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logger.error("Error updating letter set: {}", e.getMessage());
            throw e;
        }
    }
}