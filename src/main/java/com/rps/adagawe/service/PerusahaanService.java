package com.rps.adagawe.service;

import com.rps.adagawe.model.Pengalaman;
import com.rps.adagawe.model.Perusahaan;
import com.rps.adagawe.repository.PerusahaanRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PerusahaanService {

    @Autowired
    PerusahaanRepository perusahaanRepository;

    public List<Perusahaan> getAll() {
        return (List<Perusahaan>) perusahaanRepository.findAll();
    }

    public void save(Perusahaan perusahaan) {
        perusahaan.setRowStatus(1);
        perusahaan.setFotoProfil("default.jpg");
        perusahaanRepository.save(perusahaan);
    }

    public Perusahaan getPerusahaanById(Integer id) {
        return perusahaanRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid perusahaan Id:" + id));
    }

    public Perusahaan updatePerusahaan(int id, Perusahaan perusahaan) {
        Perusahaan p = perusahaanRepository.findById(id).orElse(null);
        assert p != null;

        perusahaan.setId(id);
        perusahaan.setRowStatus(1);

        perusahaanRepository.save(perusahaan);

        return perusahaan;
    }

    public Perusahaan deletePerusahaan(int id, Perusahaan perusahaan) {
        Perusahaan p = perusahaanRepository.findById(id).orElse(null);

        assert p != null;

        perusahaan.setId(id);
        perusahaan.setNamaPerusahaan(p.getNamaPerusahaan());
        perusahaan.setAlamatLengkap(p.getAlamatLengkap());
        perusahaan.setProvinsi(p.getProvinsi());
        perusahaan.setKota(p.getKota());
        perusahaan.setTelahTerverifikasi(p.getTelahTerverifikasi());
        perusahaan.setFotoProfil(p.getFotoProfil());
        perusahaan.setBidangPerusahaan(p.getBidangPerusahaan());
        perusahaan.setRowStatus(0);
        perusahaanRepository.save(perusahaan);

        return perusahaan;
    }

    public List<Perusahaan> findPerusahaanByRowStatus() {

        return (List<Perusahaan>) perusahaanRepository.findPerusahaanByRowStatus();
    }
}
