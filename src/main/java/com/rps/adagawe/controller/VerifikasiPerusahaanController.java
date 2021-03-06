package com.rps.adagawe.controller;

import com.rps.adagawe.helper.AdagaweMethods;
import com.rps.adagawe.helper.AdagaweService;
import com.rps.adagawe.helper.FileUploadHelper;
import com.rps.adagawe.model.Jabatan;
import com.rps.adagawe.model.Pelamar;
import com.rps.adagawe.model.Perusahaan;
import com.rps.adagawe.model.VerifikasiPerusahaan;
import com.rps.adagawe.repository.PerusahaanRepository;
import com.rps.adagawe.service.PerusahaanService;
import com.rps.adagawe.service.VerifikasiPerusahaanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Controller
public class VerifikasiPerusahaanController {

    @Autowired
    VerifikasiPerusahaanService verifikasiPerusahaanService;

    @Autowired
    PerusahaanService perusahaanService;

    @Autowired
    AdagaweService adagaweService;

    @GetMapping("/admin/verifikasi/index")
    public String index(Model model, HttpServletRequest request) {
        List<VerifikasiPerusahaan> listData = verifikasiPerusahaanService.getAll();
        model.addAttribute("vp_status_0", AdagaweMethods.filterVerifikasiPerusahaan(listData, 0));
        model.addAttribute("vp_status_1", AdagaweMethods.filterVerifikasiPerusahaan(listData, 1));
        model.addAttribute("vp_status_2", AdagaweMethods.filterVerifikasiPerusahaan(listData, 2));

        model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
        model.addAttribute("url", AdagaweMethods.getMainUrl(request, 2));

        return "/admin/verifikasi/index";
    }

    @GetMapping("/perusahaan/verifikasi/createnext")
    public String createnext(Model model) {
        model.addAttribute("verifikasiperusahaan", new VerifikasiPerusahaan());
        model.addAttribute("perusahaan", AdagaweMethods.getPerusahaanBySession(adagaweService));
        model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
        return "/perusahaan/verifikasi/createnext";
    }

    @PostMapping("/perusahaan/verifikasi/createnext")
    public String postCreatenext(RedirectAttributes redirectAttributes, @RequestParam("siufile") MultipartFile siufile,  @RequestParam("tdpfile") MultipartFile tdpfile,
                                 @ModelAttribute("verifikasiperusahaan") @Valid VerifikasiPerusahaan verifikasiperusahaan, BindingResult result, Model model) {
        System.out.println(result.getAllErrors());
        if (siufile.isEmpty()){
            result.addError(new FieldError("verifikasiperusahaan", "siu", "SIU wajib diisi."));
        }
        if (tdpfile.isEmpty()){
            result.addError(new FieldError("verifikasiperusahaan", "tdp", "TDP wajib diisi."));
        }

        if (result.hasErrors()) {
            model.addAttribute("perusahaan", AdagaweMethods.getPerusahaanBySession(adagaweService));
            model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
            return "/perusahaan/verifikasi/createnext";
        }

        String fileSiu = FileUploadHelper.upload(siufile, "siu");
        String fileTdp = FileUploadHelper.upload(tdpfile, "tdp");

        verifikasiperusahaan.setSiu(fileSiu);
        verifikasiperusahaan.setTdp(fileTdp);

        verifikasiPerusahaanService.savenext(verifikasiperusahaan);

        //redirectAttributes.addFlashAttribute("message", "Perusahaan berhasil ditambah.");
        return "redirect:/perusahaan";
    }

    @GetMapping("/admin/verifikasi/detail/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        VerifikasiPerusahaan verifikasiperusahaan = verifikasiPerusahaanService.getVerifikasiPerusahaanById(id);

        model.addAttribute("admin", AdagaweMethods.getAdminBySession(adagaweService));
        model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
        model.addAttribute("verifikasiperusahaan", verifikasiperusahaan);
        return "/admin/verifikasi/detail";
    }

    @PostMapping("/admin/verifikasi/detail/{id}")
    public String setujuDetail(RedirectAttributes redirectAttributes, @PathVariable("id") int id, @RequestParam("verif") String verif,
                               @ModelAttribute("verifikasiperusahaan") @Valid VerifikasiPerusahaan verifikasiperusahaan, BindingResult result, Model model) {

        if (verif.equals("setuju")){
            verifikasiPerusahaanService.verifikasiPerusahaan(id, verifikasiperusahaan, 1);
            redirectAttributes.addFlashAttribute("message", "Pengajuan verifikasi berhasil disetujui.");
        } else {
             verifikasiPerusahaanService.verifikasiPerusahaan(id, verifikasiperusahaan, 2);
            redirectAttributes.addFlashAttribute("message", "Pengajuan verifikasi ditolak.");
        }

        return "redirect:/admin/verifikasi/index";
    }

    @GetMapping("/perusahaan/verifikasi/history")
    public String history(Model model) {
        //List<VerifikasiPerusahaan> verifikasiperusahaans = verifikasiPerusahaanService.
        int idPerusahaan = AdagaweMethods.getPerusahaanBySession(adagaweService).getId();
        List<VerifikasiPerusahaan> verifikasiperusahaans = verifikasiPerusahaanService.getListVerifikasiPerusahaanById(idPerusahaan);
        model.addAttribute("verifikasiperusahaans", verifikasiperusahaans);
        model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
        model.addAttribute("perusahaan", AdagaweMethods.getPerusahaanBySession(adagaweService));
        return "/perusahaan/verifikasi/history";
    }

    @GetMapping("/perusahaan/verifikasi/detail/{id}")
    public String detailRiwayat(@PathVariable("id") Integer id, Model model) {
        VerifikasiPerusahaan verifikasiperusahaan = verifikasiPerusahaanService.getVerifikasiPerusahaanById(id);

        model.addAttribute("verifikasiperusahaan", verifikasiperusahaan);
        model.addAttribute("userLogin", AdagaweMethods.getUserLoginBySession(adagaweService));
        model.addAttribute("perusahaan", AdagaweMethods.getPerusahaanBySession( adagaweService));
        return "/perusahaan/verifikasi/detail";
    }
}
