package com.megacorp.autolatchplugin;

import android.app.Activity;
import android.graphics.Typeface;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.util.ArrayList;

public class AutoLatchElement extends SimpleListElement{
	public AutoLatchElement(Activity activity, ArrayList list, boolean b1, boolean b2){
	  super(activity, list, b1, b2);
  	}
  
	public View getView(final int numElement, View view, ViewGroup viewgroup){
		view = super.getView(numElement, view, viewgroup);
		ViewElements elements = (ViewElements)view.getTag();
		final RelativeLayout rowLayout = elements.alp_ApplicationElementLayout;
		final AutoOp ao = (AutoOp)list.get(numElement);
		elements.row_name.setText(ao.name);
		elements.row_name.setTypeface(Typeface.createFromAsset(activity.getAssets(), "fonts/roboto_light.ttf"));
		SelElement[numElement] = false;
		Selected(false, rowLayout);
		view.setOnClickListener(new View.OnClickListener(){
			public void onClick(View view){
				SelElement[numElement] = !SelElement[numElement];
				((ViewAutoLatchsActivity)activity).AutoLatchClick(ao);
				Selected(SelElement[numElement], rowLayout);
			}
    	});
		return view;
	}
}