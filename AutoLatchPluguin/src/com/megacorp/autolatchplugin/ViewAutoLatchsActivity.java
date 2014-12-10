package com.megacorp.autolatchplugin;

import android.app.Activity;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.ListView;

import java.util.ArrayList;
import java.util.Vector;

import com.megacorp.autolatchpluguin.R;

public class ViewAutoLatchsActivity extends Activity{
	Button btnDelete;
	Vector<AutoOp> vAutoOpSel;
  
	protected void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.alp_viewautolatch);
		setTitle(R.string.alp_ViewAutolatchTitle);
		setList();
		this.btnDelete = ((Button)findViewById(R.id.alp_delAutoLatch));
		this.btnDelete.setVisibility(View.GONE);
		this.btnDelete.setOnClickListener(new View.OnClickListener(){
			public void onClick(View paramAnonymousView){
				StaticData.delAutoOps(vAutoOpSel);
				setList();
			}
		});
	}
  
	public boolean onCreateOptionsMenu(Menu menu){
		getMenuInflater().inflate(R.menu.d_main, menu);
		return true;
	}
  
	private void setList(){
		this.vAutoOpSel = new Vector<AutoOp>();
		AutoLatchElement ale = new AutoLatchElement(this, new ArrayList(StaticData.AutoOpVector), true, true);
		((ListView)findViewById(R.id.d_listview)).setAdapter(ale);
	}
  
	public void AutoLatchClick(AutoOp autoop){
		if(vAutoOpSel.contains(autoop))	vAutoOpSel.remove(autoop);
		else						   	vAutoOpSel.add(autoop);			
		
		btnDelete.setVisibility(vAutoOpSel.size()>0?View.VISIBLE:View.GONE);
	}  
}