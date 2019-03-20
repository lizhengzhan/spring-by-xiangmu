package com.jk.util;

import java.util.List;

public class PageUtil {

	public static final String PAGENAME = "page";
	private static final int defaultPageSize = 3;

	/**
	 * 开始条数
	 */
	private Integer start;			//开始条数
	/**
	 * 当前页
	 */
	private Integer currentPage;	//当前页
	/**
	 * 每页展示条数
	 */
	private Integer pageSize;		//每页展示条数
	/**
	 * 总页数
	 */
	private Integer totalPage;		//总页数、
	/**
	 * 总条数
	 */
	private Integer totalCount;		//总条数
	
	/**
	 * 分页后list集合
	 */
	private List list;				//分页数据
	
	/**
	 * 第一个参数：currentPage，第二个参数：pageSize
	 * @param currentPage
	 * @param pageSize
	 */
	public PageUtil(String currentPage, String pageSize) {
		super();
		if(pageSize != null && !"".equals(pageSize.trim())) {
			try {
				this.pageSize = Integer.parseInt(pageSize);				
			} catch (Exception e) {
				this.pageSize = defaultPageSize;
			}
		}else {
			this.pageSize = defaultPageSize;
		}
		if(currentPage != null && !"".equals(currentPage.trim())) {
			try {
				this.currentPage = Integer.parseInt(currentPage);				
			} catch (Exception e) {
				this.currentPage = 1;
			}
		}else {
			this.currentPage = 1;
		}
		if(this.currentPage > 0) {
			this.start = (this.currentPage - 1) * this.pageSize;			
		}
	}
	
	public Integer getStart() {
		if(currentPage > 0) {
			this.start = (currentPage - 1) * pageSize;			
		}
		if(start == null) {
			start = 0;
		}
		return start;
	}

	public void setStart(Integer start) {
		this.start = start;
	}

	public Integer getCurrentPage() {
		//设置当前页的默认值
		if(currentPage == null){
			this.currentPage = 1;
		}
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getPageSize() {
		//设置每页条数的默认值
		if(pageSize == null){
			pageSize = defaultPageSize;
		}
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getTotalPage() {
		if(totalPage == null) {
			this.totalPage = 1;
		}
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotalCount() {
		if(totalCount == null) {
			this.totalCount = 0;
		}
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
		if(totalCount > 0) {
			this.totalPage = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;			
		}else {
			this.totalPage = 1;
		}
	}	
	
	public PageUtil() {
		super();
	}

	public PageUtil(Integer start, Integer currentPage, Integer pageSize, Integer totalPage, Integer totalCount,
			List list) {
		super();
		this.start = start;
		this.currentPage = currentPage;
		this.pageSize = pageSize;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
		this.list = list;
	}

	@Override
	public String toString() {
		return "PageUtil [start=" + start + ", currentPage=" + currentPage + ", pageSize=" + pageSize + ", totalPage="
				+ totalPage + ", totalCount=" + totalCount + ", list=" + list + "]";
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	
}
