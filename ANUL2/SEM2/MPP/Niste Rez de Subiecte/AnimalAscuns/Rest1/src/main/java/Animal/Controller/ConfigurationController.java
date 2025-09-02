package Animal.Controller;

import Animal.Domain.Configuration;
import Animal.Service.ConfigurationService;
import Animal.Domain.ConfigurationDTO;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/configurations")
@CrossOrigin(origins = "http://localhost:5173")

public class ConfigurationController {
    private final ConfigurationService configurationService = new ConfigurationService();

    @PostMapping
    public ResponseEntity<Integer> addConfiguration(@RequestBody ConfigurationDTO dto) {
        try {
            Configuration config = configurationService.addConfiguration(
                    dto.getRow(), dto.getColumn(), dto.getAnimalName(), dto.getImageUrl());
            return ResponseEntity.status(201).body(config.getId());
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().build();
        }
    }
}
