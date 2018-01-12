package nfc.com;

public class NmmVO {
	private String ucType;//유저인지 가맹점인지 구분
	private int ucnum;//가입번호
	private String ucemail;//이메일
	private String ucphone;//연락처
	private String ucname;//이름,대표명
	private String password;//비번
	private String input_date;//가입날짜
	
	private String company_name;//회사명
	private String company_address;//회사주소
	private String company_phone;//회사연락처
	private String company_id;//아이디
	
	public int getUcnum() {
		return ucnum;
	}
	public void setUcnum(int ucnum) {
		this.ucnum = ucnum;
	}
	public String getUcemail() {
		return ucemail;
	}
	public void setUcemail(String ucemail) {
		this.ucemail = ucemail;
	}
	public String getUcname() {
		return ucname;
	}
	public void setUcname(String ucname) {
		this.ucname = ucname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCompany_address() {
		return company_address;
	}
	public void setCompany_address(String company_address) {
		this.company_address = company_address;
	}
	public String getUcphone() {
		return ucphone;
	}
	public void setUcphone(String ucphone) {
		this.ucphone = ucphone;
	}
	public String getCompany_phone() {
		return company_phone;
	}
	public void setCompany_phone(String company_phone) {
		this.company_phone = company_phone;
	}
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public String getUcType() {
		return ucType;
	}
	public void setUcType(String ucType) {
		this.ucType = ucType;
	}
}
