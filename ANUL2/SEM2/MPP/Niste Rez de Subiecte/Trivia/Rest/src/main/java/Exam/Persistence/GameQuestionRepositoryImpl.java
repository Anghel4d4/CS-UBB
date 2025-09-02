package Exam.Persistence;

import Exam.Domain.GameQuestion;

import Exam.Persistence.Utils.HibernateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class GameQuestionRepositoryImpl implements IGameQuestionRepository {
    private static final Logger logger = LogManager.getLogger(GameQuestionRepositoryImpl.class);

    @Override
    public List<GameQuestion> findByGameId(Integer gameId) {
        logger.debug("Caut jocuri de intrebari pentru jocul cu id: {}", gameId);
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            List<GameQuestion> gameQuestions = session.createQuery("FROM GameQuestion WHERE game.id = :gameId", GameQuestion.class)
                    .setParameter("gameId", gameId)
                    .getResultList();
            logger.debug("Sau gasit {} jocuri de intrebari", gameQuestions.size());
            return gameQuestions;
        }
    }
}
