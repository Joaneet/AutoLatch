package com.megacorp.autolatchplugin;

import android.location.Location;
import java.io.PrintStream;
import org.json.JSONException;
import org.json.JSONObject;

public class AutoOpGPS extends AutoOp{
	protected static final String EventDescLatJSONKey = "latitude";
	protected static final String EventDescLongJSONKey = "longitude";
	protected static final String EventDescRadiJSONKey = "radi";
	Location location;
	int radi;
  
	public AutoOpGPS(AutoOp autoop, Location location, int radi){
		super(autoop.Operations);
		this.location = new Location(location);
		this.radi = radi;
	}
  
	public AutoOpGPS(String json){
		super(json);
		try{
			JSONObject jsonObj = new JSONObject(json).getJSONObject(AutoOp.EventDescJSONKey);
			this.location = new Location("");
			this.location.setLatitude(jsonObj.getDouble(EventDescLatJSONKey));
			this.location.setLongitude(jsonObj.getDouble(EventDescLongJSONKey));
			this.radi = jsonObj.getInt(EventDescRadiJSONKey);
		}catch (JSONException e){ e.printStackTrace(); }
	}
  
	private boolean private_newEvent(Location location){ return Dist(location, this.location) <= this.radi; }
  
	public double Dist(Location location1, Location location2){
		int i = (int)(100000.0D * location1.getLatitude());
		int j = (int)(100000.0D * location1.getLongitude());
		int k = (int)(100000.0D * location2.getLatitude());
		int m = (int)(100000.0D * location2.getLongitude());
		return Math.sqrt(Math.pow(i - k, 2.0D) + Math.pow(j - m, 2.0D));
  	}
  
	public int getType(){ return AutoOp.Type_GPS; }
  
	public void newEvent(Location location){ newEvent(private_newEvent(location)); }
  
	public String toJSON(){
		try{
			JSONObject jsonresult = new JSONObject();
			jsonresult.put(EventDescLatJSONKey, location.getLatitude());
			jsonresult.put(EventDescLongJSONKey, location.getLongitude());
			jsonresult.put(EventDescRadiJSONKey, radi);
			return toJSONDesc(jsonresult);
		}catch(JSONException e){ e.printStackTrace(); }
		return "{}";
	}	
}