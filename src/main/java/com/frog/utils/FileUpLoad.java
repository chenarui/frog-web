package com.frog.utils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileUpLoad {
	public static String uploadImage(CommonsMultipartFile file,String realUploadPath,String secFName,String fileName) throws IOException
	{
		//如果目录不存在则创建目录
		File uploadFile=new File(realUploadPath+"/"+secFName);
		if(!uploadFile.exists()){
			uploadFile.mkdirs();
		}		
		
		//创建输入流
		InputStream inputStream=file.getInputStream();
		//生成输出地址URL
		String outputPath=realUploadPath+"/"+secFName+"/"+fileName;
		//创建输出流
		OutputStream outputStream=new FileOutputStream(outputPath);		
		//设置缓冲区
		byte[] buffer=new byte[1024];
		
		//输入流读入缓冲区，输出流从缓冲区写出
		while((inputStream.read(buffer))>0)
		{
		  outputStream.write(buffer);
		}
		outputStream.close();
		
		//返回原图上传后的相对地址
		return outputPath;
	}
}
