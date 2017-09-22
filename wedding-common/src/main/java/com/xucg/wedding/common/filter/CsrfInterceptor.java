package com.xucg.wedding.common.filter;

import com.xucg.wedding.common.util.constant.Constant;
import com.xucg.wedding.common.util.cookie.CookieUtil;
import com.xucg.wedding.common.util.request.RequestUtil;
import com.xucg.wedding.common.util.string.StringUtil;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CsrfInterceptor implements HandlerInterceptor {

    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        if (request.getRequestURI().contains("userLogin.action") || request.getRequestURI().contains("userLoginOut.action")) return true;
        if (request.getRequestURI().contains("find") || request.getRequestURI().contains("for")) return true;

        String paramToken = request.getParameter(Constant.PARAMETER_CSRF_TOKEN);
        String cookieToken = "";
        boolean result = false;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                String name = cookies[i].getName();
                if (Constant.COOKIE_CSRF_TOKEN.equals(name)) {
                    cookieToken = cookies[i].getValue();
                }
            }
        }

        String sessionToken = (String) request.getSession().getAttribute(Constant.SESSION_CSRF_TOKEN);

        if (!StringUtil.isNullorEmpty(paramToken) && paramToken.length() > 0 && paramToken.equals(cookieToken) && paramToken.equals(sessionToken)) {
            result = true;
        } else {
            String domain = RequestUtil.getDomain(request);
            CookieUtil.removeCookie(response, Constant.COOKIE_ADMIN_USERID, domain);
            CookieUtil.removeCookie(response, Constant.COOKIE_ADMIN_TIME_KEY, domain);
            CookieUtil.removeCookie(response, Constant.COOKIE_ADMIN_RANDOM_KEY, domain);
            CookieUtil.removeCookie(response, Constant.COOKIE_ADMIN_TOKEN, domain);

            outWriteUTF8((HttpServletResponse) response, "{\n" +
                    "\"statusCode\":\"301\",\n" +
                    "\"message\":\"\\u4f1a\\u8bdd\\u8d85\\u65f6\\uff0c\\u8bf7\\u91cd\\u65b0\\u767b\\u5f55\\u3002\",\n" +
                    "\"navTabId\":\"\",\n" +
                    "\"callbackType\":\"\",\n" +
                    "\"forwardUrl\":\"\"\n" +
                    "}");


//            request.getRequestDispatcher("/error").forward(request, response);
        }

        return result;
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

    public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1,
                                Object arg2, Exception arg3) throws Exception {

    }

    public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
                           Object arg2, ModelAndView arg3) throws Exception {

    }
}