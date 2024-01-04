package vo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 질문게시판 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class Qna implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 게시글 번호. */
	private Integer quno;

	/** 게시글 제목. */
	private String qutitle;

	/** 게시글 내용. */
	private String qucontent;

	/** 게시글 등록일. */
	private Date qurdate;

	/** 게시글 조회수. */
	private Integer quhit;

	/** 회원정보. */
	private Member member;

	/** 질문게시판 첨부파일 목록. */
	private Set<QnaFile> qnaFileSet;

	/** 질문게시판 댓글 목록. */
	private Set<QnaReply> qnaReplySet;

	/**
	 * 생성자.
	 */
	public Qna() {
		this.qnaFileSet = new HashSet<QnaFile>();
		this.qnaReplySet = new HashSet<QnaReply>();
	}

	/**
	 * 게시글 번호을 설정합니다..
	 * 
	 * @param quno
	 *            게시글 번호
	 */
	public void setQuno(Integer quno) {
		this.quno = quno;
	}

	/**
	 * 게시글 번호을 가져옵니다..
	 * 
	 * @return 게시글 번호
	 */
	public Integer getQuno() {
		return this.quno;
	}

	/**
	 * 게시글 제목을 설정합니다..
	 * 
	 * @param qutitle
	 *            게시글 제목
	 */
	public void setQutitle(String qutitle) {
		this.qutitle = qutitle;
	}

	/**
	 * 게시글 제목을 가져옵니다..
	 * 
	 * @return 게시글 제목
	 */
	public String getQutitle() {
		return this.qutitle;
	}

	/**
	 * 게시글 내용을 설정합니다..
	 * 
	 * @param qucontent
	 *            게시글 내용
	 */
	public void setQucontent(String qucontent) {
		this.qucontent = qucontent;
	}

	/**
	 * 게시글 내용을 가져옵니다..
	 * 
	 * @return 게시글 내용
	 */
	public String getQucontent() {
		return this.qucontent;
	}

	/**
	 * 게시글 등록일을 설정합니다..
	 * 
	 * @param qurdate
	 *            게시글 등록일
	 */
	public void setQurdate(Date qurdate) {
		this.qurdate = qurdate;
	}

	/**
	 * 게시글 등록일을 가져옵니다..
	 * 
	 * @return 게시글 등록일
	 */
	public Date getQurdate() {
		return this.qurdate;
	}

	/**
	 * 게시글 조회수을 설정합니다..
	 * 
	 * @param quhit
	 *            게시글 조회수
	 */
	public void setQuhit(Integer quhit) {
		this.quhit = quhit;
	}

	/**
	 * 게시글 조회수을 가져옵니다..
	 * 
	 * @return 게시글 조회수
	 */
	public Integer getQuhit() {
		return this.quhit;
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
	 * 질문게시판 첨부파일 목록을 설정합니다..
	 * 
	 * @param qnaFileSet
	 *            질문게시판 첨부파일 목록
	 */
	public void setQnaFileSet(Set<QnaFile> qnaFileSet) {
		this.qnaFileSet = qnaFileSet;
	}

	/**
	 * 질문게시판 첨부파일를 추가합니다..
	 * 
	 * @param qnaFile
	 *            질문게시판 첨부파일
	 */
	public void addQnaFile(QnaFile qnaFile) {
		this.qnaFileSet.add(qnaFile);
	}

	/**
	 * 질문게시판 첨부파일 목록을 가져옵니다..
	 * 
	 * @return 질문게시판 첨부파일 목록
	 */
	public Set<QnaFile> getQnaFileSet() {
		return this.qnaFileSet;
	}

	/**
	 * 질문게시판 댓글 목록을 설정합니다..
	 * 
	 * @param qnaReplySet
	 *            질문게시판 댓글 목록
	 */
	public void setQnaReplySet(Set<QnaReply> qnaReplySet) {
		this.qnaReplySet = qnaReplySet;
	}

	/**
	 * 질문게시판 댓글를 추가합니다..
	 * 
	 * @param qnaReply
	 *            질문게시판 댓글
	 */
	public void addQnaReply(QnaReply qnaReply) {
		this.qnaReplySet.add(qnaReply);
	}

	/**
	 * 질문게시판 댓글 목록을 가져옵니다..
	 * 
	 * @return 질문게시판 댓글 목록
	 */
	public Set<QnaReply> getQnaReplySet() {
		return this.qnaReplySet;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((quno == null) ? 0 : quno.hashCode());
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
		Qna other = (Qna) obj;
		if (quno == null) {
			if (other.quno != null) {
				return false;
			}
		} else if (!quno.equals(other.quno)) {
			return false;
		}
		return true;
	}

}
