package paging;

public class PagingVO {
	private int nowPage; //���� �������� ��ȣ
	private int startPage; //���� ���������� ���� ��ȣ
	private int endPage; //���� ���������� ����ȣ
	private int total; //��� �Խñ� �� ����
	private int perPage; //�� �������� ������ �Խñ��� ����
	private int lastPage; //��ü ���������� ����ȣ
	private int start; //ȭ�鿡���� �Խñ� ���� ��ȣ
	private int end; //ȭ�鿡���� �Խñ� ����ȣ
	private int cntPage =10; //������ ���������� ������ ����
	
	public PagingVO() {}
	public PagingVO(int nowPage, int total, int perPage) {
		
		setNowPage(nowPage);
		setTotal(total);
		setPerPage(perPage);

		//����¡ ����ȣ ���
		calcLastPage(total,perPage);
		
		//�Խñ� ���۹�ȣ, ����ȣ ��� (mysql�� ���۹�ȣ�� �ʿ�)
		calcStartEnd(nowPage,perPage);
		
		//���������� ������ ������ ����, ���� ��ȣ ���
		calcStartEndPage(nowPage,cntPage);
		
	}
	public void calcLastPage(int total, int perPage) {
		int lastPage = (int)Math.ceil(total/(double)perPage);
		setLastPage(lastPage);
	}
	
	public void calcStartEndPage(int nowPage, int cntPage) {
		
		int endPage = (int)Math.ceil((double)nowPage/cntPage)*cntPage;
		int startPage = endPage-cntPage+1;
		
		//���� �� ������ ��ȣ���� ������������ ū ���
		if(endPage > lastPage) { 
			endPage = lastPage;
		}
		
		//Ȥ�� �� ���� ��Ȳ ó��
		if(startPage <1) {
			startPage = 1;
		}
		
		setEndPage(endPage);
		setStartPage(startPage);
		
		
	}
	
	public void calcStartEnd(int nowPage, int perPage) {
		int end = nowPage*perPage;
		int start = end-perPage+1;
		
		setStart(start);
		setEnd(end);
		
	}
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getLastPage() {
		return lastPage;
	}
	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public int getCntPage() {
		return cntPage;
	}
	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}
	
	
}
