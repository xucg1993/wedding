package com.xucg.wedding.common.util.speedex;

public class SpeedexUtil {
    public final static String REDIS_PREFIX = "speedex_";
    public final static String REDIS_WEICHAT_MOBILE_KEY = REDIS_PREFIX + "weichat_";

    public final static int TTL_WEICHAT_MOBILE =  4 * 3600;     // 4个小时

    public final static String SUCCESS = "1";
    public final static String FAIL = "0";
    public final static int HAVE_PHOTO = 1;
    public final static int NO_PHOTO = 0;

}
