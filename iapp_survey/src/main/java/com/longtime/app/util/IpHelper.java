package com.longtime.app.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
/**
 * 2014/6/16
 * @author fangxinyuan
 *
 */
public class IpHelper {
    /**
     * 得到本机IP
     * @return
     */
	public  String getOwnerComputerIp(){
		InetAddress addr = null;
		try {
			addr = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		String ip=addr.getHostAddress();//获得本机IP
		return ip;
	}
	
	/**
	 * 得到局域网ip列表
	 * @return
	 */
	public InetAddress[] getLansIp(){
	    Vector v = new Vector(50);
	    try {
	      Process process = Runtime.getRuntime().exec("arp -a");
	      InputStreamReader inputStr = new InputStreamReader(process.getInputStream(), "GBK");
	      BufferedReader br = new BufferedReader(inputStr);
	      String temp = "";
	      br.readLine();
	      br.readLine();
	      br.readLine();// 此后开始读取IP地址，之前为描述信息，忽略。
	      while ((temp = br.readLine()) != null) {
	        if (temp!="" && temp!=null && temp.length()>0) {
	          StringTokenizer tokens=new StringTokenizer(temp);
	          String x;
	          InetAddress add=null;
	          try {
	            add = InetAddress.getByName(x = tokens
	                .nextToken());
	          } catch (UnknownHostException e) {
	            continue;
	          }
	          v.add(add);
	        }
	      }
	      v.add(InetAddress.getLocalHost());
	      process.destroy();
	      br.close();
	      inputStr.close();
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    int cap = v.size();
	    InetAddress[] addrs = new InetAddress[cap];
	    for (int i = 0; i < cap; i++) {
	      addrs[i] = (InetAddress) v.elementAt(i);
	    }
	    return addrs;
	}
	/**
	 * 得到本机的mac地址
	 * @return
	 */
	public String getMacAddress(){
		 String mac = "";
		         StringBuffer sb = new StringBuffer();
		  
		         try {
		             NetworkInterface ni = NetworkInterface.getByInetAddress(InetAddress.getByName(getOwnerComputerIp()));
		              byte[] macs = ni.getHardwareAddress();
		              for (int i = 0; i < macs.length; i++) {
		              mac = Integer.toHexString(macs[i] & 0xFF);
		            
		              if (mac.length() == 1) {
		                mac = '0' + mac;
		              }
		              sb.append(mac + "-");
		             }
		  
		         } catch (SocketException e) {
		             e.printStackTrace();
		         } catch (UnknownHostException e) {
		             e.printStackTrace();
		         }
		         mac = sb.toString();
		         mac = mac.substring(0, mac.length() - 1);
		         return mac;
	}
	
	/**
	 * 得到局域网中电脑的mac地址列表
	 * @return
	 */
	public List<String> getLansMacAddress(){
		List<String> macs=new ArrayList<String>();
	    try {
	      Process process = Runtime.getRuntime().exec("arp -a");
	      InputStreamReader inputStr = new InputStreamReader(process.getInputStream(), "GBK");
	      BufferedReader br = new BufferedReader(inputStr);
	      String temp = "";
	      br.readLine();
	      br.readLine();
	      br.readLine();// 此后开始读取IP地址，之前为描述信息，忽略。
	      while ((temp = br.readLine()) != null) {
	        if (temp!="" && temp!=null && temp.length()>0) {
	          StringTokenizer tokens=new StringTokenizer(temp);
	          String x=tokens.nextToken();
	          macs.add(tokens.nextToken());
	        }
	      }
	      process.destroy();
	      br.close();
	      inputStr.close();
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	   return macs;
	}
	
	/**
	 * 得到访问者ip
	 * @param request
	 * @return
	 */
	public static String getRemortIP(HttpServletRequest request) {  
	    if (request.getHeader("x-forwarded-for") == null) {  
	        return request.getRemoteAddr();  
	    }  
	    return request.getHeader("x-forwarded-for");  
	}
	
	
	
	
	
	public static void main(String args[]){
		IpHelper ipHelper=new IpHelper();
//		InetAddress[] inetAddresses=ipHelper.getLansIp();
//		for(InetAddress inetAddress:inetAddresses){
//			System.out.println(inetAddress.getHostAddress());
//		}
		//System.out.println(ipHelper.getMacAddress());
		List<String> list=ipHelper.getLansMacAddress();
		
		for(String mac:list){
			System.out.println(mac);
		}
		
		
		
		
		
 	}
	
}
