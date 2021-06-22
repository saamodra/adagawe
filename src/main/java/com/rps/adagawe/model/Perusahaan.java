package com.rps.adagawe.model;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;

@Entity
public class Perusahaan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotEmpty(message = "Nama Perusahaan wajib diisi.")
    @Column(name = "nama_perusahaan")
    private String namaPerusahaan;

    @NotEmpty(message = "Alamat wajib diisi.")
    @Column(name = "alamat_lengkap")
    private String alamatLengkap;

    @NotEmpty(message = "Provinsi wajib diisi.")
    private String provinsi;

    @NotEmpty(message = "Kota wajib diisi.")
    private String kota;

    @Column(name = "telah_terverifikasi")
    private Integer telahTerverifikasi;

    @Column(name = "foto_profil")
    private String fotoProfil;

    @NotEmpty(message = "Bidang Perusahaan wajib diisi.")
    @Column(name = "bidang_perusahaan")
    private String bidangPerusahaan;

    @Column(name = "row_status")
    private Integer rowStatus;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamaPerusahaan() {
        return namaPerusahaan;
    }

    public void setNamaPerusahaan(String namaPerusahaan) {
        this.namaPerusahaan = namaPerusahaan;
    }

    public String getAlamatLengkap() {
        return alamatLengkap;
    }

    public void setAlamatLengkap(String alamatLengkap) {
        this.alamatLengkap = alamatLengkap;
    }

    public String getProvinsi() {
        return provinsi;
    }

    public void setProvinsi(String provinsi) {
        this.provinsi = provinsi;
    }

    public String getKota() {
        return kota;
    }

    public void setKota(String kota) {
        this.kota = kota;
    }

    public Integer getTelahTerverifikasi() {
        return telahTerverifikasi;
    }

    public void setTelahTerverifikasi(Integer telahTerverifikasi) {
        this.telahTerverifikasi = telahTerverifikasi;
    }

    public String getFotoProfil() {
        return fotoProfil;
    }

    public void setFotoProfil(String fotoProfil) {
        this.fotoProfil = fotoProfil;
    }

    public String getBidangPerusahaan() {
        return bidangPerusahaan;
    }

    public void setBidangPerusahaan(String bidangPerusahaan) {
        this.bidangPerusahaan = bidangPerusahaan;
    }

    public Integer getRowStatus() {
        return rowStatus;
    }

    public void setRowStatus(Integer rowStatus) {
        this.rowStatus = rowStatus;
    }

    @Override
    public String toString() {
        return "Perusahaan{" +
                "id=" + id +
                ", namaPerusahaan='" + namaPerusahaan + '\'' +
                ", alamatLengkap=" + alamatLengkap +
                ", provinsi=" + provinsi +
                ", kota='" + kota + '\'' +
                ", telahTerverifikasi='" + telahTerverifikasi + '\'' +
                ", fotoProfil='" + fotoProfil + '\'' +
                ", bidangPerusahaan='" + bidangPerusahaan + '\'' +
                ", rowStatus='" + rowStatus + '\'' +
                '}';
    }

}