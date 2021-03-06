package com.rps.adagawe.repository;

import com.rps.adagawe.model.Pengalaman;
import com.rps.adagawe.model.Perusahaan;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created on June, 2021
 * @author RPS
 */

@Repository
public interface PerusahaanRepository extends CrudRepository<Perusahaan, Integer>  {

    @Query("from Perusahaan a WHERE a.rowStatus = 1")
    List<Perusahaan> findPerusahaanByRowStatus();

    @Query("select a.idUserLogin from Perusahaan a")
    List<Integer> findIdUserLogin();

}
