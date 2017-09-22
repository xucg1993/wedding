package com.xucg.wedding.common.util.file;


import com.xucg.wedding.common.util.constant.Constant;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileUtil {

    public static void writeFile(String pathname, String content) throws IOException {
        File path = new File(pathname);
        File parent = path.getParentFile();
        if (!parent.exists()) {
            parent.mkdirs();
        }
        FileOutputStream fos = null;
        try {
            fos = new FileOutputStream(path);
        } catch (IOException e) {
            if (!parent.exists()){
                parent.mkdirs();
            }
            fos = new FileOutputStream(path);
        }
        try {
            byte[] buff = content.getBytes(Constant.GBK_ENCODING);
            fos.write(buff, 0, buff.length);
        } finally {
            fos.close();
        }
    }
    //生成目录地址
    public static boolean genDirectory(String path){
        File file=new File(path);
        if(!file.isDirectory()&&!file.exists()){
            return file.mkdirs();
        }
        return true;
    }
}
