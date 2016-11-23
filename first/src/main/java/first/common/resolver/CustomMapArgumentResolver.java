package first.common.resolver;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import first.common.common.CommandMap;

public class CustomMapArgumentResolver implements HandlerMethodArgumentResolver {

	//Resolver가 적용 가능한지 검사하는 역할.
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		//컨트롤러의 파라미터가 CommandMap 클래스인지 검사.
		return CommandMap.class.isAssignableFrom(parameter.getParameterType());
	}

	//파라미터와 기타 정보를 받아서 실제 객체를 반환한다.
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest,
			WebDataBinderFactory binderFactory) throws Exception {
		CommandMap commandMap = new CommandMap();

		HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
		Enumeration<?> enumeraion = request.getParameterNames();

		String key = null;
		String[] values = null;
		//request에 있는 값을 iterator를 이요하여 하나씩 가져온다.
		while(enumeraion.hasMoreElements()){
			key = (String) enumeraion.nextElement();
			values = request.getParameterValues(key);
			if(values != null){
				//request에 담겨있는 모든 key와 value를 commandMap에 저장.
				commandMap.put(key, (values.length > 1) ? values : values[0]);
			}
		}
		//결과적으로 모든 파라미터가 담겨있는 commandMap을 반환.
		return commandMap;
	}
}
