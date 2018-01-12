package nfc.event.main.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nfc.common.common.CommandMap;
import nfc.common.util.StringUtil;
import nfc.event.main.service.MainService;

@Controller
public class MainController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainService")
	private MainService mainService;
	
	@RequestMapping(value="/main.do")
    public ModelAndView main(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	ModelAndView mv = new ModelAndView("/main/main");
    	return mv;
    }
	
	
	@RequestMapping(value="/myPage_form.do")
    public ModelAndView myPage_form(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	ModelAndView mv = new ModelAndView("/myPage/myPage_form");
    	mv.addObject("MY_MENU", StringUtil.nvl((String)commandMap.get("MY_MENU"), "menu1/myCouPon_form.jsp"));
    	return mv;
    }
	
	@RequestMapping(value="/adPage_form.do")
    public ModelAndView adPage_form(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	ModelAndView mv = new ModelAndView("/adPage/adPage_form");
    	mv.addObject("AD_MENU", StringUtil.nvl((String)commandMap.get("AD_MENU"), "menu1/CouPonUse_form.jsp"));
    	return mv;
    }
	
}
