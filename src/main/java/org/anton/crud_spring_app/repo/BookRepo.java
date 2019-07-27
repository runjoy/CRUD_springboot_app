package org.anton.crud_spring_app.repo;

import org.anton.crud_spring_app.domain.Book;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by qanto on 21.07.2019.
 */
public interface BookRepo extends CrudRepository<Book, Integer> {
    Book findById(int id);
}
