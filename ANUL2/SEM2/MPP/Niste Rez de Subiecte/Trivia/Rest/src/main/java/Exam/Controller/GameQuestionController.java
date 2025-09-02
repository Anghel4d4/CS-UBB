package Exam.Controller;

import Exam.Domain.GameQuestion;
import Exam.Domain.GameQuestionResponse;
import Exam.Domain.Question;
import Exam.Persistence.IGameQuestionRepository;
import Exam.Persistence.IQuestionRepository;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/game-questions")
@CrossOrigin(origins = "http://localhost:3000")

public class GameQuestionController {
    private static final Logger logger = LogManager.getLogger(GameQuestionController.class);

    @Autowired
    private IGameQuestionRepository gameQuestionRepository;

    @Autowired
    private IQuestionRepository questionRepository;

    @GetMapping("/{gameId}")
    public ResponseEntity<List<GameQuestionResponse>> getGameQuestions(@PathVariable Integer gameId) {
        logger.debug("Se cauta jocurile de intreabary cu id-ul: {}", gameId);
        try {
            List<GameQuestion> gameQuestions = gameQuestionRepository.findByGameId(gameId);
            if (gameQuestions.isEmpty()) {
                logger.warn("Nu sa gasit nici un joc de intrebari pentru id: {}", gameId);
                return ResponseEntity.notFound().build();
            }
            List<GameQuestionResponse> response = gameQuestions.stream()
                    .map(gq -> {
                        Question question = questionRepository.findById(gq.getQuestion().getId());
                        return new GameQuestionResponse(
                                question.getText(),
                                gq.getPlayerAnswer(),
                                question.getCorrectAnswer(),
                                gq.getPointsEarned(),
                                question.getDifficultyLevel()
                        );
                    })
                    .collect(Collectors.toList());
            logger.debug("Returneaza {} jocuri intrebari", response.size());
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            logger.error("Eroare la cautarea jocutilor de intrebari: {}", e.getMessage(), e);
            return ResponseEntity.internalServerError().build();
        }
    }
}