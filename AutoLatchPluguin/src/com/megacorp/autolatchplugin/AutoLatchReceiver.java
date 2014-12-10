package com.megacorp.autolatchplugin;

import java.util.List;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiConfiguration.KeyMgmt;
import android.net.wifi.WifiInfo;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.support.v4.content.LocalBroadcastManager;
import android.text.TextUtils;
import android.widget.Toast;

public class AutoLatchReceiver extends BroadcastReceiver implements LocationListener {
	LocationManager locManager=null;
	@Override	    
    public void onReceive(Context context, Intent intent){		
		StaticData.InitStaticData(context); //O crear un servei que mantingui la clase estatica
		
		/*if(intent.getAction().equals("android.intent.action.BOOT_COMPLETED"))
			StaticData.InitStaticData(context);
		*/
		if(intent.getAction().equals("android.net.conn.CONNECTIVITY_CHANGE"))
			StaticData.newWifiEvent(context, intent); 

		if(locManager==null){
			//Es registra per sempre?¿!
			try{
				locManager = (LocationManager) context.getSystemService(android.content.Context.LOCATION_SERVICE);
				locManager.requestLocationUpdates(LocationManager.NETWORK_PROVIDER, 1000, 10f, this);
				locManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 1000, 10f, this);
			}catch(Exception e){/*Dispositiu sense GPS, TODO: No mostra el menu GPS event*/}
		}
    }
	
	public static WifiConfiguration getCurrentWifiConfiguration(Context context) {
		ConnectivityManager connManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
		NetworkInfo networkInfo = connManager.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
		if(networkInfo.isConnected()) {
			final WifiManager wifiManager = (WifiManager) context.getSystemService(Context.WIFI_SERVICE);
			final WifiInfo connectionInfo = wifiManager.getConnectionInfo();
			 
			if(connectionInfo != null){
				List<WifiConfiguration> lWC = wifiManager.getConfiguredNetworks();
			    for(WifiConfiguration conn : lWC)
			    	if(conn.SSID!=null && conn.SSID.equals("\""+connectionInfo.getSSID()+"\""))return conn;
			}
		}
		return null;
	}	
	public static boolean isSecure(WifiConfiguration con){
		return con.allowedKeyManagement.get(KeyMgmt.WPA_PSK) && con.preSharedKey.length()!=0;
	}
	
	//GPS
	public void onLocationChanged(Location location) {
		StaticData.location = location;
		StaticData.newGpsEvent(location);
	}

	@Override public void onStatusChanged(String provider, int status, Bundle extras) {}	
	@Override public void onProviderEnabled(String provider) {}	
	@Override public void onProviderDisabled(String provider) {}
};