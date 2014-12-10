package com.megacorp.autolatchplugin;

import android.opengl.Visibility;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ListView;

import java.util.ArrayList;

import com.megacorp.autolatchpluguin.R;

public class SelOperationsActivity extends AutoLatchCreatorActivity{
	Button btnAddEvent;
  
	protected void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.alp_seloperation);
		setTitle(R.string.alp_ListOperationsTitle);
		
		btnAddEvent = ((Button)findViewById(R.id.alp_addEvent));
		if(StaticData.operations!=null){
			ArrayList<Operation> alo = new ArrayList<Operation>();
			for(int i=0;i<StaticData.operations.size();i++)
				if(!StaticData.operations.get(i).name.equals(""))
					alo.add(StaticData.operations.get(i));
			AutoAppElement adapter = new AutoAppElement(this, alo, true, true);
			((ListView)findViewById(R.id.d_listview)).setAdapter(adapter);
						
			OperationClick();
			btnAddEvent.setOnClickListener(new OnClickListener() {				
				@Override
				public void onClick(View v) {
					StartAutoLatchCreatorActivity(SelEventActivity.class);
				}
			});
		}else btnAddEvent.setVisibility(View.GONE);
	}
  
	public boolean onCreateOptionsMenu(Menu menu){
		getMenuInflater().inflate(R.menu.d_main, menu);
		return true;
	}
  
	public void OperationClick(){
		btnAddEvent.setVisibility(StaticData.newAutoOp.hasOperations()?View.VISIBLE:View.GONE);
	}
}