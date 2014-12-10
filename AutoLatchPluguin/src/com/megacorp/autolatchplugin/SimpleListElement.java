package com.megacorp.autolatchplugin;

import android.app.Activity;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.GradientDrawable.Orientation;
import android.graphics.drawable.TransitionDrawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import java.util.ArrayList;

import com.megacorp.autolatchpluguin.R;

public class SimpleListElement extends ArrayAdapter{
	protected boolean[] SelElement;
	protected Activity activity;
	protected Boolean d;
	protected boolean e;
	protected ArrayList list;
  
	public SimpleListElement(Activity activity, ArrayList list, boolean b1, boolean b2){
		super(activity.getBaseContext(), R.layout.d_listrow, list);
		this.list = list;
		this.activity = activity;
		this.d = b1;
		this.e = b2;
		this.SelElement = new boolean[list.size()];
		for(int i=0;i<list.size(); i++) SelElement[i] = false;
	}
  
	protected void Selected(boolean Selected, RelativeLayout view){
		if(Selected){
			GradientDrawable gIni = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[] { -15100754, -15911100 });
			gIni.setCornerRadius(3.0F);
			GradientDrawable gFi = new GradientDrawable(GradientDrawable.Orientation.TOP_BOTTOM, new int[] { -870738770, -871549116 });
			gFi.setCornerRadius(3.0F);
			TransitionDrawable transition = new TransitionDrawable(new Drawable[] { gIni, gFi });
			view.setBackgroundDrawable(transition);
			transition.setCrossFadeEnabled(true);
			animateBackground(transition, true, view);
			return;
		}
		view.setBackgroundResource(R.color.list_background);
	}
  
	protected static void animateBackground(final TransitionDrawable drawable, final boolean forward, final View view){
		final int HIGHLIGHT_CYCLE = 5000;
		
	    if(view.getBackground() != drawable) return;

	    if(forward) drawable.startTransition(HIGHLIGHT_CYCLE / 2);
	    else		drawable.reverseTransition(HIGHLIGHT_CYCLE / 2);

	    view.postDelayed(new Runnable() {
	        @Override
	        public void run() {
	            animateBackground(drawable, !forward, view);
	        }
	    }, HIGHLIGHT_CYCLE / 2);
	    view.refreshDrawableState();
	}
  
	public View getView(int numElement, View view, ViewGroup viewgroup){
		if(view == null){
			view = this.activity.getLayoutInflater().inflate(R.layout.alp_aplicationelement, null);
			ViewElements localViewElements = new ViewElements();
			localViewElements.row_name = ((TextView)view.findViewById(R.id.row_name));
			localViewElements.alp_ApplicationElementLayout = ((RelativeLayout)view.findViewById(R.id.alp_ApplicationElementLayout));
			localViewElements.row_icon = ((ImageView)view.findViewById(R.id.row_icon));
			localViewElements.row_child_modified = ((ImageView)view.findViewById(R.id.row_child_modified));
			localViewElements.row_satellite = ((ImageView)view.findViewById(R.id.row_satellite));
			localViewElements.row_enabled = ((RelativeLayout)view.findViewById(R.id.row_enabled));
			localViewElements.row_status_box = ((RelativeLayout)view.findViewById(R.id.row_status_box));
			view.setVisibility(View.VISIBLE);
			localViewElements.row_name.setVisibility(View.VISIBLE);
			localViewElements.row_icon.setVisibility(View.VISIBLE);
			localViewElements.row_child_modified.setVisibility(View.VISIBLE);
			localViewElements.row_satellite.setVisibility(View.VISIBLE);
    		localViewElements.row_enabled.setVisibility(View.VISIBLE);
    		view.setTag(localViewElements);
    	}
		return view;
	}
  
	protected class ViewElements{
		RelativeLayout alp_ApplicationElementLayout;
		ImageView row_child_modified;
		RelativeLayout row_enabled;
		ImageView row_icon;
		TextView row_name;
		ImageView row_satellite;
		RelativeLayout row_status_box;
	}
}