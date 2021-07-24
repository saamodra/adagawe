package com.rps.adagawe.controller;

import com.rps.adagawe.helper.AdagaweMethods;
import com.rps.adagawe.helper.AdagaweService;
import com.rps.adagawe.helper.FileUploadHelper;
import com.rps.adagawe.model.*;
import com.rps.adagawe.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
public class PerusahaanController {

    @Autowired
    PerusahaanService perusahaanService;

    @Autowired
    AdagaweService adagaweService;

    @Autowired
    JenisPegawaiService jenisPegawaiService;

    @Autowired
    LowonganService lowonganService;

    @Autowired
    VerifikasiPerusahaanService verifikasiPerusahaanService;

    @Autowired
    UserService userService;

    @GetMapping("/admin/perusahaan")
    public String index(Model model) {
        List<Perusahaan> perusahaans = perusahaanService.findPerusahaanByRowStatus();
        model.addAttribute("perusahaans", perusahaans);
        return "/admin/perusahaan/index";
    }

    @GetMapping("/perusahaan")
    public String getIndex(Model model, HttpServletRequest request) {

        // Redirect jika belum melengkapi profil
        if (!AdagaweMethods.isPerusahaanExist(adagaweService)) {
            return "redirect:/perusahaan/information";
        }

        Perusahaan data = AdagaweMethods.getPerusahaanBySession(adagaweService);
        List<Lowongan> lowongans = lowonganService.getLowonganByIdPerusahaan(data.getId());
        model.addAttribute("total_lowongan_aktif", AdagaweMethods.filterLowongan(lowongans, 1).size());
        model.addAttribute("total_lowongan_tutup", AdagaweMethods.filterLowongan(lowongans, 0).size());
        model.addAttribute("total_lowongan", lowongans.size());
        model.addAttribute("verify", true);
        model.addAttribute("data_jenis_pegawai", AdagaweMethods.getBarChartJenisPegawaiByPerusahaan(jenisPegawaiService, lowonganService, data.getId()));

        model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
        model.addAttribute("url", AdagaweMethods.getMainUrl(request, 1));

        return "/perusahaan/dashboard";
    }

    @GetMapping("/perusahaan/information")
    public String getInformation(Model model, HttpServletRequest request) {
        model.addAttribute("perusahaan", new Perusahaan());
        model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));

        return "/perusahaan/profile/create";
    }

    @GetMapping("/perusahaan/verifikasi/create")
    public String create(Model model, HttpServletRequest request) {
        model.addAttribute("perusahaanObject", new Perusahaan());
        model.addAttribute("userlogin", AdagaweMethods.getUserLoginBySession(adagaweService));

        model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
        model.addAttribute("url", AdagaweMethods.getMainUrl(request, 2));

        return "/perusahaan/verifikasi/create";
    }

    @PostMapping("/perusahaan/verifikasi/create")
    public String postCreate(RedirectAttributes redirectAttributes, @RequestParam("file") MultipartFile file,
                             @ModelAttribute("perusahaan") @Valid Perusahaan perusahaan, BindingResult result, Model model) {

        if (result.hasErrors()) {
            return "/perusahaan/profile/create";
        }

        UserLogin ul = AdagaweMethods.getUserLoginBySession(adagaweService);
        userService.findById(ul.getId());

        perusahaan.setIdUserLogin(ul.getId());

        if (file.isEmpty()) {
            ul.setFotoProfil("default-company.png");
        }
        else {
            String fileName = FileUploadHelper.upload(file, "foto_perusahaan");
            ul.setFotoProfil(fileName);
            userService.save(ul);
        }

        perusahaanService.save(perusahaan);

        return "redirect:/perusahaan/profile";
    }

    @GetMapping("/perusahaan/profile")
    public String getProfile(Model model, HttpServletRequest request) {

        // Redirect jika belum melengkapi profil
        if (!AdagaweMethods.isPerusahaanExist(adagaweService)) {
            return "redirect:/perusahaan/information";
        }

        String prefix;

        UserLogin idUserLogin = AdagaweMethods.getUserLoginBySession(adagaweService);
        List<Integer> perusahaan = perusahaanService.getIdUserLoginInPerusahaan();

        if (perusahaan.contains(idUserLogin.getId())) {
            int idPerusahaan = AdagaweMethods.getPerusahaanBySession(adagaweService).getId();
            VerifikasiPerusahaan verifikasiperusahaan = verifikasiPerusahaanService.getLastIdPerusahaan(idPerusahaan);
            List<VerifikasiPerusahaan> verifikasiperusahaans = verifikasiPerusahaanService.getListVerifikasiPerusahaanById(idPerusahaan);
            //getVerifikasiPerusahaanById(idPerusahaan);
            model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
            model.addAttribute("perusahaan", AdagaweMethods.getPerusahaanBySession(adagaweService));
            if (verifikasiperusahaans.size() != 0) {
                model.addAttribute("verifikasiperusahaan", verifikasiperusahaans.get(verifikasiperusahaans.size() - 1));
            } else {
                model.addAttribute("verifikasiperusahaan", null);
            }

            model.addAttribute("verifikasiperusahaans", verifikasiperusahaans);
        }

        model.addAttribute("url", AdagaweMethods.getMainUrl(request, 2));

        return "/perusahaan/profile/index";
    }

    @GetMapping("/perusahaan/laporan")
    public String getLaporan(Model model, HttpServletRequest request) {

        // Redirect jika belum melengkapi profil
        if (!AdagaweMethods.isPerusahaanExist(adagaweService)) {
            return "redirect:/perusahaan/information";
        }

        model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
        model.addAttribute("perusahaan", AdagaweMethods.getPerusahaanBySession(adagaweService));
        model.addAttribute("url", AdagaweMethods.getMainUrl(request, 2));

        return "/perusahaan/report-lowongan";
    }

    @GetMapping("/loker/perusahaan/view/{id}")
    public String getViewPerusahaan(@PathVariable("id") Integer id, Model model, HttpServletRequest request) {

        model.addAttribute("perusahaan", perusahaanService.getPerusahaanById(id));

//        model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
        model.addAttribute("url", AdagaweMethods.getMainUrl(request, 2));

        return "/pelamar/view-perusahaan";
    }
}
