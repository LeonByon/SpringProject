package first.common.common;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class CommandMap {
	Map<String,Object> map = new HashMap<String, Object>();
	//Map의 해당 key값을 가져온다.
	public Object get(String key){
		return map.get(key);
	}
	//Map에 key,value를 넣는다.
	public void put(String key, Object value){
		map.put(key, value);
	}
	//해당 key를 삭제한다.
	public Object remove(String key){
		return map.remove(key);
	}
	//해당 key가 Map에 있는지 체크한다.
	public boolean containsKey(String key){
		return map.containsKey(key);
	}
	//해당 값이 Map에 있는지 체크한다.
	public boolean containsValue(Object value){
		return map.containsValue(value);
	}
	//Map의 모든 값을 초기화 시킨다.(지운다.)
	public void clear(){
		map.clear();
	}
	//Map의 key와 value값 모두를 Set으로 가져온다.
	public Set<Entry<String,Object>> entrySet(){
		return map.entrySet();
	}
	//Map의 key값을 Set으로 가져온다.
	public Set<String> keySet(){
		return map.keySet();
	}
	//Map 안이 비었는지 체크한다.
	public boolean isEmpty(){
		return map.isEmpty();
	}
	//Map 안에 다른 Map을 추가시킨다.
	public void putAll(Map<? extends String, ?extends Object> m){
		map.putAll(m);
	}
	//이 클래스를 map과 똑같이 사용할 수 있도록 getMap() 추가
	public Map<String,Object> getMap(){
		return map;
	}
}
