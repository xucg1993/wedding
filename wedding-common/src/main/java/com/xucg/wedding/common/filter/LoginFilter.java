package com.xucg.wedding.common.filter;


import com.xucg.wedding.common.util.constant.Constant;
import com.xucg.wedding.common.util.cookie.CookieUtil;
import com.xucg.wedding.common.util.encode.EncodeUtil;
import com.xucg.wedding.common.util.number.NumberUtil;
import com.xucg.wedding.common.util.request.RequestUtil;
import com.xucg.wedding.common.util.string.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;


public class LoginFilter implements Filter {
    @Autowired
    protected Properties systemConfig;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain filterChain) throws IOException, ServletException {

        HttpServletResponse res = (HttpServletResponse) response;
        HttpServletRequest req = (HttpServletRequest) request;

        if (isLogin(req)) {
            res.addHeader("Access-Control-Allow-Origin", "*");
            res.addHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, PUT, DELETE, HEAD");
            res.addHeader("Access-Control-Allow-Headers", "X-PINGOTHER, Origin, X-Requested-With, Content-Type, Accept");
//            res.addHeader("Access-Control-Max-Age", "1728000");

            filterChain.doFilter(request, res);
        } else {
            String domain = RequestUtil.getDomain(req);
            CookieUtil.removeCookie(res, Constant.COOKIE_ADMIN_USERID, domain);
            CookieUtil.removeCookie(res, Constant.COOKIE_ADMIN_TIME_KEY, domain);
            CookieUtil.removeCookie(res, Constant.COOKIE_ADMIN_RANDOM_KEY, domain);
            CookieUtil.removeCookie(res, Constant.COOKIE_ADMIN_TOKEN, domain);

            outWriteUTF8((HttpServletResponse) response, "{\n" +
                    "\"statusCode\":\"301\",\n" +
                    "\"message\":\"\\u4f1a\\u8bdd\\u8d85\\u65f6\\uff0c\\u8bf7\\u91cd\\u65b0\\u767b\\u5f55\\u3002\",\n" +
                    "\"navTabId\":\"\",\n" +
                    "\"callbackType\":\"\",\n" +
                    "\"forwardUrl\":\"\"\n" +
                    "}");

        }
    }

    public void outWriteUTF8(HttpServletResponse response, String mess) {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(mess);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            out.close();
        }
    }

    private boolean isLogin(HttpServletRequest request) {
        if (request.getRequestURI().contains("userLogin.action") || request.getRequestURI().contains("userLoginOut.action")) return true;

        String userId = CookieUtil.getCookieValue(request, Constant.COOKIE_ADMIN_USERID);
        String timeKey = CookieUtil.getCookieValue(request, Constant.COOKIE_ADMIN_TIME_KEY);
        String randomKey = CookieUtil.getCookieValue(request, Constant.COOKIE_ADMIN_RANDOM_KEY);
        String fromToken = CookieUtil.getCookieValue(request, Constant.COOKIE_ADMIN_TOKEN);

        if (StringUtil.isNullorEmpty(userId) || StringUtil.isNullorEmpty(timeKey) || StringUtil.isNullorEmpty(randomKey) || StringUtil.isNullorEmpty(fromToken)) return false;

        // id + timeKey + randomKey
        String token = userId + timeKey.substring(0, 10) + randomKey.substring(0, 5);

        return NumberUtil.isNumber(userId) && EncodeUtil.getMD5For32(token).equals(fromToken);

    }

    private boolean authTokenSuccess(String userId, String token) {
        return getUserToken(userId).equals(token);
    }

    private String getUserToken(String userId) {
        return EncodeUtil.getMD5For32(userId + Constant.TOKEN_SIGN);
    }

    @Override
    public void destroy() {
    }


}
