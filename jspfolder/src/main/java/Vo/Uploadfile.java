package Vo;

public class Uploadfile {

	//필드명
	private int fno;
	private String frealnm;
	private String foriginnm;
	private String frdate;	//Date->String
	private int bno;	//게시글번호 FK
	
	//게터세터
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFrealnm() {
		return frealnm;
	}
	public void setFrealnm(String frealnm) {
		this.frealnm = frealnm;
	}
	public String getForiginnm() {
		return foriginnm;
	}
	public void setForiginnm(String foriginnm) {
		this.foriginnm = foriginnm;
	}
	public String getFrdate() {
		return frdate;
	}
	public void setFrdate(String frdate) {
		this.frdate = frdate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}

	
}
