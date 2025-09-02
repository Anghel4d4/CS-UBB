package Animal.Service;

import Animal.Domain.Configuration;
import Animal.Persistence.ConfigurationRepositoryIMpl;
import jakarta.transaction.Transactional;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Set;

public class ConfigurationService {
    private static final Logger log = LoggerFactory.getLogger(ConfigurationService.class);
    private final ConfigurationRepositoryIMpl configurationRepository = new ConfigurationRepositoryIMpl();
    private final ValidatorFactory validatorFactory = Validation.buildDefaultValidatorFactory();
    private final Validator validator = validatorFactory.getValidator();

    @Transactional
    public Configuration addConfiguration(Integer row, Integer column, String animalName, String imageUrl) {
        Configuration configuration = new Configuration(row, column, animalName, imageUrl);
        Set<ConstraintViolation<Configuration>> violations = validator.validate(configuration);
        if (!violations.isEmpty()) {
            String errorMessage = violations.stream()
                    .map(ConstraintViolation::getMessage)
                    .reduce((a, b) -> a + "; " + b)
                    .orElse("Validation failed");
            log.error("Validation errors: {}", errorMessage);
            throw new IllegalArgumentException(errorMessage);
        }
        return configurationRepository.save(configuration);
    }

    public Configuration getConfigurationById(Integer id) {
        Configuration config = configurationRepository.findById(id);
        if (config == null) {
            throw new IllegalArgumentException("Configuration not found with id: " + id);
        }
        return config;
    }
}