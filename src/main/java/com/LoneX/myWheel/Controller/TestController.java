package com.LoneX.myWheel.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {

	@RequestMapping("/admin")
	public ModelAndView admin() {
		return new ModelAndView("espaceadmin");
	}
	@RequestMapping("/gerercg")
	public ModelAndView gerercg() {
		return new ModelAndView("gérercomptesgestionnaires");
	}
	@RequestMapping("/gerercl")
	public ModelAndView gerercl() {
		return new ModelAndView("gérercompteslocataires");
	}
	@RequestMapping("/gererdepot")
	public ModelAndView gererdepot() {
		return new ModelAndView("gérerdépot");
	}
	@RequestMapping("/gerervehicule")
	public ModelAndView gerervehicule() {
		return new ModelAndView("gérervéhicules");
	}
	@RequestMapping("/listeVehic")
	public ModelAndView listeVeh() {
		return new ModelAndView("listedesvehicules");
	}
	@RequestMapping("/tableGesta")
	public ModelAndView tablega() {
		return new ModelAndView("tablegestionnairesagence");
	}
	@RequestMapping("/table")
	public ModelAndView table() {
		return new ModelAndView("table");
	}
	@RequestMapping("/bodepot")
	public ModelAndView depot() {
		return new ModelAndView("BOdepot");
	}
	@RequestMapping("/facture")
	public ModelAndView fac() {
		return new ModelAndView("facture");
	}

	
}
