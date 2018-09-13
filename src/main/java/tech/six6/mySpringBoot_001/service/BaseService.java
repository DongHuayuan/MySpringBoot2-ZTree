package tech.six6.mySpringBoot_001.service;

import tech.six6.mySpringBoot_001.entity.Demp;

import java.util.List;

public interface BaseService<E> {

    List<E> searchAll();

    int delete(int id);

    int update(E obj);

    void add(Demp demp);
}
