package com.xucg.wedding.common.util.weixin;


import com.xucg.wedding.common.util.image.ImagesUtil;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

public class WeixinMediaUtil {

    public static void downloadMedia(String requestUrl, String savePath) {
        HttpURLConnection conn = null;
        try {
            URL url = new URL(requestUrl);
            conn = (HttpURLConnection) url.openConnection();
            conn.setDoInput(true);
            conn.setRequestMethod("GET");
            if (!savePath.endsWith("/")) {
                savePath += "/";
            }
            BufferedInputStream in = new BufferedInputStream(conn.getInputStream());

            File file = new File(savePath);
            File parent = file.getParentFile();
            if (!parent.exists()) {
                parent.mkdirs();
            }

            FileOutputStream out = new FileOutputStream(file);
            byte[] buf = new byte[8096];
            int size = 0;
            while ((size = in.read(buf)) != -1) {
                out.write(buf, 0, size);
            }
            ImagesUtil.compressImageByPercent(savePath, savePath, 0.5);
            in.close();
            out.close();

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            conn.disconnect();
        }
    }
}
