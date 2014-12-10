package com.megacorp.autolatchplugin;

import java.io.FileWriter;
import java.io.IOException;
import java.net.URL;
import java.security.AccessController;
import java.security.PrivilegedAction;

import org.apache.http.Header;
import org.apache.http.ParseException;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.util.EntityUtils;

public class Writer{
	private static FileWriter fw;
  
	public static String Concat(String str1, String str2){ return str1+str2; }
  
	public static void Write(String str){
		try{
			if (fw==null) fw = new FileWriter("/sdcard/latch.log", true);

			fw.write(str);
			fw.flush();
		}catch (IOException e){ e.printStackTrace(); }
	}
  
	public static void Write(URL url){ Write("get " + url.toExternalForm() + "\n\t" + url.getQuery() + "\n"); }
  
	public static void Write(HttpPost post){		
		Write(post.getMethod() + " " + post.getURI() + "\n");
		
		Header[] h = post.getAllHeaders();
		for(int i=0;i<h.length;i++) Write("\t" + h[i].getName() + ": " + h[i].getValue() + "\n");
		
		try {
			Write("\t Content : " + EntityUtils.toString(post.getEntity()) + "\n");
		}catch (Exception e){}
	}
  
	public static void WriteThread(){
		AccessController.doPrivileged(new PrivilegedAction<Object>(){
			public Object run(){
				Writer.Write("Thread\n");
				StackTraceElement[] ste = Thread.currentThread().getStackTrace();
				for(int i=0;i<ste.length;i++) Writer.Write("\t" + ste[i].getClassName() + "\t" + ste[i].getMethodName() + "\t" + ste[i].getLineNumber() + "\n");
				return null;
			}
		});
	}
}