package nfc.event.join.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import nfc.common.common.CommandMap;
import nfc.event.join.service.JoinService;

@Controller
public class JoinController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="joinService")
	private JoinService joinService;
	

	@RequestMapping(value="/join_form.do")
    public ModelAndView join_form(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	ModelAndView mv = new ModelAndView("/join/join_form");
    	return mv;
    }
	
	@RequestMapping(value="/comjoin_form.do")
    public ModelAndView comjoin_form(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	ModelAndView mv = new ModelAndView("/join/comjoin_form");
    	return mv;
    }
	
	@RequestMapping(value="/joinGo.do")
    public ModelAndView joinGo(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		joinService.insertJoinGo(commandMap.getMap(), request);
		ModelAndView mv = new ModelAndView("/main/main");
    	return mv;
    }
	
	@RequestMapping(value="/comJoinGo.do")
    public ModelAndView comJoinGo(CommandMap commandMap) throws Exception{
		joinService.insertcomJoinGo(commandMap.getMap());
    	ModelAndView mv = new ModelAndView("/main/main");///join/comjoinGo
    	return mv;
    }
	
	@RequestMapping(value="/joinEmailCheck.do")
    public ModelAndView joinEmailCheck(CommandMap commandMap) throws Exception{
		Map<String,Object> map = joinService.selectIdCheck(commandMap.getMap());

		String response = (long) map.get("CNT") == 0 ? "yes" : "no";
		
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("RESPONSE", response);
    	return mv;
    }
	@RequestMapping(value="/joinPhoneCheck.do")
    public ModelAndView joinPhoneCheck(CommandMap commandMap) throws Exception{
		Map<String,Object> map = joinService.selectIdCheck(commandMap.getMap());

		String response = (long) map.get("CNT") == 0 ? "yes" : "no";
		
    	ModelAndView mv = new ModelAndView("jsonView");
    	mv.addObject("RESPONSE", response);
    	return mv;
    }
	
	
}
