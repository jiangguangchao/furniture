package com.ruoyi.web.controller.common;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.constant.Constants;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUploadUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.framework.config.ServerConfig;
import com.ruoyi.system.domain.UploadFile;
import com.ruoyi.system.service.IUploadFileService;

/**
 * 通用请求处理
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/common")
public class CommonController extends BaseController
{
    private static final Logger log = LoggerFactory.getLogger(CommonController.class);

    @Autowired
    private ServerConfig serverConfig;
    @Autowired
    private IUploadFileService uploadFileService;
    @Autowired
    private RuoYiConfig ruoyiConfig;

    private static final String FILE_DELIMETER = ",";

    /**
     * 通用下载请求
     * 
     * @param fileName 文件名称
     * @param delete 是否删除
     */
    @GetMapping("/download")
    public void fileDownload(String fileName, Boolean delete, HttpServletResponse response, HttpServletRequest request)
    {
        try
        {
            if (!FileUtils.checkAllowDownload(fileName))
            {
                throw new Exception(StringUtils.format("文件名称({})非法，不允许下载。 ", fileName));
            }
            String realFileName = System.currentTimeMillis() + fileName.substring(fileName.indexOf("_") + 1);
            String filePath = RuoYiConfig.getDownloadPath() + fileName;

            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, realFileName);
            FileUtils.writeBytes(filePath, response.getOutputStream());
            if (delete)
            {
                FileUtils.deleteFile(filePath);
            }
        }
        catch (Exception e)
        {
            log.error("下载文件失败", e);
        }
    }

    /**
     * 通用上传请求（单个）
     */
    @PostMapping("/upload")
    public AjaxResult uploadFile(MultipartFile file, String associationId, String associationType) throws Exception
    {
        try
        {
            logger.info("关联数据 {} {}",associationId, associationType);
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = serverConfig.getUrl() + fileName;
            AjaxResult ajax = AjaxResult.success();
            ajax.put("url", url);
            ajax.put("fileName", fileName);
            ajax.put("newFileName", FileUtils.getName(fileName));
            ajax.put("originalFilename", file.getOriginalFilename());

            addFileRecord(fileName, getUsername(), associationId, associationType);
            return ajax;
        }
        catch (Exception e)
        {
            log.error("上传文件失败", e);
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 通用上传请求（多个）
     */
    @PostMapping("/uploads")
    public AjaxResult uploadFiles(List<MultipartFile> files, String associationId, String associationType) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = RuoYiConfig.getUploadPath();
            List<String> urls = new ArrayList<String>();
            List<String> fileNames = new ArrayList<String>();
            List<String> newFileNames = new ArrayList<String>();
            List<String> originalFilenames = new ArrayList<String>();
            for (MultipartFile file : files)
            {
                // 上传并返回新文件名称
                String fileName = FileUploadUtils.upload(filePath, file);
                String url = serverConfig.getUrl() + fileName;
                urls.add(url);
                fileNames.add(fileName);
                newFileNames.add(FileUtils.getName(fileName));
                originalFilenames.add(file.getOriginalFilename());
                addFileRecord(fileName, getUsername(), associationId, associationType);
            }
            AjaxResult ajax = AjaxResult.success();
            ajax.put("urls", StringUtils.join(urls, FILE_DELIMETER));
            ajax.put("fileNames", StringUtils.join(fileNames, FILE_DELIMETER));
            ajax.put("newFileNames", StringUtils.join(newFileNames, FILE_DELIMETER));
            ajax.put("originalFilenames", StringUtils.join(originalFilenames, FILE_DELIMETER));
            return ajax;
        }
        catch (Exception e)
        {
            log.error("上传多文件失败", e);
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 删除上传文件。这里的path实际上就是文件的url。数据库没有单独存储文件的磁盘存储路径，
     * 但是可以从url中解析出来。就是将路径中的profile替换为配置的profile。
     * 例如数据库中保存的路径（实际上是url）是/profile/upload/2024/10/08/20241008175506A001.png。
     * profile配置的磁盘地址是D:/ruoyi/uploadPath。那么实际上要删除的文件路径就是D:/ruoyi/uploadPath/upload/2024/10/08/20241008175506A001.png。
     * 路径中的文件名称20241008175506A001.png ，其中20241008175506A001就是文件上传记录表中的id，可以根据id删除文件上传记录
     * @param filePaths
     * @return
     */
    @PostMapping("/deleteFiles")
    public AjaxResult deleteUploadFile(@RequestBody List<String> filePaths) {
        try {
            logger.info("删除文件：{}", filePaths);
            for (String filePath : filePaths) {
                String fullPath = filePath.replace("/profile", ruoyiConfig.getProfile());//磁盘地址
                if (FileUtils.deleteFile(fullPath)) {
                    logger.info("删除文件成功 路径:{}" , fullPath);
                } else {
                    logger.error("删除文件失败 路径:{}" , fullPath);
                }
                //删除文件上传记录
                String id = FileUtils.getNameNotSuffix(filePath);
                uploadFileService.deleteUploadFileById(id);
            }
            return AjaxResult.success();
        } catch (Exception e) {
            log.error("删除文件失败", e);
            return AjaxResult.error(e.getMessage());
        }

    }

    /**
     * 本地资源通用下载
     */
    @GetMapping("/download/resource")
    public void resourceDownload(String resource, HttpServletRequest request, HttpServletResponse response)
            throws Exception
    {
        try
        {
            if (!FileUtils.checkAllowDownload(resource))
            {
                throw new Exception(StringUtils.format("资源文件({})非法，不允许下载。 ", resource));
            }
            // 本地资源路径
            String localPath = RuoYiConfig.getProfile();
            // 数据库资源地址
            String downloadPath = localPath + StringUtils.substringAfter(resource, Constants.RESOURCE_PREFIX);
            // 下载名称
            String downloadName = StringUtils.substringAfterLast(downloadPath, "/");
            response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
            FileUtils.setAttachmentResponseHeader(response, downloadName);
            FileUtils.writeBytes(downloadPath, response.getOutputStream());
        }
        catch (Exception e)
        {
            log.error("下载文件失败", e);
        }
    }

    public void addFileRecord(String filePath, String createBy, String associationId, String associationType) {
        String fileName = FileUtils.getName(filePath);
        String fileId = FileUtils.getNameNotSuffix(filePath);
        UploadFile uploadFile = new UploadFile();
        uploadFile.setId(fileId);
        uploadFile.setFileName(fileName);
        uploadFile.setFilePath(filePath);
        uploadFile.setCreateBy(createBy);
        uploadFile.setCreateTime(new Date());
        if (StringUtils.isNotEmpty(associationId)) {
            uploadFile.setAssociationId(associationId);
            uploadFile.setAssociationType(associationType);
        }
        uploadFileService.insertUploadFile(uploadFile);
    }
}
