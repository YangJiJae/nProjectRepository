package nfc.event.login.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import nfc.common.common.CommandMap;
import nfc.event.login.service.LoginService;

@Controller
@SessionAttributes({"ID","SEL"})
public class LoginController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="loginService")
	private LoginService loginService;
	
	@RequestMapping(value="/login_form.do")
    public ModelAndView login_form(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView("/login/login_form");
    	return mv;
    }
	
	@RequestMapping(value="/loginGo.do")
    public ModelAndView loginGo(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		Map<String,Object> map = loginService.selectIdInfo(commandMap.getMap());
		
		//계정없음
		if(map == null){
			mv.addObject("errorCd", "01");
			mv.addObject("errorMsg", "존재하지 않는 이메일 or 연락처(개인회원)입니다.");
			mv.setViewName("/login/login_form");
			return mv;
		}else{
			if(!map.get("PWD").equals(commandMap.get("PWD"))){//나중엔 암호화된 값으로 비교해야함.
				mv.addObject("errorCd", "02");
				mv.addObject("errorMsg", "비밀번호가 틀립니다.");
				mv.setViewName("/login/login_form");
				return mv;
			}
			if("user".equals(commandMap.get("SEL"))){
				mv.addObject("ID", commandMap.get("CUS_ID"));
			}else{
				mv.addObject("ID", commandMap.get("COM_ID"));
			}
			mv.addObject("SEL", commandMap.get("SEL"));//user, com
			mv.addObject("map", map);
			mv.setViewName("/main/main");
		}
    	return mv;
    }
	
	@RequestMapping(value="/logout.do")
    public ModelAndView logout(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
    	ModelAndView mv = new ModelAndView("/main/main");
    	mv.addObject("ID", "");
    	mv.addObject("SEL", "");
    	return mv;
    }
	
}
