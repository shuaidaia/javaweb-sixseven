package com.sixseven.bean;

import java.util.List;

/**
 * @author Belly
 * @version 1.1.0
 */
public class Page<T> {
    //每页显示多少条记录
    public static final Integer PAGE_SIZE = 3;
    //表示当前第几页数
    private Integer pageNo;
    //表示显示几条记录
    private Integer pageSize = PAGE_SIZE;
    //表示共有多少页
    private Integer pageTotalCount;
    //表示共有多少行记录
    private Integer totalRow;
    //表示当前页返回的记录
    private List<T> items;
    //分页导航的字符串
    private String url;

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getPageTotalCount() {
        return pageTotalCount;
    }

    public void setPageTotalCount(Integer pageTotalCount) {
        this.pageTotalCount = pageTotalCount;
    }

    public Integer getTotalRow() {
        return totalRow;
    }

    public void setTotalRow(Integer totalRow) {
        this.totalRow = totalRow;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
