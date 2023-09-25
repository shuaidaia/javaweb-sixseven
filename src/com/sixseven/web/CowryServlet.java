package com.sixseven.web; /**
 * @author Belly
 * @version 1.1.0
 */

import com.sixseven.bean.Cowry;
import com.sixseven.bean.Page;
import com.sixseven.service.CowryService;
import com.sixseven.service.impl.CowryServiceImpl;
import com.sixseven.utils.WebUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

public class CowryServlet extends BasicServlet {
    private CowryService cowryService = new CowryServiceImpl();
    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("cowryListByOne", cowryService.cowryListByStatus(1));
        request.setAttribute("cowryListByTwo", cowryService.cowryListByStatus(2));
        request.getRequestDispatcher("/views/customer/index.jsp").forward(request, response);
    }
    protected void list2(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("cowryListByThree", cowryService.cowryListByStatus(3));
        request.setAttribute("cowryListByFour", cowryService.cowryListByStatus(4));
        request.setAttribute("cowryListByFive", cowryService.cowryListByStatus(5));
        request.setAttribute("cowryListBySix", cowryService.cowryListByStatus(6));
        request.getRequestDispatcher("/views/customer/UltraAce.jsp").forward(request, response);
    }

    protected void cowryList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("cowryList", cowryService.cowryList());
        request.getRequestDispatcher("/views/manage/list.jsp").forward(request, response);
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cowry cowry = new Cowry();
        if (ServletFileUpload.isMultipartContent(request)){
            DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
            servletFileUpload.setHeaderEncoding("utf-8");
            try {
                List<FileItem> list = servletFileUpload.parseRequest(request);
                for (FileItem fileItem : list) {

//                    System.out.println("fileItem= " + fileItem);

                    if (fileItem.isFormField()){//普通文本返回true 文件返回false
                        if ("name".equals(fileItem.getFieldName())){
                            cowry.setName(fileItem.getString("utf-8"));
                        }else if ("price".equals(fileItem.getFieldName())){
                            cowry.setPrice(new BigDecimal(fileItem.getString()));
                        }else if ("stock".equals(fileItem.getFieldName())){
                            cowry.setStock(new Integer(fileItem.getString()));
                        }else if ("sales".equals(fileItem.getFieldName())){
                            cowry.setSales(new Integer(fileItem.getString()));
                        }else if ("status".equals(fileItem.getFieldName())){
                            cowry.setStatus(new Integer(fileItem.getString()));
                        }
                    }else {
                        String name = fileItem.getName();
//                        System.out.println("name= " + name);
                        if (!"".equals(name)){
                            String filePath = WebUtils.FURN_IMG_PATH + WebUtils.getYearMothDay();
                            String fileRealPath = request.getServletContext().getRealPath(filePath);
                            File fileRealPathDirectory = new File(fileRealPath);
                            if (!fileRealPathDirectory.exists()){
                                fileRealPathDirectory.mkdirs();//创建目录
                            }
                            name = UUID.randomUUID() + "_" + System.currentTimeMillis() + "_" + name;
                            //把文件保存到指定的文件夹
                            fileItem.write(new File(fileRealPathDirectory + "/" + name));
                            cowry.setImg_path(filePath + "/" + name);//保存路径
                            fileItem.getOutputStream().close();//关闭流
                        }
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        cowryService.addCowry(cowry);

        //重定向到商品列表页面
        response.sendRedirect(request.getContextPath()
                + "/cowryServlet?action=page&pageNo="
                + WebUtils.parseInteger(request.getParameter("pageTotalCount"), 1));
    }

    protected void singleCowry(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            id = 0;
        }
        Cowry cowry = cowryService.cowryById(id);
        request.setAttribute("cowry", cowry);
        request.getRequestDispatcher("/views/manage/update.jsp").forward(request, response);
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        Integer id;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            id = 0;
        }
        Cowry cowry = cowryService.cowryById(id);
        if (ServletFileUpload.isMultipartContent(request)){
            DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(diskFileItemFactory);
            servletFileUpload.setHeaderEncoding("utf-8");
            try {
                List<FileItem> list = servletFileUpload.parseRequest(request);
//                for (FileItem fileItem : list) {
//                    System.out.println(fileItem);
//                }
                for (FileItem fileItem : list) {
                    if (fileItem.isFormField()){//普通文本返回true 文件返回false
                        if ("name".equals(fileItem.getFieldName())){
                            cowry.setName(fileItem.getString("utf-8"));
                        }else if ("price".equals(fileItem.getFieldName())){
                            cowry.setPrice(new BigDecimal(fileItem.getString()));
                        }else if ("stock".equals(fileItem.getFieldName())){
                            cowry.setStock(new Integer(fileItem.getString()));
                        }else if ("sales".equals(fileItem.getFieldName())){
                            cowry.setSales(new Integer(fileItem.getString()));
                        }else if ("status".equals(fileItem.getFieldName())){
                            cowry.setStatus(new Integer(fileItem.getString()));
                        }
                    }else {
                        String name = fileItem.getName();

//                        System.out.println("name= " + name);

                        if (!"".equals(name)){
                            //旧照片路径
                            String oldImgPath = cowry.getImg_path();
                            String filePath = WebUtils.FURN_IMG_PATH + WebUtils.getYearMothDay();
                            String fileRealPath = request.getServletContext().getRealPath(filePath);
                            File fileRealPathDirectory = new File(fileRealPath);
                            if (!fileRealPathDirectory.exists()){
                                fileRealPathDirectory.mkdirs();//创建目录
                            }
                            name = UUID.randomUUID() + "_" + System.currentTimeMillis() + "_" + name;
                            //把文件保存到指定的文件夹
                            fileItem.write(new File(fileRealPathDirectory + "/" + name));
                            cowry.setImg_path(filePath + "/" + name);//保存路径

                            //删除旧照片
                            String oldImPathRealPath = request.getServletContext().getRealPath(oldImgPath);
                            File oldFilePath = new File(oldImPathRealPath);
                            if (oldFilePath.exists()){
                                oldFilePath.delete();//删除
                            }

                            fileItem.getOutputStream().close();//关闭流
                        }
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        cowryService.updateCowry(cowry);

        System.out.println(WebUtils.parseInteger(request.getParameter("pageNo"), 1));
        //重定向到商品列表页面
        response.sendRedirect(request.getContextPath()
                + "/cowryServlet?action=page&pageNo="
                + WebUtils.parseInteger(request.getParameter("pageNo"), 1));
    }

    protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id;
        try {
            id = Integer.parseInt(request.getParameter("id"));
        } catch (NumberFormatException e) {
            id = 0;
        }
        cowryService.deleteCowryById(id);
        response.sendRedirect(request.getHeader("Referer"));
    }


    protected void page(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer pageSize = Page.PAGE_SIZE;
        int pageNo;
        try {
            pageNo = Integer.parseInt(request.getParameter("pageNo"));
        } catch (NumberFormatException e) {
            pageNo = 1;
        }
        Page<Cowry> page = cowryService.page(pageNo, pageSize);
        request.setAttribute("page", page);
        request.setAttribute("pageItems", page.getItems());
        request.getRequestDispatcher("/views/manage/list.jsp").forward(request, response);
    }
}
