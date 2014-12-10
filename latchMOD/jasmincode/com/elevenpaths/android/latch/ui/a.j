.bytecode 50.0
.class public synchronized com/elevenpaths/android/latch/ui/a
.super java/lang/Object

.method public static a(Landroid/app/Activity;)Lcom/jeremyfeinstein/slidingmenu/lib/SlidingMenu;
new com/jeremyfeinstein/slidingmenu/lib/SlidingMenu
dup
aload 0
invokespecial com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/<init>(Landroid/content/Context;)V
astore 1
aload 1
ldc_w 2130903100
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/setMenu(I)V
aload 1
iconst_2
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/setTouchModeAbove(I)V
aload 1
iconst_1
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/setMode(I)V
aload 1
aload 0
invokevirtual android/app/Activity/getResources()Landroid/content/res/Resources;
ldc_w 2131230888
invokevirtual android/content/res/Resources/getDimensionPixelSize(I)I
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/setBehindOffset(I)V
aload 1
iconst_1
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/setFadeEnabled(Z)V
aload 1
ldc_w 0.8F
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/setFadeDegree(F)V
aload 1
ldc_w 2130837687
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/setShadowDrawable(I)V
aload 1
ldc_w 2131230899
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/setShadowWidthRes(I)V
aload 1
ldc_w 2131099938
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/findViewById(I)Landroid/view/View;
checkcast android/widget/TextView
ldc "fonts/fs_joey_medium.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/TextView;Ljava/lang/String;)V
aload 1
ldc_w 2131099946
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/findViewById(I)Landroid/view/View;
checkcast android/widget/TextView
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/TextView;Ljava/lang/String;)V
aload 1
ldc_w 2131099947
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/findViewById(I)Landroid/view/View;
checkcast android/widget/TextView
astore 2
aload 2
invokestatic com/elevenpaths/android/latch/g/a/b()Ljava/lang/String;
invokevirtual android/widget/TextView/setText(Ljava/lang/CharSequence;)V
aload 2
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/TextView;Ljava/lang/String;)V
aload 1
ldc_w 2131099939
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/findViewById(I)Landroid/view/View;
checkcast android/widget/Button
astore 3
aload 3
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/Button;Ljava/lang/String;)V
aload 3
new com/elevenpaths/android/latch/ui/b
dup
aload 0
invokespecial com/elevenpaths/android/latch/ui/b/<init>(Landroid/app/Activity;)V
invokevirtual android/widget/Button/setOnClickListener(Landroid/view/View$OnClickListener;)V
aload 1
ldc_w 2131099940
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/findViewById(I)Landroid/view/View;
checkcast android/widget/Button
astore 4
aload 4
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/Button;Ljava/lang/String;)V
aload 4
new com/elevenpaths/android/latch/ui/c
dup
aload 0
invokespecial com/elevenpaths/android/latch/ui/c/<init>(Landroid/app/Activity;)V
invokevirtual android/widget/Button/setOnClickListener(Landroid/view/View$OnClickListener;)V
aload 1
ldc_w 2131099943
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/findViewById(I)Landroid/view/View;
checkcast android/widget/Button
astore 5
aload 5
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/Button;Ljava/lang/String;)V
aload 5
new com/elevenpaths/android/latch/ui/d
dup
aload 0
invokespecial com/elevenpaths/android/latch/ui/d/<init>(Landroid/app/Activity;)V
invokevirtual android/widget/Button/setOnClickListener(Landroid/view/View$OnClickListener;)V
aload 1
ldc_w 2131099941
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/findViewById(I)Landroid/view/View;
checkcast android/widget/Button
astore 6
aload 6
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/Button;Ljava/lang/String;)V
aload 6
new com/elevenpaths/android/latch/ui/e
dup
aload 0
invokespecial com/elevenpaths/android/latch/ui/e/<init>(Landroid/app/Activity;)V
invokevirtual android/widget/Button/setOnClickListener(Landroid/view/View$OnClickListener;)V
aload 1
ldc_w 2131099942
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/findViewById(I)Landroid/view/View;
checkcast android/widget/Button
astore 7
aload 7
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/Button;Ljava/lang/String;)V
aload 7
new com/elevenpaths/android/latch/ui/f
dup
aload 0
invokespecial com/elevenpaths/android/latch/ui/f/<init>(Landroid/app/Activity;)V
invokevirtual android/widget/Button/setOnClickListener(Landroid/view/View$OnClickListener;)V
aload 1
ldc_w 2131099944
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/findViewById(I)Landroid/view/View;
checkcast android/widget/Button
astore 8
aload 8
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/Button;Ljava/lang/String;)V
aload 8
new com/elevenpaths/android/latch/ui/g
dup
aload 0
invokespecial com/elevenpaths/android/latch/ui/g/<init>(Landroid/app/Activity;)V
invokevirtual android/widget/Button/setOnClickListener(Landroid/view/View$OnClickListener;)V
aload 1
ldc_w 2131099948
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/findViewById(I)Landroid/view/View;
checkcast android/widget/Button
astore 9
aload 9
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/Button;Ljava/lang/String;)V
aload 9
new com/elevenpaths/android/latch/ui/h
dup
aload 0
invokespecial com/elevenpaths/android/latch/ui/h/<init>(Landroid/app/Activity;)V
invokevirtual android/widget/Button/setOnClickListener(Landroid/view/View$OnClickListener;)V

;Modificator.SetMenuBotton(this, localSlidingMenu);
aload 0
aload 1	
invokestatic com/megacorp/autolatchplugin/Modificator/SetMenuBotton(Landroid/app/Activity;Landroid/view/View;)V

aload 1
areturn
.limit locals 10
.limit stack 4
.end method
