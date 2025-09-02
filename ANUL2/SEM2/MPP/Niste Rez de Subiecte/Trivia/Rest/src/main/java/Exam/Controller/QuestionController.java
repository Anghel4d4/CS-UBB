package Exam.Controller;

import Exam.Domain.Question;
import Exam.Domain.QuestionUpdateRequest;
import Exam.Persistence.IQuestionRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/questions")
@CrossOrigin(origins = "http://localhost:3000")
public class QuestionController {
    private static final Logger logger = LogManager.getLogger(QuestionController.class);

    @Autowired
    private IQuestionRepository questionRepository;

    @PutMapping("/{id}")
    public ResponseEntity<String> updateQuestion(@PathVariable Integer id, @RequestBody QuestionUpdateRequest request) {
        logger.debug("Actualizez intrebarea cu id: {}", id);
        try {
            Question question = questionRepository.findById(id);
            if (question == null) {
                logger.warn("intrebarea cu id:{} nu a fost gasita", id);
                return ResponseEntity.notFound().build();
            }
            if (request.getText() != null) question.setText(request.getText());
            if (request.getCorrectAnswer() != null) question.setCorrectAnswer(request.getCorrectAnswer());
            if (request.getDifficultyLevel() != null) {
                if (request.getDifficultyLevel() < 1 || request.getDifficultyLevel() > 3) {
                    logger.warn("Nivel de dificultate invalid: {}", request.getDifficultyLevel());
                    return ResponseEntity.badRequest().body("Dificultatea trebuie sa fie  1, 2, ori 3");
                }
                question.setDifficultyLevel(request.getDifficultyLevel());
            }
            questionRepository.update(question);
            logger.debug("Intrebarea a fost actualizata cu succes");
            return ResponseEntity.ok("Intrebarea a fost actualizata cu succes");
        } catch (Exception e) {
            logger.error("Erroare la actualizarea intrebarii: {}", e.getMessage(), e);
            return ResponseEntity.internalServerError().body("Erroare la actualizarea intrebarii");
        }
    }
}