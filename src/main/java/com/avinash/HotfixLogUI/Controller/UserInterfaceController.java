package com.avinash.HotfixLogUI.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class UserInterfaceController {

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String loadIndexPage1() {
		return "index";
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public String loadIndexPage2() {
		return "index";
	}
	
	@RequestMapping(value="/HotfixLogUI", method=RequestMethod.GET)
	public String loadIndexPage() {
		return "hotfixIndex";
	}
	
	@RequestMapping(value="/HotfixLogUI", method=RequestMethod.POST)
	public String loadResultPage() {
		return "hotfixIndex";
	}

	@RequestMapping(value="/error", method=RequestMethod.GET)
	public String errorPage1() {
		return "error";
	}
	@RequestMapping(value="/error", method=RequestMethod.POST)
	public String errorPage2() {
		return "error";
	}
}
