package regular;

import java.util.regex.Pattern;

public class Regular {
	// 숫자
	public static boolean isNum(String str,int max) {
		return Pattern.matches("^[0-9]{0,"+max+"}$", str);
	}
	// 영어
	public static boolean isEng(String str,int max) {
		return Pattern.matches("^[a-zA-Z]{0,"+ max +"}$", str);
	}
	// 숫자 영어
	public static boolean isNumEng(String str,int max) {
		return Pattern.matches("^[a-zA-Z0-9]{0,"+max+"}$", str);
	}
	// 숫자영어한글
	public static boolean isNumEngKor(String str,int max) {
		return Pattern.matches("^[a-zA-Z0-9가-힣]{0,"+max+"}$", str);
	}
	// 한글
	public static boolean isKor(String str,int max) {
		return Pattern.matches("^[가-힣]{0,"+max+"}$", str);
	}
	// 이메일
	public static boolean isEmail(String str) {
		return Pattern.matches("^[a-z0-9A-Z._-]*@[a-z0-9A-Z]*.[a-zA-Z.]*$", str);
	}
	
	// 사용자 패스워드에 대한 정규식 - 대소문자 + 숫자 + 특수문자 조합으로 8 ~ 24자리로 정의 한다.
    public static boolean isPass(String str) {
		return Pattern.matches("^(?=.*[a-zA-Z])((?=.*\\d)|(?=.*\\W)).{8,24}+$", str);
	}
    // 핸드폰 번호 - 3자리 숫자에 대한 정규식
	public static boolean isNum3(String str) {
		return Pattern.matches("^[0-9]{3}$", str);
	}
	// 핸드폰 번호 - 4자리 숫자에 대한 정규식
	public static boolean isNum4(String str) {
		return Pattern.matches("^[0-9]{4}$", str);
	}
	
	public static boolean isId(String str) {
		return Pattern.matches("^[a-z][a-z0-9]{4,20}$", str);
	}
}
