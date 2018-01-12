package nfc.common.util;

public class StringUtil {
	
	public static String nvl(String expr1){
		if(expr1 == null || "".equals(expr1)){
			return "";
		}
		return expr1;
	}
	
	public static String nvl(String expr1, String expr2){
		if(expr1 == null || "".equals(expr1)){
			return expr2;
		}
		return expr1;
	}
}
