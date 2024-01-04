package tableVo;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * 지역 게시글 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class Zone implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 게시글 번호. */
	private Integer znno;

	/** 게시글 제목. */
	private String zntitle;

	/** 게시글 내용. */
	private String zncontent;

	/** 게시글 등록일. */
	private Date znrdate;

	/** 게시글 조회수. */
	private Integer znhit;

	/** zntype. */
	private String zntype;

	/** 회원정보. */
	private Member member;

	/** 지역 댓글 목록. */
	private Set<ZoneReply> zoneReplySet;

	/** 지역 첨부파일 목록. */
	private Set<ZoneUploadfile> zoneUploadfileSet;

	/**
	 * 생성자.
	 */
	public Zone() {
		this.zoneReplySet = new HashSet<ZoneReply>();
		this.zoneUploadfileSet = new HashSet<ZoneUploadfile>();
	}

	/**
	 * 게시글 번호을 설정합니다..
	 * 
	 * @param znno
	 *            게시글 번호
	 */
	public void setZnno(Integer znno) {
		this.znno = znno;
	}

	/**
	 * 게시글 번호을 가져옵니다..
	 * 
	 * @return 게시글 번호
	 */
	public Integer getZnno() {
		return this.znno;
	}

	/**
	 * 게시글 제목을 설정합니다..
	 * 
	 * @param zntitle
	 *            게시글 제목
	 */
	public void setZntitle(String zntitle) {
		this.zntitle = zntitle;
	}

	/**
	 * 게시글 제목을 가져옵니다..
	 * 
	 * @return 게시글 제목
	 */
	public String getZntitle() {
		return this.zntitle;
	}

	/**
	 * 게시글 내용을 설정합니다..
	 * 
	 * @param zncontent
	 *            게시글 내용
	 */
	public void setZncontent(String zncontent) {
		this.zncontent = zncontent;
	}

	/**
	 * 게시글 내용을 가져옵니다..
	 * 
	 * @return 게시글 내용
	 */
	public String getZncontent() {
		return this.zncontent;
	}

	/**
	 * 게시글 등록일을 설정합니다..
	 * 
	 * @param znrdate
	 *            게시글 등록일
	 */
	public void setZnrdate(Date znrdate) {
		this.znrdate = znrdate;
	}

	/**
	 * 게시글 등록일을 가져옵니다..
	 * 
	 * @return 게시글 등록일
	 */
	public Date getZnrdate() {
		return this.znrdate;
	}

	/**
	 * 게시글 조회수을 설정합니다..
	 * 
	 * @param znhit
	 *            게시글 조회수
	 */
	public void setZnhit(Integer znhit) {
		this.znhit = znhit;
	}

	/**
	 * 게시글 조회수을 가져옵니다..
	 * 
	 * @return 게시글 조회수
	 */
	public Integer getZnhit() {
		return this.znhit;
	}

	/**
	 * zntype을 설정합니다..
	 * 
	 * @param zntype
	 *            zntype
	 */
	public void setZntype(String zntype) {
		this.zntype = zntype;
	}

	/**
	 * zntype을 가져옵니다..
	 * 
	 * @return zntype
	 */
	public String getZntype() {
		return this.zntype;
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
	 * 지역 댓글 목록을 설정합니다..
	 * 
	 * @param zoneReplySet
	 *            지역 댓글 목록
	 */
	public void setZoneReplySet(Set<ZoneReply> zoneReplySet) {
		this.zoneReplySet = zoneReplySet;
	}

	/**
	 * 지역 댓글를 추가합니다..
	 * 
	 * @param zoneReply
	 *            지역 댓글
	 */
	public void addZoneReply(ZoneReply zoneReply) {
		this.zoneReplySet.add(zoneReply);
	}

	/**
	 * 지역 댓글 목록을 가져옵니다..
	 * 
	 * @return 지역 댓글 목록
	 */
	public Set<ZoneReply> getZoneReplySet() {
		return this.zoneReplySet;
	}

	/**
	 * 지역 첨부파일 목록을 설정합니다..
	 * 
	 * @param zoneUploadfileSet
	 *            지역 첨부파일 목록
	 */
	public void setZoneUploadfileSet(Set<ZoneUploadfile> zoneUploadfileSet) {
		this.zoneUploadfileSet = zoneUploadfileSet;
	}

	/**
	 * 지역 첨부파일를 추가합니다..
	 * 
	 * @param zoneUploadfile
	 *            지역 첨부파일
	 */
	public void addZoneUploadfile(ZoneUploadfile zoneUploadfile) {
		this.zoneUploadfileSet.add(zoneUploadfile);
	}

	/**
	 * 지역 첨부파일 목록을 가져옵니다..
	 * 
	 * @return 지역 첨부파일 목록
	 */
	public Set<ZoneUploadfile> getZoneUploadfileSet() {
		return this.zoneUploadfileSet;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((znno == null) ? 0 : znno.hashCode());
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
		Zone other = (Zone) obj;
		if (znno == null) {
			if (other.znno != null) {
				return false;
			}
		} else if (!znno.equals(other.znno)) {
			return false;
		}
		return true;
	}

}
