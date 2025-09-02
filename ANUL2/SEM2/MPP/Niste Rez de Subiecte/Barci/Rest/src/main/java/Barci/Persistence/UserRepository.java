package Barci.Persistence;

import Barci.Domain.User;

public interface UserRepository {
    User findByAlias(String alias);
}