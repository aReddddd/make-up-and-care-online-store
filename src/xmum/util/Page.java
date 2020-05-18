package xmum.util;

public class Page {
	int start;
	int count;
	int total;
	String param;

	public Page(int start, int count) {
		super();
		this.start = start;
		this.count = count;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}


	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getParam() {
		return param;
	}

	public void setParam(String param) {
		this.param = param;
	}


	public boolean isHasPreviouse(){
		if(start==0)
			return false;
		return true;

	}
	public boolean isHasNext(){
		if(start==getLast())
			return false;
		return true;
	}

	public int getTotalPage(){
		int totalPage;
		// assuming the total is 50, divisible by 5, then there are 10 pages
		if (0 == total % count)
			totalPage = total /count;
			// assuming the total is 51,
			// which is not divisible by 5, there are 11 pages
		else
			totalPage = total / count + 1;

		if(0==totalPage)
			totalPage = 1;
		return totalPage;

	}

	public int getLast(){
		int last;
		// assuming the total is 50, divisible by 5,
		// then the beginning of the last page will be 45
		if (0 == total % count)
			last = total - count;
			// assuming the total number is 51 and not divisible by 5,
			// then the beginning of the last page is 50
		else
			last = total - total % count;

		last = last<0?0:last;
		return last;
	}

}
