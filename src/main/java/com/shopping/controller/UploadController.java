package com.shopping.controller;


import java.io.File;
import java.io.IOException;
import java.util.List;


import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("f")
public class UploadController {

    public UploadController() {

        logger.info("【UploadController()】");
    }

    private static final Logger logger = LoggerFactory.getLogger(UploadController.class);//日志文件


    /**
     * CommonsMultipartResolver
     *
     * @param file
     * @return
     */
    @RequestMapping(value = "file")
    public String create(MultipartFile[] file, HttpServletRequest  request) {
        String filerealname = null;
        logger.info("  file up  one .............................. "+file.length);
        try {
            if (file != null && file.length > 0) {
                for (MultipartFile multipartFile : file) {
                    String  path=  request.getSession().getServletContext().getRealPath("/")+"images/"; //

                    logger.info("文件路径"+path);
                    FileUtils.writeByteArrayToFile(new File(path + multipartFile.getOriginalFilename()), multipartFile.getBytes());
                    filerealname =multipartFile.getOriginalFilename();
                    System.out.println(path);

                }

                request.getSession().setAttribute("filename","images/"+filerealname);
            }


        } catch (IOException e) {
            logger.error(e.toString());
        }
        return "WEB-INF/jsp/productadd";


    }

    /**
     * StandardServletMultipartResolver
     * @param
     * @param request
     * @return
     */
    //@RequestMapping(value = "file2")
    public String create(MultipartHttpServletRequest request) {

        try {
            List<MultipartFile> files = request.getFiles("file");
            System.out.println("  file2 up two................................ "+files);
            for (MultipartFile file : files) {
                System.out.println(file.getName());
                FileUtils.writeByteArrayToFile(new File("d:\\" + file.getOriginalFilename()), file.getBytes());
            }
        } catch (IOException e) {
            logger.error(e.toString());
        }
        return "index";
    }


}