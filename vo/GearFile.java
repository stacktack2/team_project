package vo;

import java.io.Serializable;
import java.util.Date;

/**
 * 장비게시판 첨부파일 모델 클래스.
 * 
 * @author generated by ERMaster
 * @version $Id$
 */
public class GearFile implements Serializable {

	/** serialVersionUID. */
	private static final long serialVersionUID = 1L;

	/** 첨부파일 번호. */
	private Integer grfno;

	/** 첨부파일 실제이름. */
	private String grfrealnm;

	/** 첨부파일 원본이름. */
	private String grforiginnm;

	/** 첨부파일 등록일. */
	private Date grrdate;

	/** 장비게시판. */
	private Gear gear;

	/**
	 * 생성자.
	 */
	public GearFile() {
	}

	/**
	 * 첨부파일 번호을 설정합니다..
	 * 
	 * @param grfno
	 *            첨부파일 번호
	 */
	public void setGrfno(Integer grfno) {
		this.grfno = grfno;
	}

	/**
	 * 첨부파일 번호을 가져옵니다..
	 * 
	 * @return 첨부파일 번호
	 */
	public Integer getGrfno() {
		return this.grfno;
	}

	/**
	 * 첨부파일 실제이름을 설정합니다..
	 * 
	 * @param grfrealnm
	 *            첨부파일 실제이름
	 */
	public void setGrfrealnm(String grfrealnm) {
		this.grfrealnm = grfrealnm;
	}

	/**
	 * 첨부파일 실제이름을 가져옵니다..
	 * 
	 * @return 첨부파일 실제이름
	 */
	public String getGrfrealnm() {
		return this.grfrealnm;
	}

	/**
	 * 첨부파일 원본이름을 설정합니다..
	 * 
	 * @param grforiginnm
	 *            첨부파일 원본이름
	 */
	public void setGrforiginnm(String grforiginnm) {
		this.grforiginnm = grforiginnm;
	}

	/**
	 * 첨부파일 원본이름을 가져옵니다..
	 * 
	 * @return 첨부파일 원본이름
	 */
	public String getGrforiginnm() {
		return this.grforiginnm;
	}

	/**
	 * 첨부파일 등록일을 설정합니다..
	 * 
	 * @param grrdate
	 *            첨부파일 등록일
	 */
	public void setGrrdate(Date grrdate) {
		this.grrdate = grrdate;
	}

	/**
	 * 첨부파일 등록일을 가져옵니다..
	 * 
	 * @return 첨부파일 등록일
	 */
	public Date getGrrdate() {
		return this.grrdate;
	}

	/**
	 * 장비게시판을 설정합니다..
	 * 
	 * @param gear
	 *            장비게시판
	 */
	public void setGear(Gear gear) {
		this.gear = gear;
	}

	/**
	 * 장비게시판을 가져옵니다..
	 * 
	 * @return 장비게시판
	 */
	public Gear getGear() {
		return this.gear;
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((grfno == null) ? 0 : grfno.hashCode());
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
		GearFile other = (GearFile) obj;
		if (grfno == null) {
			if (other.grfno != null) {
				return false;
			}
		} else if (!grfno.equals(other.grfno)) {
			return false;
		}
		return true;
	}

}
