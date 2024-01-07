package regular;

import java.util.regex.Pattern;

public class Regular {
	
	public static boolean isNum(String str,int max) {
		return Pattern.matches("^[0-9]{0,"+max+"}$", str);
	}
	
	public static boolean isEng(String str,int max) {
		return Pattern.matches("^[a-zA-Z]{0,"+ max +"}$", str);
	}
	
	public static boolean isNumEng(String str,int max) {
		return Pattern.matches("^[a-zA-Z0-9]{0,"+max+"}$", str);
	}
	
	public static boolean isNumEngKor(String str,int max) {
		return Pattern.matches("^[a-zA-Z0-9가-힣]{0,"+max+"}$", str);
	}
	
	public static boolean isKor(String str,int max) {
		return Pattern.matches("^[가-힣]{0,"+max+"}$", str);
	}
	
	public static boolean isEmail(String str) {
		return Pattern.matches("^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$", str);
	}
	
	
}
