package com.xucg.wedding.common.util.baidu;


import com.xucg.wedding.common.util.constant.Constant;
import com.xucg.wedding.common.util.string.StringUtil;

public class BaiduUtil {
    public final static String URL_BAIDU_CREATE_POI = "http://api.map.baidu.com/geodata/v3/poi/create";
    public final static String URL_BAIDU_UPDATE_POI = "http://api.map.baidu.com/geodata/v3/poi/update";
    public final static String URL_BAIDU_DELETE_POI = "http://api.map.baidu.com/geodata/v3/poi/delete";
    public final static String URL_BAIDU_LIST_POI = "http://api.map.baidu.com/geodata/v3/poi/list";
    public final static String URL_BAIDU_URLDETAIL_POI = "http://api.map.baidu.com/geodata/v3/poi/detail";
    public final static String URL_BAIDU_NEARBY_POI = "http://api.map.baidu.com/geosearch/v3/nearby";
    public final static String URL_BAIDU_GEO_CODER = "http://api.map.baidu.com/geocoder/v2/";
    public final static String URL_BAIDU_GEO_CONVERT = "http://api.map.baidu.com/geoconv/v1/?";
    public final static String URL_BAIDU_POINTS_DISTANCE = "http://api.map.baidu.com/telematics/v3/distance";
    public final static String URL_BAIDU_DIRECTION_DISTANCE = "http://api.map.baidu.com/direction/v1";
    public final static String URL_BAIDU_SUGGESTION = "http://api.map.baidu.com/place/v2/suggestion";

    public final static String BAIDU_MAP_AK = "baidu.map.ak"; // 百度地图AK

    public final static String COORD_TYPE = "3";

    public final static String RADIUS_MAP = "3000";     // 单位米
    public final static int CONFIDENCE = 10;            // 可信度
    public final static int SAMEADDR_RANG = 100;        // 视为同一地点的最大距离（判断用户是否处于同一地点）


    //region 校验经纬度格式，确保纬度在前，经度在后
    public static String rightLatlng(String latlng) {
        if (StringUtil.isNullorEmpty(latlng)) return latlng;

        String latlngResult = "";
        String[] lat_lng = latlng.split(Constant.DEFAULT_SPLITER);
        if (Double.valueOf(lat_lng[0]) > 54)
            latlngResult = lat_lng[1] + Constant.DEFAULT_SPLITER + lat_lng[0];

        return latlngResult;
    }


    //region 计算两坐标之间的直线距离
    public static double getDistance(double lat1, double lng1, double lat2, double lng2) {
        double EARTH_RADIUS = 6378137;

        double radLat1 = rad(lat1);
        double radLat2 = rad(lat2);
        double a = radLat1 - radLat2;
        double b = rad(lng1) - rad(lng2);
        double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) + Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
        s = s * EARTH_RADIUS;
        s = Math.round(s * 10000) / 10000;
        return s;
    }

    private static double rad(double d) {
        return d * Math.PI / 180.0;
    }
    //endregion


    public static void main(String[] args) {

        double distance = getDistance(116.559137, 39.832455, 116.559101, 39.829103);

        System.out.println("Distance is：" + distance);
    }
}
