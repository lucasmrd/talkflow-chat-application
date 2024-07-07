package com.lm.talkflow.repository;

import com.lm.talkflow.model.Status;
import com.lm.talkflow.model.User;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.List;

public interface UserRepository extends MongoRepository<User, String> {
    List<User> findAllByStatus(Status status);
}
