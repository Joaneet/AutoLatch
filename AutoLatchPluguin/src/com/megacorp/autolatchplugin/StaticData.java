package com.megacorp.autolatchplugin;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.location.Location;
import android.preference.PreferenceManager;
import android.text.Editable;
import android.widget.EditText;

import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Vector;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.megacorp.autolatchpluguin.R;

public class StaticData{
	public static Vector<AutoOp> AutoOpVector;
	public static final String INTENT_WAKEUP_RECEIVER = "com.megacorp.autolatchplugin.wakeup_receiver";
	private static final String SP_autoLatchs = "AutoLatchs";
	private static boolean StaticDataInit = false;
	private static SharedPreferences.Editor editor;
	public static Location location = null;
	public static AutoOp newAutoOp;
	static ArrayList<Operation> operations;
	private static SharedPreferences sharedpreferencs;
  
	private static void CreateChoiceDialog(Activity a, String strTitle, CharSequence[] Options, DialogInterface.OnClickListener ocl){
		new AlertDialog.Builder(a).setTitle(strTitle).setSingleChoiceItems(Options, -1, ocl).create().show();
	}
  
	public synchronized static void InitStaticData(Context c){
		if(!StaticDataInit){			
			c.sendBroadcast(new Intent("com.megacorp.autolatchplugin.wakeup_receiver"));
			sharedpreferencs = PreferenceManager.getDefaultSharedPreferences(c);
			editor = sharedpreferencs.edit();	
			setVectorAutoLatch(getAutoLatchs());
			StaticDataInit = true;
		}
	}
  
	public static void OnChangeVectorAutoLatch(){
		try{
			if(AutoOpVector != null && AutoOpVector.size()>0){
				JSONArray ajson = new JSONArray();
				for(AutoOp ao:AutoOpVector) ajson.put(new JSONObject(((AutoOp)ao).toJSON()));
				putString(SP_autoLatchs, ajson.toString());
			}else
				putString(SP_autoLatchs, "[]");
		}catch (Exception e){
			e.printStackTrace();
		}
	}
  
	public static void StartAutoLatchCreate(Activity paramActivity){
		newAutoOp = new AutoOpNew();
		paramActivity.startActivity(new Intent(paramActivity, SelOperationsActivity.class));
	}
	
	public static void StartViewAutoLatch(Activity paramActivity){
		paramActivity.startActivity(new Intent(paramActivity, ViewAutoLatchsActivity.class));
	}
	
	private static void delAutoOps(){
		AutoOpVector = null;
		OnChangeVectorAutoLatch();
	}
	
	public static void delAutoOps(Vector<AutoOp> delAO){
		if(AutoOpVector!=null){
			for (AutoOp ao:delAO)AutoOpVector.remove(ao);
			OnChangeVectorAutoLatch();
		}
	}
	
	private static String getAutoLatchs(){
		return getString(SP_autoLatchs, "[]");
	}
	
	private static Vector<AutoOp> getAutoOpVector(int Type){
		Vector<AutoOp> vAO = new Vector<AutoOp>();
		if(AutoOpVector!=null) for(AutoOp ao:AutoOpVector) if(ao.getType()==Type) vAO.add(ao);
		return vAO;
	}
  
	private static String getString(String Key, String Value){
		return sharedpreferencs.getString(Key, Value);
	}
  
	private static void newAutoOp(){
		if(AutoOpVector == null) AutoOpVector = new Vector<AutoOp>();
		
		AutoOpVector.add(newAutoOp);
		OnChangeVectorAutoLatch(); //TODO: AutoOpVector auria de ser una classe amb OnChangeVectorAutoLatch
	}
  
	private static void newAutoOp(Activity a){
		newAutoOp();
		((AutoLatchCreatorActivity)a).AutoLatchCreated();
	}
  
	public static void newAutoOpSettings(final Activity a){
		final EditText et = new EditText(a.getApplicationContext());
		new AlertDialog.Builder(a).setTitle(a.getString(R.string.alp_pref_name)).setMessage(R.string.alp_pref_name_desc).setView(et).setPositiveButton("Ok", new DialogInterface.OnClickListener(){
			public void onClick(DialogInterface dialog, int which){
				StaticData.newAutoOp.name = et.getText().toString();
				StaticData.newAutoOpSettingsOperation(a);
			}
		}).show();
	}
	
	private static void newAutoOpSettingsEvent(final Activity a){
		final int[] EventValues = { AutoOp.E_IN, AutoOp.E_OUT };
		final CharSequence[] EventDesc = {a.getString(R.string.alp_pref_Event_desc_Entrar), a.getString(R.string.alp_pref_Event_desc_Salir) };
		CreateChoiceDialog(a, a.getString(R.string.alp_pref_Event_title), EventDesc, new DialogInterface.OnClickListener(){
			public void onClick(DialogInterface dialog, int which){
				dialog.cancel();
				StaticData.newAutoOp.Event = EventValues[which];
				StaticData.newAutoOp(a);
			}
		});
	}
	
	private static void newAutoOpSettingsOperation(final Activity a){
		final int[] OpValues = { AutoOp.OP_LOCK, AutoOp.OP_UNLOCK, AutoOp.OP_BOTH };
		final CharSequence[] OpDesc = {a.getString(R.string.alp_pref_Op_desc_Bloq), a.getString(R.string.alp_pref_Op_desc_Desbloq), a.getString(R.string.alp_pref_Op_desc_both)};
		
		CreateChoiceDialog(a, a.getString(R.string.alp_pref_Op_title), OpDesc, new DialogInterface.OnClickListener(){
			public void onClick(DialogInterface dialog, int which){
				dialog.cancel();
				StaticData.newAutoOp.Operation = OpValues[which];
				if(OpValues[which] != AutoOp.OP_BOTH){
					StaticData.newAutoOpSettingsEvent(a);
					return;
				}
				StaticData.newAutoOp(a);
			}
		});
	}
	
	public static void newGpsEvent(Location location){
		Vector<AutoOp> vAOgps = getAutoOpVector(AutoOp.Type_GPS);
		for(AutoOp ao:vAOgps) ((AutoOpGPS)ao).newEvent(location);
	}
	
	public static void newWifiEvent(Context context, Intent intent){
		Vector<AutoOp> vAOW = getAutoOpVector(AutoOp.Type_Wifi);
		for(AutoOp ao:vAOW) ((AutoOpWifi)ao).newEvent(context, intent);
	}
	
	private static void putString(String key, String value){
		editor.putString(key, value);
		editor.commit();
	}
	
	public static void receiveData(String data){ setOperations(data); }
	
	private static void setOperations(String operationsJSON){
		try{
			JSONObject jsonOps = new JSONObject(operationsJSON);
			if((jsonOps.has("data")) && (!jsonOps.isNull("data")) && (jsonOps.getJSONObject("data").has("operations"))){
				operations = new ArrayList<Operation>();
				setOperations(jsonOps.getJSONObject("data").getJSONObject("operations"), null);
			}
		}catch (JSONException e){ e.printStackTrace(); }
	}
	
	public static void setOperations(JSONObject opJSON, Operation parent){
		try{
			for(Iterator<String> keys = opJSON.keys(); keys.hasNext();){
				String str = keys.next();
				JSONObject opDesc = opJSON.getJSONObject(str);
				Operation op = new Operation(str, opDesc, parent);
				operations.add(op);
				if (!opDesc.isNull("operations")) {
					setOperations(opDesc.getJSONObject("operations"), op);
				}
			}
		}catch (JSONException e){ e.printStackTrace(); }
	}
	
	private static void setVectorAutoLatch(String AutoLatchsJSON){
		try{
			AutoOpVector = new Vector<AutoOp>();
			JSONArray aoJSON = new JSONArray(AutoLatchsJSON);
			for(int i=0;i<aoJSON.length(); i++) AutoOpVector.add(AutoOp.fromJSON(aoJSON.getJSONObject(i).toString()));
		}
		catch (JSONException e){ e.printStackTrace(); }
	}
}