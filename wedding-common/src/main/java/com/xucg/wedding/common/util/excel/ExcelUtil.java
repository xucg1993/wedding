package com.xucg.wedding.common.util.excel;

import com.xucg.wedding.common.util.string.StringUtil;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.format.Colour;
import jxl.write.*;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**

 */
public class ExcelUtil {

    public static List<List<String>> getExcelContentRow(InputStream instream) {

        List<List<String>> rowList = new ArrayList<>();
        Workbook readwb = null;
        try {
            //构建Workbook对象, 只读Workbook对象
            //直接从本地文件创建Workbook
            readwb = Workbook.getWorkbook(instream);
            //Sheet的下标是从0开始
            //获取第一张Sheet表
            Sheet readsheet = readwb.getSheet(0);
            //获取Sheet表中所包含的总列数
            int rsColumns = readsheet.getColumns();
            //获取Sheet表中所包含的总行数
            int rsRows = readsheet.getRows();
            //获取指定单元格的对象引用
            for (int i = 0; i < rsRows; i++) {
                List<String> list = new ArrayList<>();
                for (int j = 0; j < rsColumns; j++) {
                    Cell cell = readsheet.getCell(j, i);
                    if (j == 0 && StringUtil.isNullorEmpty(cell.getContents())) break;
                    String content = cell.getContents().trim();
                    content = StringUtil.checkString(content);
                    list.add(content);
                }
                if (list.size() > 0) rowList.add(list);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            readwb.close();
        }
        return rowList;
    }

    public static Map<String, List<String>> getExcelContentCol(InputStream instream) {

        Map<String, List<String>> map = new HashMap<>();
        Workbook readwb = null;
        try {
            //构建Workbook对象, 只读Workbook对象
            //直接从本地文件创建Workbook
            readwb = Workbook.getWorkbook(instream);
            //Sheet的下标是从0开始
            //获取第一张Sheet表
            Sheet readsheet = readwb.getSheet(0);
            //获取Sheet表中所包含的总列数
            int rsColumns = readsheet.getColumns();
            //获取Sheet表中所包含的总行数
            int rsRows = readsheet.getRows();
            //获取指定单元格的对象引用
            for (int j = 0; j < rsColumns; j++) {

                String firstRow = "";
                List<String> list = new ArrayList<>();
                for (int i = 0; i < rsRows; i++) {
                    Cell cell = readsheet.getCell(j, i);
                    if (i == 0) {
                        firstRow = cell.getContents().trim();
                        firstRow = firstRow.replaceAll("\\s", "");
                        firstRow = StringUtil.checkString(firstRow);
                    } else {
                        String content = cell.getContents().trim();
                        content = content.replaceAll("\\s", "");
                        content = StringUtil.checkString(content);
                        if (!StringUtil.isNullorEmpty(content)) {
                            list.add(content);
                        }
                    }
                }
                map.put(firstRow, list);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            readwb.close();
        }
        return map;
    }

    public static void createNewExcel(HttpServletResponse response, String name, List<List<String>> title) {
        //利用已经创建的Excel工作薄,创建新的可写入的Excel工作薄
        WritableWorkbook wwb = null;
        try {
            OutputStream out = response.getOutputStream();
            // 下载格式设置
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(name.getBytes("utf-8"), "ISO8859-1") + "\"");
            //创建新excel
            wwb = Workbook.createWorkbook(out);
            //创建第一张工作表
            WritableSheet ws = wwb.createSheet("Sheet1", 0);

            for (int i = 0; i < title.size(); i++) {
                for (int j = 0; j < title.get(i).size(); j++) {
                    WritableFont titleFont = isBlod(i);
                    WritableCellFormat titleFormat = new WritableCellFormat(titleFont);
//                    setBackground(i, titleFormat);
                    //创建新的单元格
                    Label label = new Label(j, i, title.get(i).get(j), titleFormat);
                    ws.addCell(label);
                }
            }
            //写入Excel对象
            wwb.write();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                wwb.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void createExcel(HttpServletResponse response, String name, List<List<String>> title, int index) {
        //利用已经创建的Excel工作薄,创建新的可写入的Excel工作薄
        WritableWorkbook wwb = null;
        try {
            OutputStream out = response.getOutputStream();
            //System.out.println(name);
            // 获取文件名称
            //String fileName = "newcustomer.xls";
            // 下载格式设置
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(name.getBytes("utf-8"), "ISO8859-1") + "\"");
            //创建新excel
            wwb = Workbook.createWorkbook(out);
            //创建第一张工作表
            WritableSheet ws = wwb.createSheet("Sheet1", 0);
            for (int i = 0; i < title.size(); i++) {    //行
                for (int j = 0; j < title.get(i).size(); j++) { //列
//                    WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD, false);
                    WritableCellFormat titleFormat = new WritableCellFormat();
//                    setBackground(i, titleFormat);
                    if (i == 0) {
                        if (j >= index && j % 2 == 1) {
                            ws.mergeCells(j, 0, j + 1, 0);
                        }
                    }
                    if (i == 1) {
                        if (j < index) {
                            ws.mergeCells(j, 0, j, 1);
                        }
                    }
                    if (i < 2) {
                        WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD, false);
                        titleFormat = new WritableCellFormat(titleFont);
                    }

                    //创建新的单元格
                    Label label = new Label(j, i, title.get(i).get(j), titleFormat);
                    ws.addCell(label);
                }
                //获得第一个单元格对象
                //WritableCell wc = ws.getWritableCell(i, 0);
                /*//判断单元格的类型, 做出相应的转化
                if (wc.getType() == CellType.LABEL) {
                    Label l = (Label) wc;
                    l.setString(title.get(i));
                }*/
            }
            //写入Excel对象
            wwb.write();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                wwb.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void createFinalExcel(HttpServletResponse response, String name, List<List<String>> title, int index) {
        //利用已经创建的Excel工作薄,创建新的可写入的Excel工作薄
        WritableWorkbook wwb = null;
        try {
            OutputStream out = response.getOutputStream();
            //System.out.println(name);
            // 获取文件名称
            //String fileName = "newcustomer.xls";
            // 下载格式设置
            response.setContentType("APPLICATION/OCTET-STREAM");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(name.getBytes("utf-8"), "ISO8859-1") + "\"");
            //创建新excel
            wwb = Workbook.createWorkbook(out);
            //创建第一张工作表
            WritableSheet ws = wwb.createSheet("Sheet1", 0);
            for (int i = 0; i < title.size(); i++) {    //行
                for (int j = 0; j < title.get(i).size(); j++) { //列
//                    WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD, false);
                    WritableCellFormat titleFormat = new WritableCellFormat();
//                    setBackground(i, titleFormat);
                    if (i == 0) {
                        if (j >= index && j % 4 == 3) {
                            ws.mergeCells(j, 0, j + 3, 0);
                        }
                    }
                    if (i == 1) {
                        if (j < index) {
                            ws.mergeCells(j, 0, j, 1);
                        }
                    }
                    if (i < 2) {
                        WritableFont titleFont = new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD, false);
                        titleFormat = new WritableCellFormat(titleFont);
                    }

                    //创建新的单元格
                    Label label = new Label(j, i, title.get(i).get(j), titleFormat);
                    ws.addCell(label);
                }
                //获得第一个单元格对象
                //WritableCell wc = ws.getWritableCell(i, 0);
                /*//判断单元格的类型, 做出相应的转化
                if (wc.getType() == CellType.LABEL) {
                    Label l = (Label) wc;
                    l.setString(title.get(i));
                }*/
            }
            //写入Excel对象
            wwb.write();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                wwb.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    private static WritableFont isBlod(int i) {
        if (i == 0) return new WritableFont(WritableFont.ARIAL, 10, WritableFont.BOLD, false);
        else return new WritableFont(WritableFont.ARIAL, 10, WritableFont.NO_BOLD, false);
    }

    private static void setBackground(int i, WritableCellFormat titleFormat) throws WriteException {
        if (i == 0) titleFormat.setBackground(Colour.BLUE);
    }
}

