package com.xucg.wedding.common.util.constant;

public class Constant {
    public final static String COMPANY_LOGO_PATH = "company.logo.path";
    public final static String DEFAULT_SPLITER = ",";
    public final static String SKU_NUMBER_SPLITER = "_";
    public final static String HTML_LF = "<br/>";

    public final static int MONEY_YUAN_FEN_RATE = 100;     //元与分的比率
    public final static int DISCOUNT_CONVER = 10;          //折扣换算率

    public final static String POST = "POST";
    public final static String GET = "GET";

    public final static String LOCATION_PREFIX = "location_";
    public final static int LOCATION_TTL = 30 * 60;
    public final static int QRCODE_VALIDITY_TIME = 2 * 24 * 60 * 60;

    public final static String REDIS_ERROR_TIMES_PREFIX = "login_error_";
    public final static int TTL_ERROR_TIMES = 5 * 60;
    public final static int LIMIT_ERROR_TIMES = 5;


    public final static String GBK_ENCODING = "GBK";
    public final static String UTF8_ENCODING = "UTF-8";

    public final static String SUCCESS = "1";
    public final static String ERROR = "0";

    public static final String DEFAULT_IMG_SUBFIX = ".jpg";

    public final static int TICKET_BATCH_NO_LENGTH = 2;
    public final static int TICKET_ID_SUBFIX_LENGTH = 8;
    public final static int CODE_SINGLE_LENGTH = 6;
    public final static int CODE_MULTIPLE_LENGTH = 4;

    public final static String MD5 = "MD5";
    public final static String SHA1 = "SHA-1";

    public final static String JSON = "json";
    public final static String XML = "xml";

    public final static String COOKIE_WEIXIN_USER = "cookie_wedding_user";
    public final static String COOKIE_WEIXIN_TOKEN = "cookie_wedding_user_token";


    public final static String COOKIE_ADMIN_USERID = "abcde3232";                     //后台用户id
    public final static String COOKIE_ADMIN_TIME_KEY = "fsdewfsds";                     //后台用户id
    public final static String COOKIE_ADMIN_RANDOM_KEY = "32fdsfew";                     //后台用户id
//    public final static String COOKIE_ADMIN_USERNAME = "adminusername";                 //后台用户name
    public final static String COOKIE_ADMIN_TOKEN = "fdsdikefj";                       //后台用户token

    public final static String COOKIE_CSRF_TOKEN = "fswefsda";                       //后台用户token
    public final static String TOKEN_SIGN = "f32abs3.32@$fdsfw";                        //后台用户token的签名
    public final static int COOKIE_ADMIN_TTL = 1 * 60 * 60;                             //后台用户失效时间

    public final static String SESSION_ADMIN_id = "adminuserid";
    public final static String SESSION_ADMIN_REAL_NAME = "adminuserrealname";                 //后台用户name

    public final static String SESSION_CSRF_TOKEN = "sessioncsrftoken";                 //后台用户name

    public final static String PARAMETER_CSRF_TOKEN = "csrftoken";                 //后台用户name


    public final static String SPEEDEX_SYSTEM = "speedexsystem";

    public final static String DRIVER_DEPARTMENT = "wx.driver.department";
    public final static String PAICHE_DEPARTMENT = "wx.paiche.department";
    public final static String TSMANAGER_DEPARTMENT = "wx.tsmanager.department";

    public final static String DEPT_ID = "qy.kuyu.wedding.department";//父部门ID
}
