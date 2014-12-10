package com.megacorp.autolatchplugin;
import com.megacorp.autolatchpluguin.R;

import android.app.Activity;
import android.content.Intent;

public abstract class AutoLatchCreatorActivity extends Activity{
	static final int REQ_CODE_AutoLatchCreatorActivity = 987;
  
	public void AutoLatchCreated(){
		setResult(RESULT_OK, new Intent());
		finish();
	}
  
	public void StartAutoLatchCreatorActivity(Class<?> autolatchcreatoractivitu){
		startActivityForResult(new Intent(getApplicationContext(), autolatchcreatoractivitu), REQ_CODE_AutoLatchCreatorActivity);
	}
  
	protected void onActivityResult(int requestCode, int resultCode, Intent data){
		if ((requestCode == REQ_CODE_AutoLatchCreatorActivity) && (resultCode == RESULT_OK)) {
			AutoLatchCreated();
		}
	}
}