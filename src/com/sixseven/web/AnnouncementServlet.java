package com.sixseven.web; /**
 * @author Belly
 * @version 1.1.0
 */

import com.google.gson.Gson;
import com.sixseven.bean.Announcement;
import com.sixseven.bean.Comment;
import com.sixseven.service.AnnouncementService;
import com.sixseven.service.impl.AnnouncementServiceImpl;
import com.sixseven.utils.WebUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

public class AnnouncementServlet extends BasicServlet {
    private AnnouncementService announcementService = new AnnouncementServiceImpl();
    protected void map(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("announcement", announcementService.AnnouncementAndComments());
        request.getRequestDispatcher("/views/member/Ultramantaro.jsp").forward(request, response);
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Announcement announcement = new Announcement();
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
                            announcement.setName(fileItem.getString("utf-8"));
                        }else if ("text".equals(fileItem.getFieldName())){
                            announcement.setText(fileItem.getString("utf-8"));
                        }
                    }else {
                        String name = fileItem.getName();
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
                            announcement.setImg_path(filePath + "/" + name);//保存路径
                            fileItem.getOutputStream().close();//关闭流
                        }
                    }
                }
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        announcement.setDatetime(new Date());
        announcementService.addAnnouncement(announcement);
        response.sendRedirect(request.getContextPath() + "/cowryServlet?action=page&pageNo=1");
    }

    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("announcement", announcementService.AnnouncementAndComments());
        request.getRequestDispatcher("/views/manage/ann.jsp").forward(request, response);
    }

    protected void comment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("commentList", announcementService.queryCommentByAnnouncementId(
                WebUtils.parseInteger(request.getParameter("id"), 0)));
        request.getRequestDispatcher("/views/manage/comment.jsp").forward(request, response);
    }
    protected void deleteAnnouncement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        announcementService.deleteAnnouncementById(WebUtils.parseInteger(
                request.getParameter("id"), 0));
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void deleteComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        announcementService.deleteCommentById(WebUtils.parseInteger(
                request.getParameter("id"), 0));
        response.sendRedirect(request.getHeader("Referer"));
    }

    protected void addComment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int announcementId = WebUtils.parseInteger(request.getParameter("announcementId"), 0);
        String name = request.getParameter("name");
        String message = request.getParameter("message");
        int memberId = WebUtils.parseInteger(request.getParameter("memberId"), 0);
        announcementService.addComment(new Comment(
                null, name, new Date(), message, memberId, announcementId));
        response.sendRedirect(request.getHeader("Referer"));
    }
}
