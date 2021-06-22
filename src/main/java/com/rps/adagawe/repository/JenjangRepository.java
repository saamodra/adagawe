package com.rps.adagawe.repository;

import com.rps.adagawe.model.Jenjang;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface JenjangRepository extends CrudRepository<Jenjang, Integer> {

}
