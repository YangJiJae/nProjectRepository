package first.com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class NmmDAOimple implements NmmDAO{
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private final String url="jdbc:mysql://localhost:3306/nmm";
	private final String user="root";
	private final String password="master";//3099wjsghk
	
	//개인회원 고유번호 마지막값 가져오기
	private String userCountSql="select max(`unum`)unum from user";
	//개인회원가입
	private String joinUserSql="insert into user(unum,phone,email,uname,password,input_date)"
			+ " values(?,?,?,?,?,?)";
	//개인회원 이메일 중복검사
	private String userEmailSameSql="select count(*) as count from user where email=?";
	//개인회원 연락처 중복검사
	private String userTelSameSql="select count(*) as count from user where phone=?";
	
	
	//가맹점회원 고유번호 마지막값 가져오기
	private String comCountSql="select max(`cnum`)cnum from comuser";
	//가맹점 회원가입
	private String joinComSql="insert into comuser(cnum,cphone,coffphone,cemail"
			+ ",cid,cname,company_name,company_address,cpassword,cinput_date)"
			+ " values(?,?,?,?,?,?,?,?,?,?)";
	//가맹점 이메일 중복검사
	private String comEmailSameSql="select count(*) as count from comuser where cemail=?";
	//가맹점 연락처 중복검사
	private String comTelSameSql="select count(*) as count from comuser where cphone=?";
	
	//로그인(개인)
	private String loginUserSql="select count(*) as count from user where phone=? or email=?"
			+ "and password=?";
	//로그인(가맹점)
	private String loginComSql="select  count(*) as count from comuser where cid=? and cpassword=?";
	
	//닉네임 가져오기(가맹점)
	private String comNameSql="select company_name as nicname from comuser where cid=?";
	//닉네임 가져오기(개인)
	private String userNameSql="select uname as nicname from user where phone=? or email=?";
	
	public NmmDAOimple() {
		System.out.println("DB접속중..");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Find Successed");
		} catch (ClassNotFoundException e) {
			System.out.println("Find Failed");
			e.printStackTrace();
		}
	}
	
	//개인회원가입
	@Override
	public int joinUser(NmmVO vo) { 
		int flag=0;
		try {
			conn=DriverManager.getConnection(url,user,password);
			
			//유저고유번호 마지막가입자 것 가져와서 +1하기
			String sql1 = userCountSql;
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			int num=0;
			while(rs.next()){
				num=rs.getInt("unum");
			}
			
			//가입하기
			String sql2=joinUserSql;
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, (num+1));
			pstmt.setString(2, vo.getUcphone());
			pstmt.setString(3, vo.getUcemail());
			pstmt.setString(4, vo.getUcname());
			pstmt.setString(5, vo.getPassword());
			pstmt.setString(6, vo.getInput_date());
			flag=pstmt.executeUpdate();

			System.out.println("연결..........");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return flag;
	}
	
	//개인회원 이메일 중복 체크
	@Override
	public int joinUserEmCheck(NmmVO vo) {
		int count=0;//중복시 1개 이상의 값을 가져온다.
		try {
			conn=DriverManager.getConnection(url,user,password);
			
			String sql = userEmailSameSql;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUcemail());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				count=rs.getInt("count");
			}
			
			System.out.println("연결..........");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return count;
	}
	//개인회원 휴대전화 중복 체크
	@Override
	public int joinUserPhCheck(NmmVO vo) {
		int count=0;//중복시 1개 이상의 값을 가져온다.
		try {
			conn=DriverManager.getConnection(url,user,password);
			
			String sql = userTelSameSql;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUcphone());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				count=rs.getInt("count");
			}
			
			System.out.println("연결..........");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return count;
	}
	
	//가맹점 회원가입
	@Override
	public int joinComUser(NmmVO vo) {
		int flag=0;
		try {
			conn=DriverManager.getConnection(url,user,password);
			
			//유저고유번호 마지막가입자 것 가져와서 +1하기
			String sql1 = comCountSql;
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			
			int num=0;
			while(rs.next()){
				num=rs.getInt("cnum");
			}
			//가입하기
			String sql2=joinComSql;
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, (num+1));
			pstmt.setString(2, vo.getUcphone());
			pstmt.setString(3, vo.getCompany_phone());
			pstmt.setString(4, vo.getUcemail());
			pstmt.setString(5, vo.getCompany_id());
			pstmt.setString(6, vo.getUcname());
			pstmt.setString(7, vo.getCompany_name());
			pstmt.setString(8, vo.getCompany_address());
			pstmt.setString(9, vo.getPassword());
			pstmt.setString(10, vo.getInput_date());
			flag=pstmt.executeUpdate();

			System.out.println("연결..........");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return flag;
	}

	//가맹점 회원 이메일 중복 체크
	@Override
	public int joinComEmCheck(NmmVO vo) {
		int count=0;//중복시 1개 이상의 값을 가져온다.
		try {
			conn=DriverManager.getConnection(url,user,password);
			
			String sql = comEmailSameSql;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUcemail());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				count=rs.getInt("count");
			}
			
			System.out.println("연결..........");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return count;
	}

	//개인회원 휴대전화 중복 체크
	@Override
	public int joinComPhCheck(NmmVO vo) {
		int count=0;//중복시 1개 이상의 값을 가져온다.
		try {
			conn=DriverManager.getConnection(url,user,password);
			
			String sql = comTelSameSql;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUcphone());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				count=rs.getInt("count");
			}
			
			System.out.println("연결..........");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return count;
	}
	
	//개인 로그인
	@Override
	public int loginUser(NmmVO vo) {
		int flag=0;
		try {
			conn=DriverManager.getConnection(url,user,password);
			String sql=loginUserSql;
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getUcemail());
			pstmt.setString(2, vo.getUcphone());
			pstmt.setString(3, vo.getPassword());
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				 flag=rs.getInt("count");//1이면 회원정보일치(성공), 0이면 불일치(실패)
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return flag;
	}
	
	//가맹점 로그인
	@Override
	public int loginCom(NmmVO vo) {
		int flag=0;
		try {
			conn=DriverManager.getConnection(url,user,password);
			String sql=loginComSql;
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCompany_id());
			pstmt.setString(2, vo.getPassword());
			
			rs=pstmt.executeQuery();
			while(rs.next()){
				 flag=rs.getInt("count");//1이면 회원정보일치(성공), 0이면 불일치(실패)
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return flag;
	}
	
	//개인 or 가맹점 닉네임 가져오기
	@Override
	public String nicName(NmmVO vo) {
		String flag="";
		try {
			conn=DriverManager.getConnection(url,user,password);
			
			String type=vo.getUcType();//개인인지 가맹점인지 구분
			String sql="";
			if(type.equals("com")){
				sql=comNameSql;
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, vo.getCompany_id());
			}else if(type.equals("user")){
				sql=userNameSql;
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, vo.getCompany_id());
				pstmt.setString(2, vo.getCompany_id());
			}
			rs=pstmt.executeQuery();
			while(rs.next()){
				 flag=rs.getString("nicname");//닉네임 가져오기
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn!=null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return flag;
	}
}
