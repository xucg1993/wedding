package com.xucg.wedding.common.util.weixin;


import com.xucg.wedding.common.pattern.PatternUtil;
import com.xucg.wedding.common.util.date.DateUtil;
import com.xucg.wedding.common.util.encode.EncodeUtil;
import com.xucg.wedding.common.util.request.RequestUtil;
import com.xucg.wedding.common.util.string.StringUtil;

import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;
import java.util.Map;

/**
 * 微信企业号工具类
 */
public class WeixinQYUtil {

    /**
     * 企业号redis常量，所有redis常量都要加这个前缀
     */
    public final static String REDIS_PREFIX = "wedding_";
    public final static String REDIS_CORPID_ACCESS_TOKEN = REDIS_PREFIX + "qiye_corpid_access_token";
    public final static String REDIS_QIYE_JS_TICKET = REDIS_PREFIX + "qiye_js_ticket";

    public final static String REDIS_ALL_USER_MAP_KEY = REDIS_PREFIX + "qiye_all_user_map";

    public final static int REDIS_WX_KEY_TTL = 3600;  // 单位秒


    public final static String CORPID_KEY = "corpid";
    public final static String CORPID_SECRET_KEY = "corpsecret";

    public final static String CORPID_VALUE = "qiye.corpid";
    public final static String CORPID_SECRET_VALUE = "qiye.corpid.secret";

    public final static String QIYE_CALLBACK_TOKEN = "qiye.callback.token";
    public final static String QIYE_CALLBACK_ENCODINGAESKEY = "qiye.callback.encodingaeskey";


    public final static String CORPID_KEFU_SECRET_VALUE = "wx.corpid.kefu.secret";

    public final static String CODE_KEY = "code";
    public final static String GRANT_TYPE = "grant_type";
    public final static String AUTH_CODE = "authorization_code";
    public final static String CLIENT_CREDENTIAL = "client_credential";
    public final static String ACCESS_TOKEN = "access_token";
    public final static String TYPE = "type";
    public final static String TICKET = "ticket";
    public final static String JS_API = "jsapi";
    public final static String KEFU_DEPARTMENT = "wx.kefu.department";
    public final static String QY_SPEEDEX_DRIVER_AGENTID = "qy.speedex.driver.agentid";
    public final static String QY_SPEEDEX_NEWS_IMAGE_URL = "qy.speedex.news.image.url";
    public final static String QY_SPEEDEX_VEHICLE_URL = "qy.speedex.vehicle.url";
    public final static String QY_SPEEDEX_DEFAULT_TITLE = "qy.speedex.default.title";
    public final static String QY_SPEEDEX_DEFAULT_DESCRIPTION = "qy.speedex.default.description";

    public final static String REDIS_FUWU_JSTICKET_KEY = "wx_fw_jsticket";

    public final static String REDIS_APPID_ACCESS_TOKEN = "wx_appid_access_token";

    public final static String USER_ID = "UserId";
    public final static String OPEN_ID = "OpenId";
    public final static String OPEN_id = "openid";
    public final static String NICK_NAME = "nickname";
    public final static String HEAD_IMG_URL = "headimgurl";
    public final static String FROM_USER_NAME = "FromUserName";
    public final static String TO_USER_NAME = "ToUserName";
    public final static String MSG_TYPE = "MsgType";
    public final static String EVENT = "Event";
    public final static String EVENT_TEXT = "text";
    public final static String EVENT_LOCATION = "location";
    public final static String EVENT_SUBSCRIBE = "subscribe";
    public final static String EVENT_UNSUBSCRIBE = "unsubscribe";
    public final static String EVENT_SCAN = "scan";
    public final static String EVENT_CLICK = "CLICK";
    public final static String EVENT_VIEW = "VIEW";
    public final static String EVENT_KEY = "EventKey";
    public final static String CREATE_TIME = "CreateTime";
    public final static String LATITUDE = "Latitude";
    public final static String LONGITUDE = "Longitude";
    public final static String CONTENT = "Content";
    public final static String MSGTYPE = "MsgType";
    public final static String MEDIAID = "MediaId";
    public final static String MSGID = "MsgId";
    public final static String PICURL = "PicUrl";
    //public final static String THUMBMEDIAID = "ThumbMediaId";

    public final static String ENTER_AGENT = "enter_agent";

    public final static String TRADE_TYPE_JSAPI = "JSAPI";
    public final static String RETURN_CODE = "return_code";
    public final static String RESULT_CODE = "result_code";
    public final static String PRE_PAY_ID = "prepay_id";
    public final static String SUCCESS = "SUCCESS";
    public final static String CASH_FEE = "cash_fee";
    public final static String OUT_TRADE_NO = "out_trade_no";
    public final static String TRANSACTION_ID = "transaction_id";
    public final static String TIME_END = "time_end";

    public final static String TEMPLATE_ORDER_CANCEL = "8VfF13Ceop4egT2AjBpl6ms8LVQr9Wzi3EuHpVQxEBM";
    public final static String TEMPLATE_ORDER_REJECT = "SdMpVWLmNlDl-zAZyhSZi7H0CMLE_Xb9VFIpGq4Lt8w";
    public final static String TEMPLATE_ORDER_DELIVERY = "Dj9b0f3J9Jvysl0xzD8CYkj2nf7vQGRcSRlYJZj4abU";
    public final static String TEMPLATE_ORDER_UNPAID = "PlF6l2YkAKIMUaWIXEjSpPewhWp5_0iPScxRH4xnRUg";
    public final static String TEMPLATE_ORDER_REMIND = "cnDp5NRz-Tei31w4iYSIJaqsbl6MKP3AE7xY1Fwi9B4";
    public final static String TEMPLATE_NEW_ORDER_ORGA = "wKmMKGSxmwMkliJTBXBZPIPiooWgRJNG7yqUYH53hrs";
    public final static String TEMPLATE_SEFT_PICKUP = "d2IbmlAyge7ZvnpRGQRotouTcSt0t5tGC-rfiIK5rYQ";
    public final static String TEMPLATE_TICKET_SEND = "P4Cybt6-K1mASUKZmRRsOUA_lYeMOLtVaOCIHvXnDmY";
    public final static String TEMPLATE_TICKET_EXPIRED = "TyUyovdaTSIdxmIDEbuggtq_C5JuEDTOhTJ7NQ5mb-4";
    public final static String TEMPLATE_NEW_ORGA = "4vreOjYJwMgIrVp746-hVCyKr6mMMLcAZkh4-0kP3hQ";
    public final static String URL_SEND_MESSAGE = "https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=";

    /**
     * 加密签名, 前台js接口用, SHA-1 加密
     */
    public static String getJsSignature(String ticket, String noncestr, long timestamp, String url) {
        StringBuilder sb = new StringBuilder();
        sb.append("jsapi_ticket=").append(ticket);
        sb.append("&noncestr=").append(noncestr);
        sb.append("&timestamp=").append(timestamp);
        sb.append("&url=").append(url);
        return EncodeUtil.getSHA1(sb.toString());
    }

    public static boolean isWeixinBrowser(HttpServletRequest request) {
        String userAgent = RequestUtil.getUserAgent(request);
        String regrex = "MicroMessenger/[0-9]";
        return PatternUtil.isFind(userAgent, regrex);
    }

    public static boolean isWeixinVersionOK(HttpServletRequest request) {
        String userAgent = RequestUtil.getUserAgent(request);
        String regrex = "MicroMessenger/[5-9]";
        return PatternUtil.isFind(userAgent, regrex);
    }

    public static String getPaySignature(Map<String, Object> paraMap) {
        return EncodeUtil.getMD5For32(getSignatureStr(paraMap));
    }

    // key=value1&key2=value2&key3=value3
    public static String getSignatureStr(Map<String, Object> paraMap) {
        StringBuilder sb = new StringBuilder();
        int count = 0;
        for (String key : paraMap.keySet()) {
            String value = String.valueOf(paraMap.get(key));
            if (!StringUtil.isNullorEmpty(value)) {
                sb.append((count++) == 0 ? "" : "&").append(key).append("=").append(paraMap.get(key));
            }
        }
        return sb.toString();
    }

    public static String text(String fromUserName, String toUserName, String content) {
        return send(fromUserName, toUserName, content, "text");
    }

    public static String send(String fromUserName, String toUserName, String content, String msgType) {
        StringBuilder sb = new StringBuilder();
        sb.append("<xml>");
        sb.append("<FromUserName><![CDATA[").append(fromUserName).append("]]></FromUserName>");
        sb.append("<ToUserName><![CDATA[").append(toUserName).append("]]></ToUserName>");
        sb.append("<CreateTime>").append(DateUtil.getCurrentTimeSecond()).append("</CreateTime>");
        sb.append("<MsgType><![CDATA[").append(msgType).append("]]></MsgType>");
        sb.append("<Content><![CDATA[").append(content).append("]]></Content>");
        sb.append("</xml>");
        return sb.toString();
    }

    public static String sendNews(String fromUserName, String toUserName, String content) {
        StringBuilder sb = new StringBuilder();
        sb.append("<xml>");
        sb.append("<FromUserName><![CDATA[").append(fromUserName).append("]]></FromUserName>");
        sb.append("<ToUserName><![CDATA[").append(toUserName).append("]]></ToUserName>");
        sb.append("<CreateTime>").append(DateUtil.getCurrentTimeSecond()).append("</CreateTime>");
        sb.append("<MsgType><![CDATA[").append("news").append("]]></MsgType>");

        sb.append("<ArticleCount>").append(content).append("</ArticleCount>");
        sb.append("<Articles>");

        sb.append("<item>");
        sb.append("<Title><![CDATA[").append(content).append("]]></Title>");
        sb.append("<Description><![CDATA[").append(content).append("]]></Description>");
        sb.append("<PicUrl><![CDATA[").append(content).append("]]></PicUrl>");
        sb.append("<Url><![CDATA[").append(content).append("]]></Url>");

        sb.append("</item>");
        sb.append("</Articles>");
        sb.append("</xml>");
        return sb.toString();
    }

    public static String duokefu(String fromUserName, String toUserName) {
        StringBuilder sb = new StringBuilder();
        sb.append("<xml>");
        sb.append("<FromUserName><![CDATA[").append(fromUserName).append("]]></FromUserName>");
        sb.append("<ToUserName><![CDATA[").append(toUserName).append("]]></ToUserName>");
        sb.append("<CreateTime>").append(DateUtil.getCurrentTimeSecond()).append("</CreateTime>");
        sb.append("<MsgType><![CDATA[transfer_customer_service]]></MsgType>");
        sb.append("</xml>");
        return sb.toString();
    }

    public static String duokefu(String fromUserName, String toUserName, String kfAccount) {
        StringBuilder sb = new StringBuilder();
        sb.append("<xml>");
        sb.append("<FromUserName><![CDATA[").append(fromUserName).append("]]></FromUserName>");
        sb.append("<ToUserName><![CDATA[").append(toUserName).append("]]></ToUserName>");
        sb.append("<CreateTime>").append(DateUtil.getCurrentTimeSecond()).append("</CreateTime>");
        sb.append("<MsgType><![CDATA[transfer_customer_service]]></MsgType>");
        if (StringUtil.isNullorEmpty(kfAccount)) {
            sb.append("<TransInfo>");
            sb.append("<KfAccount><![CDATA[").append(kfAccount).append("]]></KfAccount>");
            sb.append("</TransInfo>");
        }
        sb.append("</xml>");
        return sb.toString();
    }


    public static boolean isLocation(Map<String, String> map) {
        return EVENT_LOCATION.equalsIgnoreCase(map.get(EVENT));
    }

    public static boolean isSubscribe(Map<String, String> map) {
        return EVENT_SUBSCRIBE.equalsIgnoreCase(map.get(EVENT));
    }

    public static boolean isScan(Map<String, String> map) {
        return EVENT_SCAN.equalsIgnoreCase(map.get(EVENT));
    }

    public static boolean isUnSubscribe(Map<String, String> map) {
        return EVENT_UNSUBSCRIBE.equalsIgnoreCase(map.get(EVENT));
    }

    public static boolean isMsgType(Map<String, String> map) {
        return !StringUtil.isNullorEmpty(map.get(MSG_TYPE));
    }

    public static boolean isKefu(Map<String, String> map) {
        return EVENT_CLICK.equalsIgnoreCase(map.get(EVENT)) && "kefu".equals(map.get(EVENT_KEY));
    }

    public static boolean isKefuMess(Map<String, String> map) {
        return EVENT_TEXT.equalsIgnoreCase(map.get(MSG_TYPE)) && "客服".equals(map.get(CONTENT));
    }

    public static boolean isEnterAgent(Map<String, String> map) {
        return ENTER_AGENT.equalsIgnoreCase(map.get(EVENT));
    }

    public static String getContent(Map<String, String> map) {
        return map.get(CONTENT);
    }

    public static String getEventKey(Map<String, String> map) {
        return map.get(EVENT_KEY);
    }

    public static boolean isText(Map<String, String> map) {
        return EVENT_TEXT.equalsIgnoreCase(map.get(MSG_TYPE));
    }

    public static String getFromUserName(Map<String, String> map) {
        return map.get(FROM_USER_NAME);
    }

    public static String getToUserName(Map<String, String> map) {
        return map.get(TO_USER_NAME);
    }

    /**
     * 根据内容类型判断文件扩展名
     *
     * @param contentType 内容类型
     * @return
     */
    public static String getFileEndWitsh(String contentType) {
        String fileEndWitsh = "";
        if ("image/jpeg".equals(contentType))
            fileEndWitsh = ".jpg";
        else if ("audio/mpeg".equals(contentType))
            fileEndWitsh = ".mp3";
        else if ("audio/amr".equals(contentType))
            fileEndWitsh = ".amr";
        else if ("video/mp4".equals(contentType))
            fileEndWitsh = ".mp4";
        else if ("video/mpeg4".equals(contentType))
            fileEndWitsh = ".mp4";
        return fileEndWitsh;
    }

    public static void main(String[] args) {
        System.out.println(URLEncoder.encode("http://beta.tcl.com/wx/getQyAuthCode.action"));

    }
}
