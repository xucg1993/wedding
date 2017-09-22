package com.xucg.weeding.model;

/**
 * 分页
 */
public class Pages {

    public final static int PAGE_SHOW_COUNT = 10;
    private String targetType;      //navTab 或 dialog, 用来标记是 navTab 上的分页还是 dialog 上的分页
    private int pageNum = 1;        //当前第几页
    private int numPerPage = 0;     //每页显示多少条
    private int totalCount = 0;     //总条数
    private int pageNumShown;       //页标数字多少个
    private String orderField;      //查询排序
    private String orderDirection;  //升序降序

    public String getTargetType() {
        return targetType;
    }

    public void setTargetType(String targetType) {
        this.targetType = targetType;
    }

    public int getPageNum() {
        return pageNum;
    }

    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public int getNumPerPage() {
        return this.numPerPage > 0 ? this.numPerPage : PAGE_SHOW_COUNT;
    }

    public void setNumPerPage(int numPerPage) {
        this.numPerPage = numPerPage;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getPageNumShown() {
        return pageNumShown;
    }

    public void setPageNumShown(int pageNumShown) {
        this.pageNumShown = pageNumShown;
    }

    public String getOrderField() {
        return orderField;
    }

    public void setOrderField(String orderField) {
        this.orderField = orderField;
    }

    public String getOrderDirection() {
        return "desc".equals(orderDirection) ? "desc" : "asc";
    }

    public void setOrderDirection(String orderDirection) {
        this.orderDirection = orderDirection;
    }


    public int getStartIndex() {
        int pageNum = this.getPageNum() > 0 ? this.getPageNum() - 1 : 0;
        return pageNum * this.getNumPerPage();
    }
}
