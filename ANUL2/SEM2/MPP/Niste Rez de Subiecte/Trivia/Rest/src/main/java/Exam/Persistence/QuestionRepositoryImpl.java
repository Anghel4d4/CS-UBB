package Exam.Persistence;

import Exam.Domain.Question;
import Exam.Persistence.Utils.HibernateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class QuestionRepositoryImpl implements IQuestionRepository {
    private static final Logger logger = LogManager.getLogger(QuestionRepositoryImpl.class);

    @Override
    public Question findById(Integer id) {
        logger.debug("Se cauta intrebarea cu id: {}", id);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            Question question = session.get(Question.class, id);
            logger.debug("Sa gasit intrebarea: {}", question);
            return question;
        }
    }

    @Override
    public void update(Question question) {
        logger.debug("Actualizez intrebarea cu id: {}", question.getId());
        Transaction transaction = null;
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            transaction = session.beginTransaction();
            session.merge(question);
            transaction.commit();
            logger.debug("Intrebare actualizata cu succes");
        } catch (Exception e) {
            if (transaction != null) transaction.rollback();
            logger.error("Eroare in a actualiza intrebarea: {}", e.getMessage(), e);
            throw e;
        }
    }
}