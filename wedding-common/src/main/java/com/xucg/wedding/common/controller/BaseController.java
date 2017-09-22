package com.xucg.wedding.common.controller;

import com.xucg.wedding.common.util.constant.Constant;
import com.xucg.wedding.common.util.cookie.CookieUtil;
import com.xucg.wedding.common.util.date.DateUtil;
import com.xucg.wedding.common.util.encode.EncodeUtil;
import com.xucg.wedding.common.util.request.RequestUtil;
import com.xucg.wedding.common.util.string.StringUtil;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class BaseController extends HttpServlet {
    public final static String STATUS_ERROR = "0";
    public final static String STATUS_SUCCESS = "1";

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

    public void outWriteGBK(HttpServletResponse response, String mess) {
        response.setContentType("text/html;charset=gbk");
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

    public void setAdminUserToCookie(HttpServletResponse response, int userId, String domain) {
        CookieUtil.addCookie(response, Constant.COOKIE_ADMIN_USERID, String.valueOf(userId), domain, Constant.COOKIE_ADMIN_TTL);

        String timeKey = EncodeUtil.getMD5For32(DateUtil.getCurrentTime() + "");
        String randomKey = EncodeUtil.getMD5For32(StringUtil.getRandomSixNumbers() + "");

        // id + timeKey + randomKey
        String token = userId + timeKey.substring(0, 10) + randomKey.substring(0, 5);

        CookieUtil.addCookie(response, Constant.COOKIE_ADMIN_TIME_KEY, timeKey, domain, Constant.COOKIE_ADMIN_TTL);

        CookieUtil.addCookie(response, Constant.COOKIE_ADMIN_RANDOM_KEY, randomKey, domain, Constant.COOKIE_ADMIN_TTL);

        CookieUtil.addCookie(response, Constant.COOKIE_ADMIN_TOKEN, EncodeUtil.getMD5For32(token), domain, Constant.COOKIE_ADMIN_TTL);


    }

    public void setCsrfToken(HttpServletRequest request, HttpServletResponse response) {
        // 添加csrftoken
        String randomKey = EncodeUtil.getMD5For32(StringUtil.getRandomsNumber(10));

        CookieUtil.addCookie(response, Constant.COOKIE_CSRF_TOKEN, randomKey, RequestUtil.getDomain(request), Constant.COOKIE_ADMIN_TTL);

        request.getSession().setAttribute(Constant.SESSION_CSRF_TOKEN, randomKey);
    }


    public void clearCookieAdminUser(HttpServletResponse response, String domain) {
        CookieUtil.removeCookie(response, Constant.COOKIE_ADMIN_USERID, domain);
        CookieUtil.removeCookie(response, Constant.COOKIE_ADMIN_TIME_KEY, domain);
        CookieUtil.removeCookie(response, Constant.COOKIE_ADMIN_RANDOM_KEY, domain);
        CookieUtil.removeCookie(response, Constant.COOKIE_ADMIN_TOKEN, domain);
    }

    public int getAdminUserid(HttpServletRequest request) {
        String id = CookieUtil.getCookieValue(request, Constant.COOKIE_ADMIN_USERID);
        return StringUtil.isNullorEmpty(id) ? 0 : Integer.parseInt(id);
    }

    public String getAdminUserName(HttpServletRequest request) {
        return (String) request.getSession().getAttribute(Constant.SESSION_ADMIN_REAL_NAME);
    }

    public void setAdminUserToSession(HttpServletRequest request, int userId, String userName) {
        request.getSession().setAttribute(Constant.SESSION_ADMIN_id, userId);
        request.getSession().setAttribute(Constant.SESSION_ADMIN_REAL_NAME, userName);
    }

    public void clearSessionAdminUser(HttpServletRequest request) {
        request.getSession().removeAttribute(Constant.SESSION_ADMIN_id);
        request.getSession().removeAttribute(Constant.SESSION_ADMIN_REAL_NAME);
        request.getSession().removeAttribute(Constant.SESSION_CSRF_TOKEN);
    }


    public String errorStatus() {
        return buildStatus(STATUS_ERROR);
    }

    public String errorStatus(String status) {
        return buildStatus(status);
    }

    public String successStatus() {
        return buildStatus(STATUS_SUCCESS);
    }

    public String buildStatus(String status) {
        return "{\"status\":\"" + status + "\"}";
    }

    public String buildStatus(String status, String message) {
        return "{\"status\":\"" + status + "\",\"message\":\"" + message + "\"}";
    }

    public String successCount(int count) {
        return buildCount(count);
    }

    public String errorCount() {
        return buildCount(-1);
    }

    public String buildCount(int count) {
        return "{\"count\":\"" + count + "\"}";
    }

}
