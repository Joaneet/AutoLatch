package com.megacorp.autolatchplugin;

import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;

import java.io.PrintStream;
import java.util.Iterator;
import java.util.List;

import org.json.JSONException;
import org.json.JSONObject;

public class AutoOpWifi extends AutoOp{
	protected static final String EventDescSSIDJSONKey = "SSID";
	private WifiConfiguration wifiConfig;
  
	public AutoOpWifi(AutoOp autoop, WifiConfiguration wifiConfiguration){
		super(autoop.Operations);
		this.wifiConfig = wifiConfiguration;
	}
  
	public AutoOpWifi(String json){
		super(json);
		try{
			JSONObject jsnoO = new JSONObject(json).getJSONObject(AutoOp.EventDescJSONKey);
			wifiConfig = new WifiConfiguration();
			wifiConfig.SSID = jsnoO.getString(EventDescSSIDJSONKey);
		}catch (JSONException e){ e.printStackTrace(); }
	}
  
	private Boolean private_newEvent(Context context, Intent intent){
		NetworkInfo networkinfo = ((ConnectivityManager)context.getSystemService(Context.CONNECTIVITY_SERVICE)).getActiveNetworkInfo();
		if(networkinfo != null){
			if((networkinfo.getType() == ConnectivityManager.TYPE_WIFI) && networkinfo.isConnected()){
				final WifiManager wifiManager = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
				final WifiInfo connectionInfo = wifiManager.getConnectionInfo();
				if(connectionInfo != null){
					String SSID = connectionInfo.getSSID();
					if(wifiConfig.SSID.length()>0) //Segons versio d'android posa els noms entre cometes o no
						if(wifiConfig.SSID.charAt(0)=='"'){
							if(SSID.length()>0 && SSID.charAt(0)!='"')
								SSID = "\"" + SSID + "\"";
						}else if(SSID.length()>0 && SSID.charAt(0)=='"')
							SSID = SSID.substring(1, -1 + SSID.length());
						
					if(wifiConfig.SSID.equals(SSID)){
						Iterator<WifiConfiguration> configWifis = wifiManager.getConfiguredNetworks().iterator();
						while(configWifis.hasNext()){
							WifiConfiguration wc = configWifis.next();					
							if(wc.SSID!=null && wc.SSID.equals(wifiConfig.SSID) && AutoLatchReceiver.isSecure(wc) && wc.status==WifiConfiguration.Status.CURRENT)
								return true;
						}
					}
				}
				return false;
			}
			if(networkinfo.getType() == ConnectivityManager.TYPE_MOBILE) return false;			
		}
		return null;
	}
  
	public int getType(){ return Type_Wifi; }
  
  	public synchronized void newEvent(final Context context,final Intent intent){
  		newEvent(private_newEvent(context, intent)); 		
  	}
  
  	public String toJSON(){
  		try{
  			JSONObject json = new JSONObject();
  			json.put(EventDescSSIDJSONKey, this.wifiConfig.SSID);
  			return toJSONDesc(json);
  		}catch (JSONException e){ e.printStackTrace(); }
  		return "{}";
  	}
}