package com.ruoyi.jgc.util;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.SecureRandom;
import java.util.Base64;

public class FileEncryptorDecryptorUtil {

    public static void main(String[] args) throws Exception {
        

        // 加密文件
        String encodedKey = "htB9QrK3wGxdu5YlQnbfcL03HX8q3/HrJe95BShr+ww=";
        String encodedIv = "8yX47vcmaxOArXJXifVSzQ==";
        String basePath = "D:/jgc/backData/";
        String rawFile = basePath + "output_file.sql";
        String encryptFile = basePath + "encrypted.sql";
        encryptFile(rawFile, encryptFile, encodedKey, encodedIv);

        // 解密文件
        String decryptedFile = basePath + "decrypted.sql";
        decryptFile(encryptFile, decryptedFile, encodedKey, encodedIv);
    }

    public static void encryptFile(String inputFilePath, String outputFilePath, String keyStr, String ivStr) throws Exception {
        byte[] key = Base64.getDecoder().decode(keyStr);
        byte[] iv = Base64.getDecoder().decode(ivStr);

        SecretKeySpec secretKeySpec = new SecretKeySpec(key, "AES");
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);

        try (FileInputStream fis = new FileInputStream(inputFilePath);
             FileOutputStream fos = new FileOutputStream(outputFilePath)) {
            byte[] inputBytes = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(inputBytes)) != -1) {
                byte[] outputBytes = cipher.update(inputBytes, 0, bytesRead);
                if (outputBytes != null) {
                    fos.write(outputBytes);
                }
            }
            byte[] outputBytes = cipher.doFinal();
            if (outputBytes != null) {
                fos.write(outputBytes);
            }
        }
    }

    public static void decryptFile(String inputFilePath, String outputFilePath, String keyStr, String ivStr) throws Exception {
        byte[] key = Base64.getDecoder().decode(keyStr);
        byte[] iv = Base64.getDecoder().decode(ivStr);

        SecretKeySpec secretKeySpec = new SecretKeySpec(key, "AES");
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, secretKeySpec, ivParameterSpec);

        try (FileInputStream fis = new FileInputStream(inputFilePath);
             FileOutputStream fos = new FileOutputStream(outputFilePath)) {
            byte[] inputBytes = new byte[1024];
            int bytesRead;
            while ((bytesRead = fis.read(inputBytes)) != -1) {
                byte[] outputBytes = cipher.update(inputBytes, 0, bytesRead);
                if (outputBytes != null) {
                    fos.write(outputBytes);
                }
            }
            byte[] outputBytes = cipher.doFinal();
            if (outputBytes != null) {
                fos.write(outputBytes);
            }
        }
    }

    public static String createKey() throws Exception {
        // 生成密钥
        KeyGenerator keyGen = KeyGenerator.getInstance("AES");
        keyGen.init(256); // 选择256位密钥长度
        SecretKey secretKey = keyGen.generateKey();
        String encodedKey = Base64.getEncoder().encodeToString(secretKey.getEncoded());
        return encodedKey;

        
    }

    public static String createIV() throws Exception{
        // 生成IV
        SecureRandom secureRandom = new SecureRandom();
        byte[] iv = new byte[16]; // AES的IV长度为16字节
        secureRandom.nextBytes(iv);
        String encodedIv = Base64.getEncoder().encodeToString(iv);
        return encodedIv;
    }
}