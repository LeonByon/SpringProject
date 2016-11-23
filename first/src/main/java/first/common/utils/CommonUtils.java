package first.common.utils;

import java.util.UUID;

public class CommonUtils {

	public static String getRandomString() {
		//(DB에서 지정한)32글자의 랜덤한 문자열을 만들어서 반환해주는 기능
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
