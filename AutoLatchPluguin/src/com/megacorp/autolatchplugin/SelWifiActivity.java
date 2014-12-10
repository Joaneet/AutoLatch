package com.megacorp.autolatchplugin;

import android.app.Activity;
import android.content.Context;
import android.graphics.Typeface;
import android.net.wifi.WifiConfiguration;
import android.net.wifi.WifiManager;
import android.os.Bundle;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.megacorp.autolatchpluguin.R;

public class SelWifiActivity extends AutoLatchCreatorActivity{
	private boolean isRunning;
  
	protected void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.alp_selwifi);
		setTitle(R.string.alp_ListWifisTitle);
	}
  
	protected void onPause(){
		isRunning = false;
		super.onPause();
  	}
  
	public void onResume(){
		super.onResume();
		isRunning = true;
		ListWifis();
	}
  
	private void ListWifis(){
  		WifiManager localWifiManager = (WifiManager)getSystemService(Context.WIFI_SERVICE);
  		localWifiManager.setWifiEnabled(true);
  		List<WifiConfiguration> wifiConfigs = localWifiManager.getConfiguredNetworks();
  		ArrayList<WifiConfiguration> listWifi = new ArrayList<WifiConfiguration>();
  		if(wifiConfigs!=null){
  			Iterator<WifiConfiguration> iWifis = wifiConfigs.iterator();
  			while(iWifis.hasNext()){
  				WifiConfiguration wc = iWifis.next();
  				if(AutoLatchReceiver.isSecure(wc)) listWifi.add(wc);
  			}
  			((ListView)findViewById(R.id.d_listview)).setAdapter(new WifiListAdapter(this, listWifi, true, true));
  		}else{
  			Toast.makeText(this, getString(R.string.alp_alert_noWifiConf), Toast.LENGTH_LONG).show();
  			new Thread(new Runnable() {				
				@Override
				public void run() {
					try {
						Thread.sleep(5000L);
						
						runOnUiThread(new Runnable() {							
							@Override
							public void run() {
								ListWifis();
							}
						});
					} catch (InterruptedException e) { e.printStackTrace();}
				}
			}).start();
  		}
	}  
  
	private class WifiListAdapter extends SimpleListElement{
		public WifiListAdapter(Activity activity, ArrayList list, boolean b1, boolean b2){
			super(activity, list, b1, b2);
		}
    
		public View getView(int numElement, View view, ViewGroup viewgroup){
			view = super.getView(numElement, view, viewgroup);
			ViewElements element = (ViewElements)view.getTag();
			final WifiConfiguration wc = (WifiConfiguration)this.list.get(numElement);
			element.row_name.setText(wc.SSID.subSequence(1, -1 + wc.SSID.length()));
			element.row_name.setTypeface(Typeface.createFromAsset(activity.getAssets(), "fonts/roboto_light.ttf"));
			element.alp_ApplicationElementLayout.setOnClickListener(new OnClickListener(){
				public void onClick(View view){
					StaticData.newAutoOp = new AutoOpWifi(StaticData.newAutoOp, wc);
					StaticData.newAutoOpSettings(SelWifiActivity.this);
				}
			});
			return view;
		}
	}
}