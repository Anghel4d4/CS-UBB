package Xand0.Persistence.Utils;


import Xand0.Domain.Game;
import Xand0.Domain.Move;
import Xand0.Domain.Player;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
    private static final Logger logger = LogManager.getLogger(HibernateUtils.class);
    private static volatile SessionFactory sessionFactory;

    private HibernateUtils() {

    }

    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null || sessionFactory.isClosed()) {
            synchronized (HibernateUtils.class) {
                if (sessionFactory == null || sessionFactory.isClosed()) {
                    try {
                        sessionFactory = createNewSessionFactory();
                        logger.info("SessionFactory created successfully");
                    } catch (Exception e) {
                        logger.error("Failed to create SessionFactory: ", e);
                        throw new ExceptionInInitializerError("SessionFactory initialization failed: " + e.getMessage());
                    }
                }
            }
        }
        return sessionFactory;
    }

    private static SessionFactory createNewSessionFactory() {
        return new Configuration()
                .configure()
                .addAnnotatedClass(Game.class)
                .addAnnotatedClass(Player.class)
                .addAnnotatedClass(Move.class)
                .buildSessionFactory();
    }

    public static void closeSessionFactory() {
        if (sessionFactory != null && !sessionFactory.isClosed()) {
            sessionFactory.close();
            logger.info("SessionFactory closed successfully");
            sessionFactory = null;
        }
    }
}