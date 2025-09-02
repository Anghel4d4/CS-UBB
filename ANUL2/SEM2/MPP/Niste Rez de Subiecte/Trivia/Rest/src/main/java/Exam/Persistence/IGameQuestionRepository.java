package Exam.Persistence;

import Exam.Domain.GameQuestion;

import java.util.List;

public interface IGameQuestionRepository {
    List<GameQuestion> findByGameId(Integer gameId);
}
