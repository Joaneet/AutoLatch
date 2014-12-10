package com.megacorp.autolatchplugin;

import android.app.Activity;
import android.graphics.Typeface;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.util.ArrayList;

public class AutoAppElement extends SimpleListElement{
	public AutoAppElement(Activity activity, ArrayList list, boolean b1, boolean b2){
		super(activity, list, b1, b2);
	}
  
	public View getView(final int numElement, View view, ViewGroup viewGroup){
		view = super.getView(numElement, view, viewGroup);
		SimpleListElement.ViewElements viewElements = (SimpleListElement.ViewElements)view.getTag();
		final RelativeLayout rlRow = viewElements.alp_ApplicationElementLayout;
		final Operation op = (Operation)list.get(numElement);
		
		String str = "";
		for(int i=op.numParents();i>0;i--) str+="     ";
		viewElements.row_name.setText(str + "--->" + op.name);
		
		viewElements.row_name.setTypeface(Typeface.createFromAsset(activity.getAssets(), "fonts/roboto_light.ttf"));
		SelElement[numElement] = StaticData.newAutoOp.Operations.contains(op.id);
		Selected(SelElement[numElement], rlRow);
		view.setOnClickListener(new View.OnClickListener(){
			public void onClick(View paramAnonymousView){
				SelElement[numElement]=!SelElement[numElement];
				StaticData.newAutoOp.addOperation(op.id, SelElement[numElement]);
				((SelOperationsActivity)activity).OperationClick();
				Selected(SelElement[numElement], rlRow);
			}
		});
		return view;
	}
}