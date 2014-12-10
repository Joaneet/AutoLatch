package com.megacorp.autolatchplugin;

import org.json.JSONException;
import org.json.JSONObject;

class Operation{
	public String id;
	public String imageURL;
	public String name;
	public Operation parent;
	public String status;
  
	public Operation(String id, JSONObject jsonObj, Operation parent){
		try{
			this.parent = parent;
			this.id = id;
			this.status = getValue(jsonObj, "status", "");
			this.name = getValue(jsonObj, "name", "");
			this.imageURL = getValue(jsonObj, "imageURL", null);
		}catch (JSONException e){
			e.printStackTrace();
		}
	}
  
	private String getValue(JSONObject jsonObj, String key, String defVal) throws JSONException{
		if(jsonObj.has(key)) defVal = jsonObj.getString(key);
		return defVal;
	}
  
	public int numParents(){
		if(parent != null) return 1 + parent.numParents();
    	return 0;
	}
}