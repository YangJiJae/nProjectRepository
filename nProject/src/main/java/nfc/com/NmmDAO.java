package nfc.com;

public interface NmmDAO {
	
	public int joinUser(NmmVO vo);//개인 회원가입
	
	public int joinUserEmCheck(NmmVO vo);//개인 회원 이메일 중복체크
	
	public int joinUserPhCheck(NmmVO vo);//개인 회원 휴대전화 중복체크
	
	public int joinComUser(NmmVO vo);//가맹점 회원가입
	
	public int joinComEmCheck(NmmVO vo);//가맹점 이메일 중복체크
	
	public int joinComPhCheck(NmmVO vo);//가맹점 휴대전화 중복체크
	
	public int loginUser(NmmVO vo);//개인 로그인
	
	public int loginCom(NmmVO vo);//가맹점 로그인
	
	public String nicName(NmmVO vo);//개인 or 가맹점 이름 가져오기
}
