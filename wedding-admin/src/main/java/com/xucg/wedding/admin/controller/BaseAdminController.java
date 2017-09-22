package com.xucg.wedding.admin.controller;


import com.xucg.wedding.common.controller.BaseController;
import com.xucg.wedding.common.util.date.DateUtil;
import com.xucg.wedding.common.util.string.StringUtil;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Properties;

public class BaseAdminController extends BaseController {
    @Autowired
    protected Properties systemConfig;


//    public String getUserToken(String userId) {
//        return EncodeUtil.getMD5For32(userId + Constant.TOKEN_SIGN);
//    }
//
//    public String getUserToken(int userId) {
//        return getUserToken(String.valueOf(userId));
//    }

    public String getConfigProperty(String key, String defaultValue) {
        return systemConfig.getProperty(key, defaultValue);
    }


    public ModelAndView ajaxDoneSuccess(String message) {
        return ajaxDone(200, message, "", "", "");
    }

    public ModelAndView ajaxDoneSuccess(String message, String navTabId) {
        return ajaxDone(200, message, navTabId, "", "");
    }

    public ModelAndView ajaxDoneSuccessAndUrl(String message, String url) {
        return ajaxDone(200, message, "", url, "forward");
    }

    public ModelAndView ajaxDoneSuccessAndUrl(String message, String navTabId, String url) {
        return ajaxDone(200, message, navTabId, url, "forward");
    }

    public ModelAndView ajaxDoneSuccessClose(String message) {
        return ajaxDone(200, message, "", "", "closeCurrent");
    }

    public ModelAndView ajaxDoneSuccessCloseAndNavTabId(String message, String navTabId) {
        return ajaxDone(200, message, navTabId, "", "closeCurrent");
    }

    public ModelAndView ajaxDoneSuccessAndNavTabId(String message, String navTabId) {
        return ajaxDone(200, message, navTabId, "", "");
    }

    public ModelAndView ajaxDoneSuccessCloseAndUrl(String message, String url) {
        return ajaxDone(200, message, "", url, "closeCurrent");
    }

    public ModelAndView ajaxDoneError(String message) {
        return ajaxDone(300, message, "", "", "");
    }

    public ModelAndView ajaxDone(int statusCode, String message, String navTabId, String forwardUrl, String callbackType) {
        ModelAndView model = new ModelAndView("ajaxDone");
        model.addObject("statusCode", statusCode);
        model.addObject("message", message);
        model.addObject("navTabId", navTabId);
        model.addObject("forwardUrl", forwardUrl);
        model.addObject("callbackType", callbackType);
        return model;
    }


    protected ModelAndView ajaxDoneAuto(String message) {
        if (StringUtil.isContains(message, "success"))
            return ajaxDoneSuccess(systemConfig.getProperty(message));
        else
            return ajaxDoneError(systemConfig.getProperty(message));
    }

    protected String getImagePrefixPath() {
        return getProperty("portal.image.path");
    }

    protected String getImagePrefixUrl() {
        return getProperty("portal.image.url");
    }

    public String getProperty(String key) {
        return systemConfig.getProperty(key);
    }

    public boolean checkImageName(String imageName) {
        if (imageName.length() < 5) return false;
        String suffix = imageName.substring(imageName.length() - 3);
        if (suffix.equals("PNG") || suffix.equals("png") || suffix.equals("JPG") || suffix.equals("jpg")) {
            return true;
        }
        return false;
    }

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
