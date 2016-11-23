package first.sample.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import first.common.common.CommandMap;
import first.sample.service.SampleService;

//현재클래스가 컨트롤러 라는것을 알려준다.
//컨트롤로는 웹 클라이언트에서 들어온 요청을 해당 비지니스  로직을 호출하고, 수행결과와 함께
//응답을 해주는 Dispatcher 역할을 한다.
@Controller
public class SampleController {
	//사용할 Log4j를 선언
    Logger log = Logger.getLogger(this.getClass());

    //Service 영역의 접근을 위한 선언
    @Resource(name="sampleService")
    private SampleService sampleService;

    //DispatcherServlet은 이 어노테이션을 기준으로 어떤 컨트롤러의 메서드가 호출되어야 할지를 결정
    @RequestMapping(value="/sample/openBoardList.do")//실행될 주소
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/sample/boardList");
    	//우리가 화면에 보여줄 jsp파일을 의미한다.

        List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);
        //서비스 로직의 결과를 ModelAndView 객체에 담어서 클라이언트, 즉 jsp에서 그 결과를 사용 할 수 있도록 한다.
        mv.addObject("list",list);
        return mv;
    }

    @RequestMapping(value="/sample/testMapArgumentResolver.do")
    public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("");

    	if (commandMap.isEmpty() == false){
    		Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
    		Entry<String,Object> entry = null;
    		while(iterator.hasNext()){
    			entry = iterator.next();
    			log.debug("key : " + entry.getKey() + ", value :" + entry.getValue());
    		}
    	}
    	return mv;
    }

    @RequestMapping(value="/sample/openBoardWrite.do")
    public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("/first/sample/boardWrite");
    	return mv;
    }

    @RequestMapping(value="/sample/insertBoard.do")
    public ModelAndView insertBoard(CommandMap commandMap) throws Exception{
    	ModelAndView mv = new ModelAndView("redirect:/sample/openBoardList.do");

    	sampleService.insertBoard(commandMap.getMap());

    	return mv;
    }
}