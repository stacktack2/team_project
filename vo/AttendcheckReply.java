package vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 출석체크 댓글 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class AttendcheckReply implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 댓글 번호. */
	private Integer chrno;

	/** 댓글 내용. */
	private String chrcontent;

	/** 댓글 작성일. */
	private Date chrdate;

	/** 출석체크 게시판. */
	private Attendcheck attendcheck;

	/** 회원정보. */
	private Member member;

	/**
	 * 생성자.
	 */
	public AttendcheckReply() {
	}

	/**
	 * 댓글 번호을 설정합니다..
	 * 
	 * @param chrno
	 *            댓글 번호
	 */
	public void setChrno(Integer chrno) {
		this.chrno = chrno;
	}

	/**
	 * 댓글 번호을 가져옵니다..
	 * 
	 * @return 댓글 번호
	 */
	public Integer getChrno() {
		return this.chrno;
	}

	/**
	 * 댓글 내용을 설정합니다..
	 * 
	 * @param chrcontent
	 *            댓글 내용
	 */
	public void setChrcontent(String chrcontent) {
		this.chrcontent = chrcontent;
	}

	/**
	 * 댓글 내용을 가져옵니다..
	 * 
	 * @return 댓글 내용
	 */
	public String getChrcontent() {
		return this.chrcontent;
	}

	/**
	 * 댓글 작성일을 설정합니다..
	 * 
	 * @param chrdate
	 *            댓글 작성일
	 */
	public void setChrdate(Date chrdate) {
		this.chrdate = chrdate;
	}

	/**
	 * 댓글 작성일을 가져옵니다..
	 * 
	 * @return 댓글 작성일
	 */
	public Date getChrdate() {
		return this.chrdate;
	}

	/**
	 * 출석체크 게시판을 설정합니다..
	 * 
	 * @param attendcheck
	 *            출석체크 게시판
	 */
	public void setAttendcheck(Attendcheck attendcheck) {
		this.attendcheck = attendcheck;
	}

	/**
	 * 출석체크 게시판을 가져옵니다..
	 * 
	 * @return 출석체크 게시판
	 */
	public Attendcheck getAttendcheck() {
		return this.attendcheck;
	}

	/**
	 * 회원정보을 설정합니다..
	 * 
	 * @param member
	 *            회원정보
	 */
	public void setMember(Member member) {
		this.member = member;
	}

	/**
	 * 회원정보을 가져옵니다..
	 * 
	 * @return 회원정보
	 */
	public Member getMember() {
		return this.member;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((chrno == null) ? 0 : chrno.hashCode());
		return result;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		AttendcheckReply other = (AttendcheckReply) obj;
		if (chrno == null) {
			if (other.chrno != null) {
				return false;
			}
		} else if (!chrno.equals(other.chrno)) {
			return false;
		}
		return true;
	}

}
