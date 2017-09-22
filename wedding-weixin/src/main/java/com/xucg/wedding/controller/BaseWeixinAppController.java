package com.xucg.wedding.controller;

import com.xucg.wedding.common.controller.BaseController;
import com.xucg.wedding.common.util.date.DateUtil;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

/**
 * @author emp
 * @since 2017/07/10
 */
public class BaseWeixinAppController extends BaseController {

    //    protected static final String STATUS_ERROR     = "0";    //结果状态，失败
//    protected static final String STATUS_SUCCESS   = "1";    //结果状态，成功
//
//    //region Autowired
//    @Autowired
//    protected SkuService skuService;
//    @Autowired
//    protected OrganizeService organizeService;
//    @Autowired
//    protected UserService userService;
//    @Autowired
//    protected UserDetailService userDetailService;

    @Autowired
    protected Properties systemConfig;


    public String getProperty(String key) {
        return systemConfig.getProperty(key);
    }

//    //endregion
//
//    public ModelAndView errorModel() {
//        return new ModelAndView("redirect:" + formatUrlForM(""));
//    }
//
//    public ModelAndView redirectModel(String url) {
//        return new ModelAndView("redirect:" + url);
//    }
//

//
//    public String getConfigProperty(String key, String defaultValue) {
//        return systemConfig.getProperty(key, defaultValue);
//    }
//
//    //region 附加域名的Url
//    protected String formatUrlForM() {
//        return formatUrlForM("");
//    }
//    protected String formatUrlForM(String url) {
//        return String.format("http://%s/%s", systemConfig.getProperty("url.m"), url);
//    }
//
//    protected String formatUrlForPay(String url) {
//        return String.format("http://%s/%s", systemConfig.getProperty("url.pay"), url);
//    }
//    protected String formatUrlForOrder(String url) {
//        return String.format("http://%s/%s", systemConfig.getProperty("url.order"), url);
//    }
//    protected String formatUrlForProm(String url) {
//        return String.format("http://%s/%s", systemConfig.getProperty("url.prom"), url);
//    }
//
//
//    public boolean isWeixinBrowser(HttpServletRequest request) {
//        return WeixinUtil.isWeixinBrowser(request);
//    }
//
//    protected boolean isUserIdAndTokenOK(int userId, String token) {
//        return isUserIdAndTokenOK(String.valueOf(userId), token);
//    }
//    protected boolean isUserIdAndTokenOK(String userId, String token) {
//        return StringUtil.isLength(userId, 8) && authTokenSuccess(userId, token);
//    }
//
//    protected boolean authTokenSuccess(int userId, String token) {
//        return authTokenSuccess(String.valueOf(userId), token);
//    }
//    protected boolean authTokenSuccess(String userId, String token) {
//        return getUserToken(userId).equals(token);
//    }
//
//    protected String getUserToken(int userId) {
//        return getUserToken(String.valueOf(userId));
//    }
//    protected String getUserToken(String userId) {
//        String sign = getConfigProperty("user.sign", "bxian.com");
//        String serverToken = EncodeUtil.getMD5For32(userId + sign);
//        return serverToken;
//    }
//
//    //endregion
//
//    //region 从Cookie中获取商户简要信息
//
//    /**
//     * 从Cookie中获取商户ID
//     * @param request
//     * @return 没有取到则返回-1
//     */
//    protected int getOrgaIdFromCookie(HttpServletRequest request) {
//
//        return getOrgaFromCookie(request).getOrgaid();
//    }
//
//    /**
//     * 从Cookie中获取商户管理员ID
//     * @param request
//     * @return 没有取到则返回0
//     */
//    protected int getOrgaAdminIdFromCookie(HttpServletRequest request) {
//
//        return getOrgaFromCookie(request).getAdminid();
//    }
//
//    protected OtooOrganizeSimple getOrgaFromCookie(HttpServletRequest request) {
//
//        OtooOrganizeSimple orga = new OtooOrganizeSimple();
//        orga.setOrgaid(-1); //没有则返回-1
//
//        String cookieOrga = CookieUtil.getCookieValue(request, Constant.COOKIE_ORGA);
//        if(StringUtil.isNullorEmpty(cookieOrga))
//            return orga;
//
//        String[] orgaParams = cookieOrga.split(Constant.DEFAULT_SPLITER, 3);
//        String orgaId = orgaParams[0];
//        String adminId = orgaParams[1];
//        String orgaAdminToken = orgaParams[2];
//
//        if (!isOrgaAdminIdAndTokenOK(adminId, orgaAdminToken))
//            return orga;
//
//        orga.setAdminid(Integer.parseInt(adminId));
//        orga.setOrgaid(Integer.parseInt(orgaId));
//        orga.setToken(orgaAdminToken);
//
//        return orga;
//    }
//
//    protected boolean isOrgaAdminIdAndTokenOK(String adminId, String token) {
//        return StringUtil.isLength(adminId, 8) && this.authOrgaAdminTokenSuccess(adminId, token);
//    }
//
//    protected boolean authOrgaAdminTokenSuccess(String adminId, String token) {
//        return getOrgaAdminToken(adminId).equals(token);
//    }
//
//    protected String getOrgaAdminToken(String adminId){
//        String sign = getConfigProperty("orga.sign", "orga.bxian.com");
//        String serverToken = EncodeUtil.getMD5For32(adminId + sign);
//        return serverToken;
//    }
//
//    //endregion
//
//    //region 从Cookie中获取到店用户ID
//
//    /**
//     * 从Cookie中获取到店用户ID
//     * @param request
//     * @return
//     */
//    protected int getUseridFromCookieForRrrive(HttpServletRequest request) {
//
//        int userId = 0;
//        String userIdStr = CookieUtil.getCookieValue(request, Constant.COOKIE_USERID_ARRIVE);
//        if(!StringUtil.isNullorEmpty(userIdStr))
//            userId = Integer.parseInt(userIdStr);
//
//        return userId;
//    }
//    //endregion
//
//
//    /******************** 读取和反写位置定位 ********************/
//
//    //region 从Cookie中读取定位信息
//    protected Location loadLocationFromCookie(HttpServletRequest request) {
//
//        Location location = new Location();
//        String locationCookie = CookieUtil.getCookieValue(request, Constant.COOKIE_LOCATION);
//
//        if(!StringUtil.isNullorEmpty(locationCookie)) {
//
//            String[] loParams = locationCookie.split(Constant.DEFAULT_SPLITER, 7);
//
//            location = new Location();
//            location.setAuto(Integer.parseInt(loParams[0]));
//            location.setLat(loParams[1]);
//            location.setLng(loParams[2]);
//            location.setOrgaIds(loParams[3]);
//            location.setStreet(loParams[4]);
//            location.setAddressId(Integer.parseInt(loParams[5]));
//        }
//
//        return location;
//    }
//    //endregion
//
//    //region 从Cookie中获取机构ID
//    protected List<Integer> loadOrgaIdsFromCookie(HttpServletRequest request) {
//
//        Location location = loadLocationFromCookie(request);
//
//        if(location != null)
//            return location.getOrgaIdList();
//        else
//            return new ArrayList<Integer>();
//    }
//    //endregion
//
//    //region 保存定位信息到Cookie
//    public void saveLocationToCookie(HttpServletRequest request, HttpServletResponse response, Location lo) {
//
//        boolean enabledDistance = systemConfig.getProperty("orga.distance.enabled").equals("true");
//
//        //筛选可送达的周边机构(根据步行距离)
//        if(enabledDistance)
//            filterOrgaIds(lo, lo.getOrgaIds());
//
//        StringBuilder sb = new StringBuilder();
//
////        location.setOrgaId(location.getOrgaId() == 0 ? Constant.HQ_ORGAID : location.getOrgaId());
////        int autoFlag = type.equals("weixin") || type.equals("auto") ? 2 : 1;
//        sb.append(lo.getAuto()).append(Constant.DEFAULT_SPLITER);
//        sb.append(lo.getLat()).append(Constant.DEFAULT_SPLITER);
//        sb.append(lo.getLng()).append(Constant.DEFAULT_SPLITER);
//        sb.append(lo.getOrgaIds()).append(Constant.DEFAULT_SPLITER);
//        sb.append(lo.getStreet()).append(Constant.DEFAULT_SPLITER);
//        sb.append(lo.getAddressId());
//
//        CookieUtil.addCookie(response, Constant.COOKIE_LOCATION, sb.toString());
//
//        //保存到历史记录
////        if(!type.equals(Location.TYPE_ADDR) && !type.equals(Location.TYPE_HISTORY))
////            saveLocationLogToCookie(request, response, sb.toString());
//
//        //改写临时订单Cookie
//        String orderStr = CookieUtil.getCookieValue(request, Constant.COOKIE_ORDER);
//        sb = new StringBuilder("");
//        if(!StringUtil.isNullorEmpty(orderStr)) {
//
//            String[] orderParams = orderStr.split(Constant.DEFAULT_SPLITER, 26);
//            orderParams[9] = String.valueOf(lo.getLat());
//            orderParams[10] = String.valueOf(lo.getLng());
//            orderParams[11] = String.valueOf(lo.getOrgaIds());
//            orderParams[12] = String.valueOf(lo.getStreet());
//            orderParams[13] = String.valueOf(lo.getAddressId());  //冲掉
//
//            for(int i=0; i<orderParams.length; i++) {
//                sb.append(orderParams[i] + (i < orderParams.length - 1 ? Constant.DEFAULT_SPLITER : ""));
//            }
//        } else {
//            sb.append(getUseridFromCookie(request)).append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//
//            sb.append(lo.getLat()).append(Constant.DEFAULT_SPLITER);
//            sb.append(lo.getLng()).append(Constant.DEFAULT_SPLITER);
//            sb.append(lo.getOrgaIds()).append(Constant.DEFAULT_SPLITER);
//            sb.append(lo.getStreet()).append(Constant.DEFAULT_SPLITER);
//            sb.append(lo.getAddressId()).append(Constant.DEFAULT_SPLITER);
//
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0").append(Constant.DEFAULT_SPLITER);
//            sb.append("0");
//        }
//        CookieUtil.addCookie(response, Constant.COOKIE_ORDER, sb.toString());
//
//        //清除用户不可达提交标识
//        boolean clearNewAddr = true;
//        Location tmpLo = loadLocationFromCookie(request);
//        if(tmpLo != null && lo != null && tmpLo.getLatlng() != null && lo.getLatlng() != null) {
//            if(tmpLo.getLatlng().equals(lo.getLatlng()))
//                clearNewAddr = false;
//            else if (mapService.getTwoPointsDistance(lo.getLatlng(), tmpLo.getLatlng()) <= BaiduUtil.SAMEADDR_RANG)
//                clearNewAddr = false;
//        }
//        if(clearNewAddr)
//            CookieUtil.removeCookie(response, Constant.COOKIE_USER_NEWADDR);
//    }
//    //endregion
//
//
//    //region 筛选可送达的周边机构(根据步行距离)
//    protected void filterOrgaIds(Location lo, String orgaIds) {
//
//        if(StringUtil.isNullorEmpty(orgaIds))
//            return;
//
//        StringBuilder sbTemp = new StringBuilder();
//        String[] ids = orgaIds.split(Constant.SKU_NUMBER_SPLITER);
//        for (String orgaId: ids) {
//            if(StringUtil.isNullorEmpty(orgaId))
//                continue;
//            sbTemp.append(orgaId).append(Constant.DEFAULT_SPLITER);
//        }
//        sbTemp.deleteCharAt(sbTemp.length() -1);
//
//        StringBuilder sbValid = new StringBuilder();
//        List<OtooOrganize> organizes = organizeService.findOrganizeListForSimple(sbTemp.toString());
//        for(OtooOrganize organize: organizes) {
//
//            int walkDistance = mapService.getWalkDistance(lo.getLatlng(), invertLnglat(organize.getLatlng()));
//            if(walkDistance <= organize.getRadius())
//                sbValid.append(organize.getOrgaid()).append(Constant.SKU_NUMBER_SPLITER);
//        }
//        if(sbValid.length() > 0)
//            sbValid.deleteCharAt(sbValid.length() -1);
//
//        lo.setOrgaIds(sbValid.toString());
//    }
//    //endregion
//
//    //region 改写定位信息坐标
//    protected void changeLocationLatlng(Location lo, String latlng) {
//
//        if(lo == null)
//            lo = new Location();
//
//        if(StringUtil.isNullorEmpty(latlng)) {
//            lo.setLat("");
//            lo.setLng("");
//        } else {
//            String[] lat_lng = latlng.split(Constant.DEFAULT_SPLITER);
//            lo.setLat(lat_lng[0]);
//            lo.setLng(lat_lng[1]);
//        }
//    }
//    //endregion
//
//    //region 反转坐标经纬度（结果：纬度在前，经度在后，如39.797027,116.524876）
//    protected String invertLnglat(String lnglat){
//        if(StringUtil.isNullorEmpty(lnglat)) return "";
//        String[] lng_lat = lnglat.split(",");
//        if(Float.parseFloat(lng_lat[0]) < 55 ) return lnglat;       //纬度已经在前，不需要反转
//        String lng = lng_lat[0];
//        String lat = lng_lat[1];
//        return lat + "," + lng;
//    }
//    //endregion

    /**
     * 上传
     *
     * @param filePath 存放目录
     * @param files    文件
     * @return 返回文件名
     * @throws ServletException
     * @throws IOException
     */
    public String uploadFile(String filePath, MultipartFile files) throws ServletException, IOException {
        String savePath = "";
        savePath = savePath + filePath;
        File f1 = new File(savePath);
        if (!f1.exists()) {
            f1.mkdirs();
        }
        String dateDir = DateUtil.formatDateToStringPreDefault();
        savePath = savePath + "/" + dateDir;
        File df = new File(savePath);
        if (!df.exists()) {
            df.mkdirs();
        }
        DiskFileItemFactory fac = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(fac);
        upload.setHeaderEncoding("utf-8");

        String name = "";
        String extName = "";
        name = files.getOriginalFilename();
        if (files != null) {
            // 扩展名格式：
            if (name.lastIndexOf(".") >= 0) {
                extName = name.substring(name.lastIndexOf("."));
            }
            File file = null;
            if (null != name && !"".equals(name)) {
                name = new java.text.SimpleDateFormat("yyyyMMddhhmmss").format(new Date());    //获取当前日期
                name = name + (int) (Math.random() * 90000 + 10000);
                file = new File(savePath + "/" + name + extName);
                files.transferTo(file);
                String s = (name.trim() + extName.trim()).trim();
                return s;
            }
        }
        return name;
    }

    /**
     * 截取路径
     */
    public String getUploadFilePath(String prefix, String fileName) {
        return prefix + fileName.substring(0, 8) + "/" + fileName;
    }
}
