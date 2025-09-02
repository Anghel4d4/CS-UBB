package Barci.Persistence;

import Barci.Domain.User;
import Barci.Persistence.Utils.HibernateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;


@Repository
public class UserRepositoryImpl implements UserRepository {
    private static final Logger logger = LogManager.getLogger(UserRepositoryImpl.class);

    @Override
    public User findByAlias(String alias) {
        logger.info("Fetching user by alias: {}", alias);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            session.beginTransaction();
            Query<User> query = session.createQuery("FROM User WHERE alias = :alias", User.class);
            query.setParameter("alias", alias);
            User user = query.uniqueResult();
            session.getTransaction().commit();
            logger.info("Found user: {}", user);
            return user;
        } catch (Exception e) {
            logger.error("Error fetching user by alias: {}", alias, e);
            throw e;
        }
    }
}