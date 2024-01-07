package Vo;

public class Reply{

	//필드
	private int rno;
	private String rcontent;
	private String rrdate; //Date->String
	private int mno;	//회원번호(FK)
	private int bno;	//게시글번호(FK)
	//필요한 필드 추가
	private String mnickNm;
	
	//게터세터
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRrdate() {
		return rrdate;
	}
	public void setRrdate(String rrdate) {
		this.rrdate = rrdate;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getMnickNm() {
		return mnickNm;
	}
	public void setMnickNm(String mnickNm) {
		this.mnickNm = mnickNm;
	}
	
}
