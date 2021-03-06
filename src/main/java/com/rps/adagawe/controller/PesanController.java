package com.rps.adagawe.controller;

import com.rps.adagawe.helper.AdagaweMethods;
import com.rps.adagawe.helper.AdagaweService;
import com.rps.adagawe.service.PesanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import javax.servlet.http.HttpServletRequest;

@Controller
public class PesanController {

    @Autowired
    AdagaweService adagaweService;

    @Autowired
    PesanService pesanService;

    @GetMapping("/pelamar/messages")
    public String getMessagesPelamar(Model model) {

        return "/pelamar/profile/index";
    }

    @GetMapping("/perusahaan/messages")
    public String getMessagesPerusahaan(Model model, HttpServletRequest request) {

        // Redirect jika belum melengkapi profil
        if (!AdagaweMethods.isPerusahaanExist(adagaweService)) {
            return "redirect:/perusahaan/information";
        }

        model.addAttribute("pesans", pesanService.getByPesanUntuk(11));
        model.addAttribute("perusahaan", AdagaweMethods.getPerusahaanBySession(adagaweService));
        model.addAttribute("url", AdagaweMethods.getMainUrl(request, 2));

        return "/perusahaan/pesan";
    }
}
