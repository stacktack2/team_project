package vo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 공지사항 게시글 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class Notice implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 게시글 번호. */
	private Integer nono;

	/** 게시글 제목. */
	private String notitle;

	/** 게시글 내용. */
	private String nocontent;

	/** 게시글 등록일. */
	private Date nordate;

	/** 게시글 조회수. */
	private Integer nohit;

	/** 회원정보. */
	private Member member;

	/** 공지사항 댓글 목록. */
	private Set<NoticeReply> noticeReplySet;

	/** 공지사항 첨부파일 목록. */
	private Set<NoticeUploadfile> noticeUploadfileSet;

	/**
	 * 생성자.
	 */
	public Notice() {
		this.noticeReplySet = new HashSet<NoticeReply>();
		this.noticeUploadfileSet = new HashSet<NoticeUploadfile>();
	}

	/**
	 * 게시글 번호을 설정합니다..
	 * 
	 * @param nono
	 *            게시글 번호
	 */
	public void setNono(Integer nono) {
		this.nono = nono;
	}

	/**
	 * 게시글 번호을 가져옵니다..
	 * 
	 * @return 게시글 번호
	 */
	public Integer getNono() {
		return this.nono;
	}

	/**
	 * 게시글 제목을 설정합니다..
	 * 
	 * @param notitle
	 *            게시글 제목
	 */
	public void setNotitle(String notitle) {
		this.notitle = notitle;
	}

	/**
	 * 게시글 제목을 가져옵니다..
	 * 
	 * @return 게시글 제목
	 */
	public String getNotitle() {
		return this.notitle;
	}

	/**
	 * 게시글 내용을 설정합니다..
	 * 
	 * @param nocontent
	 *            게시글 내용
	 */
	public void setNocontent(String nocontent) {
		this.nocontent = nocontent;
	}

	/**
	 * 게시글 내용을 가져옵니다..
	 * 
	 * @return 게시글 내용
	 */
	public String getNocontent() {
		return this.nocontent;
	}

	/**
	 * 게시글 등록일을 설정합니다..
	 * 
	 * @param nordate
	 *            게시글 등록일
	 */
	public void setNordate(Date nordate) {
		this.nordate = nordate;
	}

	/**
	 * 게시글 등록일을 가져옵니다..
	 * 
	 * @return 게시글 등록일
	 */
	public Date getNordate() {
		return this.nordate;
	}

	/**
	 * 게시글 조회수을 설정합니다..
	 * 
	 * @param nohit
	 *            게시글 조회수
	 */
	public void setNohit(Integer nohit) {
		this.nohit = nohit;
	}

	/**
	 * 게시글 조회수을 가져옵니다..
	 * 
	 * @return 게시글 조회수
	 */
	public Integer getNohit() {
		return this.nohit;
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
	 * 공지사항 댓글 목록을 설정합니다..
	 * 
	 * @param noticeReplySet
	 *            공지사항 댓글 목록
	 */
	public void setNoticeReplySet(Set<NoticeReply> noticeReplySet) {
		this.noticeReplySet = noticeReplySet;
	}

	/**
	 * 공지사항 댓글를 추가합니다..
	 * 
	 * @param noticeReply
	 *            공지사항 댓글
	 */
	public void addNoticeReply(NoticeReply noticeReply) {
		this.noticeReplySet.add(noticeReply);
	}

	/**
	 * 공지사항 댓글 목록을 가져옵니다..
	 * 
	 * @return 공지사항 댓글 목록
	 */
	public Set<NoticeReply> getNoticeReplySet() {
		return this.noticeReplySet;
	}

	/**
	 * 공지사항 첨부파일 목록을 설정합니다..
	 * 
	 * @param noticeUploadfileSet
	 *            공지사항 첨부파일 목록
	 */
	public void setNoticeUploadfileSet(Set<NoticeUploadfile> noticeUploadfileSet) {
		this.noticeUploadfileSet = noticeUploadfileSet;
	}

	/**
	 * 공지사항 첨부파일를 추가합니다..
	 * 
	 * @param noticeUploadfile
	 *            공지사항 첨부파일
	 */
	public void addNoticeUploadfile(NoticeUploadfile noticeUploadfile) {
		this.noticeUploadfileSet.add(noticeUploadfile);
	}

	/**
	 * 공지사항 첨부파일 목록을 가져옵니다..
	 * 
	 * @return 공지사항 첨부파일 목록
	 */
	public Set<NoticeUploadfile> getNoticeUploadfileSet() {
		return this.noticeUploadfileSet;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((nono == null) ? 0 : nono.hashCode());
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
		Notice other = (Notice) obj;
		if (nono == null) {
			if (other.nono != null) {
				return false;
			}
		} else if (!nono.equals(other.nono)) {
			return false;
		}
		return true;
	}

}
