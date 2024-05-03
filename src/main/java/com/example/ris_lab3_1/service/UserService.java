package com.example.ris_lab3_1.service;


import com.example.ris_lab3_1.entity.Subscription;
import com.example.ris_lab3_1.entity.User1;
import jakarta.ejb.Stateful;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;

import java.util.List;

@Stateful
public class UserService {
    @PersistenceContext(unitName="default")
    private EntityManager entityManager;

    public void addUser(User1 user1) {
        entityManager.persist(user1);
        entityManager.flush();
    }

    public List<User1> getUsers() {
        return entityManager.createQuery("SELECT e from User1 e", User1.class)
                .getResultList();
    }

    public List<Subscription> getSubscriptions() {
        return entityManager.createQuery("SELECT d from Subscription d", Subscription.class)
                .getResultList();
    }

    public List<User1> getUsers(Long subscriptionId) {
        String queryString = "SELECT e FROM User1 e WHERE e.subscription.id = :subscriptionId";

        return entityManager.createQuery(queryString, User1.class)
                .setParameter("subscriptionId", subscriptionId)
                .getResultList();
    }

    public User1 getUser(long id) {
        return entityManager.find(User1.class, id);
    }

    public void updateUser(User1 user1) {
        entityManager.merge(user1);
        entityManager.flush();
    }

    public void deleteUser(long id) {
        User1 user1 = getUser(id);
        entityManager.remove(user1);
        entityManager.flush();
    }

}
