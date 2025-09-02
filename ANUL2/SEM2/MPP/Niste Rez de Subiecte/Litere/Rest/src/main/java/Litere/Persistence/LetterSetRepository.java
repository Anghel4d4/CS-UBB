package Litere.Persistence;

import Litere.Domain.LetterSet;

public interface LetterSetRepository {
    LetterSet findById(Integer id);
    void update(LetterSet letterSet);
}