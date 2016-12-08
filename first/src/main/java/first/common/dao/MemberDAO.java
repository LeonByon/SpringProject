package first.common.dao;

import first.common.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO login(String id, String passwd);
	//id와 passwd를 입력받아 해당하는 레코드를 리턴해주는 메소드

}
