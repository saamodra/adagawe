package com.rps.adagawe.controller;

import com.rps.adagawe.helper.FileUploadHelper;
import com.rps.adagawe.model.Pelamar;
import com.rps.adagawe.model.Pendidikan;
import com.rps.adagawe.model.Pengalaman;
import com.rps.adagawe.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
public class PendidikanController {
    @Autowired
    PendidikanService pendidikanService;

    @Autowired
    PelamarService pelamarService;

    @Autowired
    JenjangService jenjangService;

    @GetMapping("/pendidikan")
    public String index(Model model) {
        List<Pendidikan> pendidikans = pendidikanService.findPendidikanByRowStatus();
        model.addAttribute("pendidikans", pendidikans);
        return "/pendidikan/index";
    }

    @GetMapping("/pendidikan/create")
    public String create(Model model) {
        model.addAttribute("jenjangs", jenjangService.getAll());
        model.addAttribute("pendidikan", new Pendidikan());
        return "/pendidikan/create";
    }

    @PostMapping("/pendidikan/create")
    public String postCreate(RedirectAttributes redirectAttributes,
                             @ModelAttribute("pendidikan") @Valid Pendidikan pendidikan, BindingResult result, Model model) {
        if (pendidikan.getJenjang().getId() == null) {
            result.addError(new FieldError("pendidikan", "jenjang", "Jenjang wajib diisi."));
        }

        if (result.hasErrors()) {
            return "/pendidikan/create";
        }

        Pelamar pelamar = pelamarService.getPelamarById(1);
        pendidikan.setPelamar(pelamar);

        pendidikanService.save(pendidikan);

        redirectAttributes.addFlashAttribute("message", "Pendidikan berhasil ditambah.");
        return "redirect:/pendidikan";
    }


    @GetMapping("/pendidikan/edit/{id}")
    public String edit(@PathVariable("id") Integer id, Model model) {
        Pendidikan pendidikan = pendidikanService.getPendidikanById(id);

        model.addAttribute("jenjangs", jenjangService.getAll());
        model.addAttribute("pendidikan", pendidikan);
        return "/pendidikan/edit";
    }

    @PostMapping("/pendidikan/edit/{id}")
    public String postEdit(RedirectAttributes redirectAttributes, @PathVariable("id") int id,
                           @ModelAttribute("pendidikan") @Valid Pendidikan pendidikan, BindingResult result, Model model) {
        if (pendidikan.getJenjang().getId() == null) {
            result.addError(new FieldError("pendidikan", "jenjang", "Jenjang wajib diisi."));
        }

        if (result.hasErrors()) {
            pendidikan.setId(id);
            model.addAttribute("jenjangs", jenjangService.getAll());
            return "/pendidikan/edit";
        }

        Pendidikan p = pendidikanService.updatePendidikan(id, pendidikan);
        if (p == null) {
            return "/pendidikan/edit";
        }

        redirectAttributes.addFlashAttribute("message", "Pendidikan berhasil diubah.");
        return "redirect:/pendidikan";
    }

    @PostMapping("/pendidikan/delete/{id}")
    public String deletePengalaman(RedirectAttributes redirectAttributes, @PathVariable("id") int id,
                                   @ModelAttribute("pendidikan") @Valid Pendidikan pendidikan, BindingResult result, Model model) {
        Pendidikan emp = pendidikanService.deletePendidikan(id, pendidikan);

        redirectAttributes.addFlashAttribute("message", "Pendidikan berhasil dihapus.");
        return "redirect:/pendidikan";
    }
}