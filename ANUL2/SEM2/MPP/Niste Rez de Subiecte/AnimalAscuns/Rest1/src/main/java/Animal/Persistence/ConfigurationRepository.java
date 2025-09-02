package Animal.Persistence;

import Animal.Domain.Configuration;

import java.util.List;

public interface ConfigurationRepository {

    Configuration save(Configuration configuration);
    Configuration findById(Integer id);
    List<Configuration> findAll();
}
