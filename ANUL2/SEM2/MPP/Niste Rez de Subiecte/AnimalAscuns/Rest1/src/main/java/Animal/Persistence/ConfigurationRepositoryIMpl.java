package Animal.Persistence;

import Animal.Domain.Configuration;
import Animal.Persistence.Utils.HibernateUtils;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ConfigurationRepositoryIMpl implements ConfigurationRepository {

    @Override
    public Configuration save(Configuration configuration) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Transaction transaction = session.beginTransaction();
            session.persist(configuration);
            transaction.commit();
            return configuration;
        }
    }

    @Override
    public Configuration findById(Integer id) {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            return session.get(Configuration.class, id);
        }
    }

    @Override
    public List<Configuration> findAll() {
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Query<Configuration> query = session.createQuery("FROM Configuration", Configuration.class);
            return query.getResultList();
        }
    }
}