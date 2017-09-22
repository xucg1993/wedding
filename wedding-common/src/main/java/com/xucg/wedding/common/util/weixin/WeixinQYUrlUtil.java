package com.xucg.wedding.common.util.weixin;

import java.net.URLEncoder;

/**
 * 微信企业号接口地址
 */
public class WeixinQYUrlUtil {

    /**
     *  成员接口
     */
    public final static String URL_CREATE_USER = "https://qyapi.weixin.qq.com/cgi-bin/user/create?access_token=";  // 创建成员接口
    public final static String URL_UPDATE_USER = "https://qyapi.weixin.qq.com/cgi-bin/user/update?access_token=";  // 更新成员接口
    public final static String URL_GET_USER = "https://qyapi.weixin.qq.com/cgi-bin/user/get";
    public final static String URL_DELETE_USER = "https://qyapi.weixin.qq.com/cgi-bin/user/delete";
    /**
     * 部门接口
     */
    public final static String URL_CREATE_DEPT = "https://qyapi.weixin.qq.com/cgi-bin/department/create?access_token=";//创建部门接口
    public final static String URL_UPDATE_DEPT ="https://qyapi.weixin.qq.com/cgi-bin/department/update?access_token="; //更新部门接口
    public final static String URL_LIST_DEPT = "https://qyapi.weixin.qq.com/cgi-bin/department/list";
    //获取部门成员(详情)列表
    public final static String URL_USER_LIST = "https://qyapi.weixin.qq.com/cgi-bin/user/list?access_token=ACCESS_TOKEN&department_id=DEPARTMENT_ID&fetch_child=FETCH_CHILD&status=STATUS";

    // 获取accesstoken
    public final static String URL_CORPID_ACCESS_TOKEN = "https://qyapi.weixin.qq.com/cgi-bin/gettoken";
    // 获取jsticket
    public final static String URL_QIYE_JSAPI_TICKET = "https://qyapi.weixin.qq.com/cgi-bin/get_jsapi_ticket";

    // 获取素材
    public final static String URL_GET_MEDIA = "https://qyapi.weixin.qq.com/cgi-bin/media/get?";

    // 发送消息
    public final static String URL_SEND_MESSAGE = "https://qyapi.weixin.qq.com/cgi-bin/message/vehicle?access_token=";

    // 通过jssdk code获取用户信息
    public final static String URL_GET_USER_INFO = "https://qyapi.weixin.qq.com/cgi-bin/user/getuserinfo";
    //endregion

    // 获取应用概况
    public final static String URL_GET_AGENT = "https://qyapi.weixin.qq.com/cgi-bin/agent/list?access_token=";

      //获取部门成员
    public final static String URL_GET_DEPARTMENTUSER="https://qyapi.weixin.qq.com/cgi-bin/user/simplelist?access_token=ACCESS_TOKEN&department_id=DEPARTMENT_ID&fetch_child=FETCH_CHILD&status=STATUS";
    public static void main(String[] args) {
        System.out.println(URLEncoder.encode("http://beta.tcl.com/wx/getQyAuthCode.action"));

    }
}
