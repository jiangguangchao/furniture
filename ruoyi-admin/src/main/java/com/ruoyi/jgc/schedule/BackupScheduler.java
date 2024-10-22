package com.ruoyi.jgc.schedule;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

@Component
public class BackupScheduler {

    private static final Logger logger = LoggerFactory.getLogger(BackupScheduler.class);

    @Scheduled(cron = "0 0 0/1 * * ?") // 每小时执行一次
    public void performBackup() {
        logger.info("开始执行数据库备份...");
        
        String scriptPath = "D:\\jgc\\project\\java\\ruoyi\\furniture\\backup_and_commit.bat"; // 脚本的路径
        
        try {
            Process process = Runtime.getRuntime().exec(scriptPath);
            
            // 读取标准输出
            BufferedReader stdInput = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String s;
            while ((s = stdInput.readLine()) != null) {
                logger.info(s);
            }
            
            // 读取错误输出
            BufferedReader stdError = new BufferedReader(new InputStreamReader(process.getErrorStream()));
            while ((s = stdError.readLine()) != null) {
                logger.error(s);
            }
            
            int exitCode = process.waitFor();
            if (exitCode == 0) {
                logger.info("数据库备份完成！");
            } else {
                logger.error("数据库备份失败，退出代码：" + exitCode);
            }
        } catch (IOException | InterruptedException e) {
            logger.error("执行数据库备份时发生错误：", e);
        }
    }
}