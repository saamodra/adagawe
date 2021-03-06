package com.rps.adagawe.repository;

import com.rps.adagawe.model.LamaranPelamar;
import com.rps.adagawe.model.Pelamar;
import com.rps.adagawe.model.UserLogin;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created on June, 2021
 * @author RPS
 */

@Repository
public interface PelamarRepository extends CrudRepository<Pelamar, Integer> {

    @Query("from Pelamar a WHERE a.rowStatus = 1")
    List<Pelamar> findPelamarByRowStatus();

}
