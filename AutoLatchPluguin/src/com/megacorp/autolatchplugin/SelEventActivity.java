package com.megacorp.autolatchplugin;

import java.util.ArrayList;

import com.megacorp.autolatchplugin.SimpleListElement.ViewElements;
import com.megacorp.autolatchpluguin.R;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnDismissListener;
import android.content.Intent;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Bundle;
import android.text.InputType;
import android.view.View;
import android.view.ViewGroup;
import android.view.View.OnClickListener;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.RelativeLayout;
import android.widget.Toast;

public class SelEventActivity extends AutoLatchCreatorActivity {
	private class EventViewElement{
		String text;
		OnClickListener ocl;
		
		public EventViewElement(String text, OnClickListener ocl){
			this.text = text;
			this.ocl = ocl;
		}
	}
	
	boolean GPSmenuEnable;
	private void GPSMenuClose(){
		GPSmenuEnable = false;
	}
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.alp_selevent);
		
		setTitle(R.string.alp_ListEventsTitle);
		
		ArrayList<EventViewElement> ShowList = new ArrayList<EventViewElement>();
		ShowList.add(new EventViewElement(getString(R.string.alp_WifiEventType), new OnClickListener() {
			@Override
			public void onClick(View v) {
				StartAutoLatchCreatorActivity(SelWifiActivity.class);
				//startActivity(new Intent(getApplicationContext(), SelWifiActivity.class));
			}
		}));
		
		final Activity thisactivity = this;
		ShowList.add(new EventViewElement(getString(R.string.alp_GPSEventType), new OnClickListener() {
			@Override
			public void onClick(View v) {
				GPSmenuEnable = true;
				
				final EditText et = new EditText(getApplicationContext());
				et.setInputType(InputType.TYPE_CLASS_NUMBER);
				
				final AlertDialog ad = new AlertDialog.Builder(thisactivity)
			    .setTitle(R.string.alp_GpsTitle)
			    .setMessage(R.string.alp_waitGpsLocation)
			    .setView(et)
			    .setNeutralButton(getString(R.string.alp_GpsViewPosition), new DialogInterface.OnClickListener() {
			        public void onClick(DialogInterface dialog, int whichButton) {}
			    })
			    .setPositiveButton("Ok", new DialogInterface.OnClickListener() {
			        public void onClick(DialogInterface dialog, int whichButton) {}
			    })
			    .setOnCancelListener(new OnCancelListener() {
					@Override
					public void onCancel(DialogInterface dialog) {
						GPSMenuClose();
					}
				})				
				.show();

				ad.getButton(AlertDialog.BUTTON_NEUTRAL).setEnabled(StaticData.location!=null);
				ad.getButton(AlertDialog.BUTTON_NEUTRAL).setOnClickListener(new View.OnClickListener(){ //No dismiss         
			          @Override public void onClick(View v){
			        	  try {  
			        		  if(StaticData.location!=null){    
				        		  final String urlAddress = "http://maps.google.com/maps?q="+ StaticData.location.getLatitude() +"," + StaticData.location.getLongitude() +"("+ "MAP" + ")&iwloc=A&hl=es";     
				        		  //second option:: urlAddress = "http://maps.googleapis.com/maps/api/streetview?size=500x500&location=" + myLatitude + "," + myLongitude + "&fov=90&heading=235&pitch=10&sensor=false";
				        		  //third option:: urlAddress = "geo:<" + myLatitude + ">,<" + myLongitude +">?q=<" + latitude + ">,<" + longitude +">(this is my currently location)"                                
				        		  Intent maps = new Intent(Intent.ACTION_VIEW, Uri.parse(urlAddress));
				        		  startActivity(maps);
			        		  }
		        		  } catch (Exception e) {
		        			  e.printStackTrace();
		        		  }				        	  
			          }
			    });
				ad.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener(){ //No dismiss         
			          @Override public void onClick(View v){
			        	  try {  
			        		  if(StaticData.location!=null){
				        		  int radi = Integer.parseInt(et.getText().toString());
				        		  if(radi<200){
				        			  Toast.makeText(getApplicationContext(), R.string.alp_GpsSamllRadi, Toast.LENGTH_LONG).show();
				        			  return;
				        		  }
				        		  StaticData.newAutoOp = new AutoOpGPS(StaticData.newAutoOp, StaticData.location, radi);
				        		  
				        		  GPSMenuClose();
				        		  ad.dismiss();
				        		  
				        		  StaticData.newAutoOpSettings(thisactivity);
			        		  }
		        		  } catch (Exception e) {
		        			  e.printStackTrace();
		        		  }				        	  
			          }
			    });
				
				new Thread(new Runnable() {
				    public void run() {
				    	try {
				    		while(GPSmenuEnable){
				    			Thread.sleep(1000);				    			
				    			thisactivity.runOnUiThread(new Runnable() {
								    public void run() {
								    	ad.getButton(AlertDialog.BUTTON_NEUTRAL).setEnabled(StaticData.location!=null);
								    	if(StaticData.location!=null){								    		
								    		ad.setMessage(getString(R.string.alp_GpsLocation)+"\n\n"+"\tlatitude: "+StaticData.location.getLatitude()+"\n"+"\tlongitude: "+StaticData.location.getLongitude()+"\n\n"+getString(R.string.alp_GpsRadium));
								    	}else{
								    		ad.setMessage(getString(R.string.alp_waitGpsLocation));
								    	}
								    }
								});
				    		}
						}catch (InterruptedException e){
							e.printStackTrace();
						}			    	
				    }
				}).start();				
			}
		}));
		
		((ListView)this.findViewById(R.id.d_listview)).setAdapter(new EventTypesAdapter(this, ShowList, true, true));
	}
	
	private class EventTypesAdapter extends SimpleListElement{
		public EventTypesAdapter(Activity paramActivity, ArrayList paramArrayList, boolean paramBoolean1, boolean paramBoolean2) {
			super(paramActivity, paramArrayList, paramBoolean1, paramBoolean2);
		}
		
		@Override
		public View getView(final int paramInt, View paramView, ViewGroup paramViewGroup){
			paramView = super.getView(paramInt, paramView, paramViewGroup);
			ViewElements voe = (ViewElements) paramView.getTag();
			
			EventViewElement eve = (EventViewElement)list.get(paramInt);
			
			voe.row_name.setText(eve.text);
			voe.row_name.setTypeface(Typeface.createFromAsset(activity.getAssets(), "fonts/roboto_light.ttf"));
			
			voe.alp_ApplicationElementLayout.setOnClickListener(eve.ocl);
			
			return paramView;
		}
	}
}