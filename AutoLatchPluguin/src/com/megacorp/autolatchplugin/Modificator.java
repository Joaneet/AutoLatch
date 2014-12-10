package com.megacorp.autolatchplugin;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.AlertDialog.Builder;
import android.content.DialogInterface;
import android.content.DialogInterface.OnClickListener;
import android.view.View;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Vector;

import com.megacorp.autolatchpluguin.R;

public class Modificator{
	public static void ModifyOperation(String operation, boolean onoff){
		//Writer.Write("ModifyOperation " + operation + " " + onoff + "\n");
		try{
			Object objclass1 = Class.forName("com.elevenpaths.android.latch.LatchApplication").getMethod("d", new Class[0]).invoke(null, null);
			Object objclass2 = objclass1.getClass().getMethod("a", new Class[0]).invoke(objclass1, null);
			Class class1 = Class.forName("com.elevenpaths.android.latch.c.d");
      
			Field field;
			if(onoff)	field = class1.getField("a");
			else		field = class1.getField("b"); 
			
			objclass2.getClass().getMethod("a", String.class, field.get(null).getClass()).invoke(objclass2, operation, field.get(null));
		}catch(Exception e){}
	}
    /*
Writer.Write("ModifyOperation " + operation + " " + onoff + "\n");
    try
    {
      Object localObject1 = Class.forName("com.elevenpaths.android.latch.LatchApplication").getMethod("d", new Class[0]).invoke(null, null);
      Object localObject2 = localObject1.getClass().getMethod("a", new Class[0]).invoke(localObject1, null);
      Class localClass1 = Class.forName("com.elevenpaths.android.latch.c.d");
      if (onoff) {}
      Field localField;
      for (Object localObject3 = localClass1.getField("a");; localObject3 = localField)
      {
        Class localClass2 = localObject2.getClass();
        Class[] arrayOfClass = new Class[2];
        arrayOfClass[0] = String.class;
        arrayOfClass[1] = ((Field)localObject3).get(null).getClass();
        Method localMethod = localClass2.getMethod("a", arrayOfClass);
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = operation;
        arrayOfObject[1] = ((Field)localObject3).get(null);
        localMethod.invoke(localObject2, arrayOfObject);
        return;
        localField = localClass1.getField("b");
      }
      return;
    }
    catch (NoSuchMethodException localNoSuchMethodException)
    {
      Writer.Write("NoSuchMethodException\n");
      localNoSuchMethodException.printStackTrace();
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      Writer.Write("IllegalArgumentException\n");
      localIllegalArgumentException.printStackTrace();
      return;
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      Writer.Write("IllegalAccessException\n");
      localIllegalAccessException.printStackTrace();
      return;
    }
    catch (InvocationTargetException localInvocationTargetException)
    {
      Writer.Write("InvocationTargetException\n");
      localInvocationTargetException.printStackTrace();
      return;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      Writer.Write("ClassNotFoundException\n");
      localClassNotFoundException.printStackTrace();
      return;
    }
    catch (NoSuchFieldException localNoSuchFieldException)
    {
      Writer.Write("NoSuchFieldException\n");
      localNoSuchFieldException.printStackTrace();
    } 
    */
  
	public static void SetMenuBotton(final Activity activity, View view){
		view.findViewById(R.id.alp_menuAutoLatch).setOnClickListener(new View.OnClickListener(){
			public void onClick(View v){
				if((StaticData.AutoOpVector != null) && (StaticData.AutoOpVector.size() > 0)){
					new AlertDialog.Builder(activity).setTitle(R.string.alp_AutoLatchMenuChossTitle).setMessage(R.string.alp_AutoLatchMenuChoss).setNeutralButton(activity.getString(R.string.alp_AutoLatchMenuCreateBtn), new OnClickListener(){
						@Override
						public void onClick(DialogInterface dialog, int witch){
							StaticData.StartAutoLatchCreate(activity);
						}
					}).setPositiveButton(activity.getString(R.string.alp_AutoLatchMenuViewBtn), new OnClickListener(){
						@Override
						public void onClick(DialogInterface dialog, int witch){
							StaticData.StartViewAutoLatch(activity);
						}
					}).show();
					return;
				}
				StaticData.StartAutoLatchCreate(activity);
			}
		});
	}
}