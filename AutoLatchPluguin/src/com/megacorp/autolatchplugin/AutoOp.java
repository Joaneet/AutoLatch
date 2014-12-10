package com.megacorp.autolatchplugin;

import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public abstract class AutoOp{	
	public static final int E_IN = 1;
	public static final int E_NONE = 0;
	public static final int E_OUT = 2;
	protected static final String EventDescJSONKey = "EventDesc";
	protected static final String EventEqualJSONKey = "EventEqual";
	protected static final String EventJSONKey = "Event";
	protected static final String NameJSONKey = "Name";
	public static final int OP_BOTH = 3;
	public static final int OP_LOCK = 1;
	public static final int OP_NONE = 0;
	public static final int OP_UNLOCK = 2;
	protected static final String OperationJSONKey = "Operation";
	protected static final String OperationsJSONKey = "Operations";
	protected static final String TypeJSONKey = "Type";
	public static final int Type_GPS = 2;
	public static final int Type_New = -1;
	public static final int Type_Wifi = 1;
	
	public String name;
	public int Event;
	public int Operation;
	protected ArrayList<String> Operations;
	
	private EventEqual eventequal;
	class EventEqual{
		private boolean b;    
		public EventEqual(boolean paramBoolean){ b = paramBoolean; }    
		public boolean get(){ return b; }    
		public void set(boolean n){
			b = n;
			StaticData.OnChangeVectorAutoLatch();
		}
	}
	
	public void Init(){
		this.eventequal = new EventEqual(false);
	
	}
	
	public AutoOp(){
		Init();
		this.Operations = new ArrayList<String>();
	}
  
	public AutoOp(String strJSON){
		Init();
		try{
			JSONObject jsonObj = new JSONObject(strJSON);
			name = jsonObj.getString(NameJSONKey);
			JSONArray jsonOperations = new JSONArray(jsonObj.get(OperationsJSONKey).toString());
			
			Operations = new ArrayList<String>();
			for(int i=0;i<jsonOperations.length(); i++) Operations.add(jsonOperations.get(i).toString());
			
			Event = jsonObj.getInt(EventJSONKey);
			Operation = jsonObj.getInt(OperationJSONKey);
			eventequal = new EventEqual(jsonObj.getBoolean(EventEqualJSONKey));
		}catch (JSONException e){ e.printStackTrace(); }
	}
  
	public AutoOp(ArrayList<String> operations){
		Init();
		this.Operations = operations;
	}
  
	public static AutoOp fromJSON(String json){
		try{
			switch (new JSONObject(json).getInt("Type")){
				case Type_Wifi: 
					return new AutoOpWifi(json);
				case Type_GPS:
					return new AutoOpGPS(json);				
			}
		}catch (JSONException e){ e.printStackTrace(); }
		return null;
	}
  
	private String private_toJSON(){
		try{
			JSONObject jsonResult = new JSONObject();
			jsonResult.put(NameJSONKey, name);
			jsonResult.put(OperationsJSONKey, new JSONArray(Operations));
			jsonResult.put(EventJSONKey, Event);
			jsonResult.put(EventEqualJSONKey, eventequal.get());
			jsonResult.put(OperationJSONKey, Operation);
			jsonResult.put(TypeJSONKey, getType());			
			return jsonResult.toString();
		}catch (JSONException e){ e.printStackTrace(); }
		return "{}";
  }
  
	private void trigger(){
		if(((eventequal.get()) && (Event==E_IN)) || (Operation==OP_BOTH) || ((!eventequal.get()) && (Event==E_OUT))){
			boolean onoff = Operation==OP_BOTH?eventequal.get():Operation!=OP_LOCK;			
			for(String op:Operations) Modificator.ModifyOperation(op, onoff);	 
		}
	}  
  
	public void addOperation(String OperationID){ if(!Operations.contains(OperationID)) this.Operations.add(OperationID); }
  
  	public void addOperation(String OperationID, boolean addremove){
  		if(addremove){
  			addOperation(OperationID);
  			return;
  		}
  		removeOperation(OperationID);
  	}
  
  	abstract public int getType();
  
  	public boolean hasOperations(){ return Operations.size() > 0; }
  
  	protected void newEvent(Boolean eventequal){
  		if(eventequal!=null && this.eventequal.get() != eventequal){
  			this.eventequal.set(eventequal);
  			trigger();
  		}
  	}
  
  	public boolean removeOperation(String paramString){ return this.Operations.remove(paramString); }
  
  	public String toJSON(){ return private_toJSON(); }
  
	protected String toJSONDesc(JSONObject jsonObj){
		try{
			JSONObject jsonresult = new JSONObject(private_toJSON());
			jsonresult.put(EventDescJSONKey, jsonObj);
			return jsonresult.toString();
		}catch(JSONException e){ e.printStackTrace(); }
		return "{}";
	}
}