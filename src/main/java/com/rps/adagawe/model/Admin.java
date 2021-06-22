package com.rps.adagawe.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Entity
public class Admin {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotEmpty
    @Column(name = "nama_admin")
    private String namaAdmin;

    @NotNull
    @Column(name = "tanggal_lahir")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date tanggalLahir;

    @NotNull
    @Column(name = "jenis_kelamin")
    private String jenisKelamin;

    @NotEmpty
    @Column(name = "no_telepon")
    private String noTelepon;

    @Column(name = "foto_profil")
    private String fotoProfil;

    @Column(name = "row_status")
    private int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNamaAdmin() {
        return namaAdmin;
    }

    public void setNamaAdmin(String namaAdmin) {
        this.namaAdmin = namaAdmin;
    }

    public Date getTanggalLahir() {
        return tanggalLahir;
    }

    public void setTanggalLahir(Date tanggalLahir) {
        this.tanggalLahir = tanggalLahir;
    }

    public String getJenisKelamin() {
        return jenisKelamin;
    }

    public void setJenisKelamin(String jenisKelamin) {
        this.jenisKelamin = jenisKelamin;
    }

    public String getNoTelepon() {
        return noTelepon;
    }

    public void setNoTelepon(String noTelepon) {
        this.noTelepon = noTelepon;
    }

    public String getFotoProfil() {
        return fotoProfil;
    }

    public void setFotoProfil(String fotoProfil) {
        this.fotoProfil = fotoProfil;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}