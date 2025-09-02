package Exam.Persistence;


import Exam.Domain.Question;

import java.util.List;

public interface IQuestionRepository {
    Question findById(Integer id);
    void update(Question question);
}
