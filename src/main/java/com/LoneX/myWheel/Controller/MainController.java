package com.LoneX.myWheel.Controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.LoneX.myWheel.FeedBack.FeedBack;

@Controller
public class MainController {

	@RequestMapping("/")
	public ModelAndView homePage() {
		return new ModelAndView("index");
	}
	@RequestMapping("/team")
	public ModelAndView temPage()  {
		return new ModelAndView("team");
	}
	@RequestMapping("/contact")
	public ModelAndView contactPage() {
		return new ModelAndView("contact","feed",new FeedBack());
	}

	
}

