.bytecode 50.0
.class public synchronized com/elevenpaths/android/latch/activities/D_Dashboard
.super android/support/v7/a/f
.implements java/util/Observer

.field private 'o' Lcom/mobeta/android/dslv/DragSortListView;

.field private 'p' Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;

.field private 'q' Ljava/util/ArrayList;

.field private 'r' Landroid/support/v4/widget/SwipeRefreshLayout;

.field private 's' Lcom/jeremyfeinstein/slidingmenu/lib/SlidingMenu;

.method public <init>()V
aload 0
invokespecial android/support/v7/a/f/<init>()V
return
.limit locals 1
.limit stack 1
.end method

.method static synthetic a(Lcom/elevenpaths/android/latch/activities/D_Dashboard;)Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/p Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;
areturn
.limit locals 1
.limit stack 1
.end method

.method static synthetic b(Lcom/elevenpaths/android/latch/activities/D_Dashboard;)Landroid/support/v4/widget/SwipeRefreshLayout;
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/r Landroid/support/v4/widget/SwipeRefreshLayout;
areturn
.limit locals 1
.limit stack 1
.end method

.method private b(I)V
aload 0
ldc_w 2131099866
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast android/widget/LinearLayout
iload 1
invokevirtual android/widget/LinearLayout/setVisibility(I)V
return
.limit locals 2
.limit stack 2
.end method

.method static synthetic c(Lcom/elevenpaths/android/latch/activities/D_Dashboard;)Lcom/mobeta/android/dslv/DragSortListView;
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/o Lcom/mobeta/android/dslv/DragSortListView;
areturn
.limit locals 1
.limit stack 1
.end method

.method public b(Z)V
iconst_1
istore 2
aload 0
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/a()Lcom/elevenpaths/android/latch/f/a;
ldc "ROOT"
iload 2
invokevirtual com/elevenpaths/android/latch/f/a/a(Ljava/lang/String;Z)Ljava/util/ArrayList;
putfield com/elevenpaths/android/latch/activities/D_Dashboard/q Ljava/util/ArrayList;
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/a()Lcom/elevenpaths/android/latch/f/a;
ldc "Ash0Latch1Durbatuluk"
invokevirtual com/elevenpaths/android/latch/f/a/a(Ljava/lang/String;)Lcom/elevenpaths/android/latch/c/a;
astore 3
aload 3
ifnonnull L0
new com/elevenpaths/android/latch/c/a
dup
ldc "Ash0Latch1Durbatuluk"
ldc "ROOT"
invokespecial com/elevenpaths/android/latch/c/a/<init>(Ljava/lang/String;Ljava/lang/String;)V
astore 4
aload 4
getstatic com/elevenpaths/android/latch/c/d/a Lcom/elevenpaths/android/latch/c/d;
invokevirtual com/elevenpaths/android/latch/c/a/a(Lcom/elevenpaths/android/latch/c/d;)V
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/a()Lcom/elevenpaths/android/latch/f/a;
aload 4
invokevirtual com/elevenpaths/android/latch/f/a/a(Lcom/elevenpaths/android/latch/c/a;)V
aload 4
astore 5
L1:
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/q Ljava/util/ArrayList;
invokevirtual java/util/ArrayList/iterator()Ljava/util/Iterator;
astore 6
iconst_0
istore 7
L2:
aload 6
invokeinterface java/util/Iterator/hasNext()Z 0
ifeq L3
aload 6
invokeinterface java/util/Iterator/next()Ljava/lang/Object; 0
checkcast com/elevenpaths/android/latch/c/a
astore 13
aload 13
invokevirtual com/elevenpaths/android/latch/c/a/z()Z
ifne L4
aload 13
invokevirtual com/elevenpaths/android/latch/c/a/A()Z
ifeq L5
L4:
iload 2
istore 14
L6:
iload 14
istore 7
goto L2
L3:
iload 1
ifeq L7
aload 0
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/g()V
aload 0
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/h()V
getstatic android/os/Build$VERSION/SDK_INT I
bipush 11
if_icmplt L8
aload 0
ldc_w 2131099864
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast com/elevenpaths/android/latch/ui/Latchon
aload 5
invokevirtual com/elevenpaths/android/latch/c/a/c()Lcom/elevenpaths/android/latch/c/e;
invokevirtual com/elevenpaths/android/latch/ui/Latchon/setStatus(Lcom/elevenpaths/android/latch/c/e;)V
L9:
aload 0
ldc_w 2131099864
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
astore 8
aload 0
ldc_w 2131099870
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast android/widget/LinearLayout
astore 9
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/q Ljava/util/ArrayList;
ifnull L10
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/q Ljava/util/ArrayList;
invokevirtual java/util/ArrayList/isEmpty()Z
ifeq L10
aload 0
iconst_0
invokespecial com/elevenpaths/android/latch/activities/D_Dashboard/b(I)V
aload 8
bipush 8
invokevirtual android/view/View/setVisibility(I)V
aload 9
bipush 8
invokevirtual android/widget/LinearLayout/setVisibility(I)V
L11:
aload 0
ldc_w 2131099950
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast android/widget/LinearLayout
astore 10
iload 7
ifeq L12
invokestatic com/elevenpaths/android/latch/h/c/c()Z
ifne L12
aload 10
iconst_0
invokevirtual android/widget/LinearLayout/setVisibility(I)V
aload 0
ldc_w 2131099952
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast android/widget/ImageButton
new com/elevenpaths/android/latch/activities/ak
dup
aload 0
aload 10
invokespecial com/elevenpaths/android/latch/activities/ak/<init>(Lcom/elevenpaths/android/latch/activities/D_Dashboard;Landroid/widget/LinearLayout;)V
invokevirtual android/widget/ImageButton/setOnClickListener(Landroid/view/View$OnClickListener;)V
L13:
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/a()Lcom/elevenpaths/android/latch/f/a;
invokevirtual com/elevenpaths/android/latch/f/a/c()Lcom/elevenpaths/android/latch/f/d;
invokevirtual com/elevenpaths/android/latch/f/d/c()Ljava/lang/Boolean;
astore 11
aload 11
getstatic com/elevenpaths/android/latch/f/d/b Ljava/lang/Boolean;
if_acmpne L14
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/p Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;
bipush 8
invokevirtual fr/castorflex/android/smoothprogressbar/SmoothProgressBar/setVisibility(I)V
L15:
return
L8:
aload 0
ldc_w 2131099864
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast com/elevenpaths/android/latch/ui/SectionLockAll
astore 12
aload 5
invokevirtual com/elevenpaths/android/latch/c/a/c()Lcom/elevenpaths/android/latch/c/e;
getstatic com/elevenpaths/android/latch/c/e/a Lcom/elevenpaths/android/latch/c/e;
if_acmpne L16
L17:
aload 12
iload 2
invokevirtual com/elevenpaths/android/latch/ui/SectionLockAll/setSwitch(Z)V
goto L9
L16:
iconst_0
istore 2
goto L17
L7:
aload 5
invokevirtual com/elevenpaths/android/latch/c/a/c()Lcom/elevenpaths/android/latch/c/e;
getstatic com/elevenpaths/android/latch/c/e/b Lcom/elevenpaths/android/latch/c/e;
if_acmpne L9
aload 0
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/g()V
aload 0
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/h()V
goto L9
L10:
aload 0
bipush 8
invokespecial com/elevenpaths/android/latch/activities/D_Dashboard/b(I)V
aload 8
iconst_0
invokevirtual android/view/View/setVisibility(I)V
aload 9
iconst_0
invokevirtual android/widget/LinearLayout/setVisibility(I)V
goto L11
L12:
aload 10
bipush 8
invokevirtual android/widget/LinearLayout/setVisibility(I)V
goto L13
L14:
aload 11
getstatic com/elevenpaths/android/latch/f/d/a Ljava/lang/Boolean;
if_acmpne L15
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/r Landroid/support/v4/widget/SwipeRefreshLayout;
invokevirtual android/support/v4/widget/SwipeRefreshLayout/a()Z
ifne L15
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/p Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;
iconst_0
invokevirtual fr/castorflex/android/smoothprogressbar/SmoothProgressBar/setVisibility(I)V
return
L5:
iload 7
istore 14
goto L6
L0:
aload 3
astore 5
goto L1
.limit locals 15
.limit stack 5
.end method

.method public g()V
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/a()Lcom/elevenpaths/android/latch/f/a;
ldc "Ash0Latch1Durbatuluk"
invokevirtual com/elevenpaths/android/latch/f/a/a(Ljava/lang/String;)Lcom/elevenpaths/android/latch/c/a;
invokevirtual com/elevenpaths/android/latch/c/a/h()Lcom/elevenpaths/android/latch/c/d;
getstatic com/elevenpaths/android/latch/c/d/b Lcom/elevenpaths/android/latch/c/d;
if_acmpeq L0
iconst_1
istore 1
L1:
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/r Landroid/support/v4/widget/SwipeRefreshLayout;
iload 1
invokevirtual android/support/v4/widget/SwipeRefreshLayout/setEnabled(Z)V
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/o Lcom/mobeta/android/dslv/DragSortListView;
iload 1
invokevirtual com/mobeta/android/dslv/DragSortListView/setEnabled(Z)V
new com/elevenpaths/android/latch/a/a
dup
aload 0
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/q Ljava/util/ArrayList;
iconst_1
iload 1
invokespecial com/elevenpaths/android/latch/a/a/<init>(Landroid/app/Activity;Ljava/util/ArrayList;ZZ)V
astore 2
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/o Lcom/mobeta/android/dslv/DragSortListView;
aload 2
invokevirtual com/mobeta/android/dslv/DragSortListView/setAdapter(Landroid/widget/ListAdapter;)V
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/o Lcom/mobeta/android/dslv/DragSortListView;
new com/elevenpaths/android/latch/activities/al
dup
aload 0
invokespecial com/elevenpaths/android/latch/activities/al/<init>(Lcom/elevenpaths/android/latch/activities/D_Dashboard;)V
invokevirtual com/mobeta/android/dslv/DragSortListView/setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/o Lcom/mobeta/android/dslv/DragSortListView;
new com/elevenpaths/android/latch/activities/am
dup
aload 0
aload 2
invokespecial com/elevenpaths/android/latch/activities/am/<init>(Lcom/elevenpaths/android/latch/activities/D_Dashboard;Lcom/elevenpaths/android/latch/a/a;)V
invokevirtual com/mobeta/android/dslv/DragSortListView/setDropListener(Lcom/mobeta/android/dslv/o;)V
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/o Lcom/mobeta/android/dslv/DragSortListView;
new com/elevenpaths/android/latch/activities/an
dup
aload 0
invokespecial com/elevenpaths/android/latch/activities/an/<init>(Lcom/elevenpaths/android/latch/activities/D_Dashboard;)V
invokevirtual com/mobeta/android/dslv/DragSortListView/setDragListener(Lcom/mobeta/android/dslv/i;)V
return
L0:
iconst_0
istore 1
goto L1
.limit locals 3
.limit stack 6
.end method

.method public h()V
aload 0
ldc_w 2131099869
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast android/widget/Button
astore 1
aload 1
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/Button;Ljava/lang/String;)V
aload 1
new com/elevenpaths/android/latch/activities/ao
dup
aload 0
invokespecial com/elevenpaths/android/latch/activities/ao/<init>(Lcom/elevenpaths/android/latch/activities/D_Dashboard;)V
invokevirtual android/widget/Button/setOnClickListener(Landroid/view/View$OnClickListener;)V
aload 0
ldc_w 2131099865
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast android/widget/Button
astore 2
aload 2
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/Button;Ljava/lang/String;)V
aload 2
new com/elevenpaths/android/latch/activities/ap
dup
aload 0
invokespecial com/elevenpaths/android/latch/activities/ap/<init>(Lcom/elevenpaths/android/latch/activities/D_Dashboard;)V
invokevirtual android/widget/Button/setOnClickListener(Landroid/view/View$OnClickListener;)V
getstatic android/os/Build$VERSION/SDK_INT I
bipush 11
if_icmplt L0
aload 0
ldc_w 2131099864
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast com/elevenpaths/android/latch/ui/Latchon
new com/elevenpaths/android/latch/activities/aq
dup
aload 0
invokespecial com/elevenpaths/android/latch/activities/aq/<init>(Lcom/elevenpaths/android/latch/activities/D_Dashboard;)V
invokevirtual com/elevenpaths/android/latch/ui/Latchon/setOnStatusChangeListener(Lcom/elevenpaths/android/latch/ui/m;)V
return
L0:
aload 0
ldc_w 2131099864
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast com/elevenpaths/android/latch/ui/SectionLockAll
new com/elevenpaths/android/latch/activities/ai
dup
aload 0
invokespecial com/elevenpaths/android/latch/activities/ai/<init>(Lcom/elevenpaths/android/latch/activities/D_Dashboard;)V
invokevirtual com/elevenpaths/android/latch/ui/SectionLockAll/setOnSwitchChangeListener(Lcom/elevenpaths/android/latch/ui/ac;)V
return
.limit locals 3
.limit stack 4
.end method

.method protected onCreate(Landroid/os/Bundle;)V
aload 0
aload 1
invokespecial android/support/v7/a/f/onCreate(Landroid/os/Bundle;)V
aload 0
ldc_w 2130903083
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/setContentView(I)V

;StaticData.InitStaticData(this);
aload 0
invokestatic com/megacorp/autolatchplugin/StaticData/InitStaticData(Landroid/content/Context;)V

aload 0
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/e()Landroid/support/v7/a/a;
astore 2
aload 2
iconst_1
invokevirtual android/support/v7/a/a/d(Z)V
aload 2
iconst_0
invokevirtual android/support/v7/a/a/c(Z)V
aload 2
iconst_0
invokevirtual android/support/v7/a/a/a(Z)V
aload 2
iconst_0
invokevirtual android/support/v7/a/a/e(Z)V
aload 2
iconst_0
invokevirtual android/support/v7/a/a/b(Z)V
aload 2
aload 0
ldc "layout_inflater"
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/getSystemService(Ljava/lang/String;)Ljava/lang/Object;
checkcast android/view/LayoutInflater
ldc_w 2130903042
aconst_null
invokevirtual android/view/LayoutInflater/inflate(ILandroid/view/ViewGroup;)Landroid/view/View;
invokevirtual android/support/v7/a/a/a(Landroid/view/View;)V
aload 0
invokestatic com/elevenpaths/android/latch/b/b(Landroid/app/Activity;)V
aload 0
aload 0
ldc_w 2131099872
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast com/mobeta/android/dslv/DragSortListView
putfield com/elevenpaths/android/latch/activities/D_Dashboard/o Lcom/mobeta/android/dslv/DragSortListView;
aload 0
aload 0
ldc_w 2131099954
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast fr/castorflex/android/smoothprogressbar/SmoothProgressBar
putfield com/elevenpaths/android/latch/activities/D_Dashboard/p Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/p Lfr/castorflex/android/smoothprogressbar/SmoothProgressBar;
bipush 8
invokevirtual fr/castorflex/android/smoothprogressbar/SmoothProgressBar/setVisibility(I)V
aload 0
ldc "layout_inflater"
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/getSystemService(Ljava/lang/String;)Ljava/lang/Object;
checkcast android/view/LayoutInflater
ldc_w 2130903098
aconst_null
iconst_0
invokevirtual android/view/LayoutInflater/inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;
astore 3
aload 3
aconst_null
invokevirtual android/view/View/setOnClickListener(Landroid/view/View$OnClickListener;)V
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/o Lcom/mobeta/android/dslv/DragSortListView;
aload 3
invokevirtual com/mobeta/android/dslv/DragSortListView/addFooterView(Landroid/view/View;)V
aload 0
aload 0
invokestatic com/elevenpaths/android/latch/ui/a/a(Landroid/app/Activity;)Lcom/jeremyfeinstein/slidingmenu/lib/SlidingMenu;
putfield com/elevenpaths/android/latch/activities/D_Dashboard/s Lcom/jeremyfeinstein/slidingmenu/lib/SlidingMenu;
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/s Lcom/jeremyfeinstein/slidingmenu/lib/SlidingMenu;
aload 0
iconst_0
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/a(Landroid/app/Activity;I)V
aload 0
aload 0
ldc_w 2131099871
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast android/support/v4/widget/SwipeRefreshLayout
putfield com/elevenpaths/android/latch/activities/D_Dashboard/r Landroid/support/v4/widget/SwipeRefreshLayout;
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/r Landroid/support/v4/widget/SwipeRefreshLayout;
ldc_w 2131165204
ldc_w 2131165204
ldc_w 2131165204
ldc_w 2131165204
invokevirtual android/support/v4/widget/SwipeRefreshLayout/a(IIII)V
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/r Landroid/support/v4/widget/SwipeRefreshLayout;
new com/elevenpaths/android/latch/activities/ah
dup
aload 0
invokespecial com/elevenpaths/android/latch/activities/ah/<init>(Lcom/elevenpaths/android/latch/activities/D_Dashboard;)V
invokevirtual android/support/v4/widget/SwipeRefreshLayout/setOnRefreshListener(Landroid/support/v4/widget/ao;)V
aload 0
ldc_w 2131099867
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast android/widget/TextView
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/TextView;Ljava/lang/String;)V
aload 0
ldc_w 2131099868
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/findViewById(I)Landroid/view/View;
checkcast android/widget/TextView
ldc "fonts/roboto_light.ttf"
invokestatic com/elevenpaths/android/latch/h/d/a(Landroid/widget/TextView;Ljava/lang/String;)V
return
.limit locals 4
.limit stack 5
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
aload 0
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/getMenuInflater()Landroid/view/MenuInflater;
ldc_w 2131623936
aload 1
invokevirtual android/view/MenuInflater/inflate(ILandroid/view/Menu;)V
iconst_1
ireturn
.limit locals 2
.limit stack 3
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
iload 1
tableswitch 4
L0
default : L1
L1:
aload 0
iload 1
aload 2
invokespecial android/support/v7/a/f/onKeyDown(ILandroid/view/KeyEvent;)Z
ireturn
L0:
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/s Lcom/jeremyfeinstein/slidingmenu/lib/SlidingMenu;
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/c()Z
ifeq L2
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/s Lcom/jeremyfeinstein/slidingmenu/lib/SlidingMenu;
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/b()V
L3:
iconst_1
ireturn
L2:
aload 0
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/finish()V
goto L3
.limit locals 3
.limit stack 3
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
aload 1
invokeinterface android/view/MenuItem/getItemId()I 0
tableswitch 2131099966
L0
default : L1
L1:
aload 0
aload 1
invokespecial android/support/v7/a/f/onOptionsItemSelected(Landroid/view/MenuItem;)Z
ireturn
L0:
aload 0
getfield com/elevenpaths/android/latch/activities/D_Dashboard/s Lcom/jeremyfeinstein/slidingmenu/lib/SlidingMenu;
invokevirtual com/jeremyfeinstein/slidingmenu/lib/SlidingMenu/a()V
iconst_1
ireturn
.limit locals 2
.limit stack 2
.end method

.method protected onPause()V
aload 0
invokespecial android/support/v7/a/f/onPause()V
invokestatic com/elevenpaths/android/latch/LatchApplication/g()V
return
.limit locals 1
.limit stack 1
.end method

.method protected onResume()V
aload 0
invokespecial android/support/v7/a/f/onResume()V
invokestatic com/elevenpaths/android/latch/LatchApplication/f()V
return
.limit locals 1
.limit stack 1
.end method

.method public onStart()V
aload 0
invokespecial android/support/v7/a/f/onStart()V
new com/elevenpaths/android/latch/g/b
dup
aload 0
invokespecial com/elevenpaths/android/latch/g/b/<init>(Landroid/app/Activity;)V
invokevirtual com/elevenpaths/android/latch/g/b/b()V
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/a()Lcom/elevenpaths/android/latch/f/a;
aload 0
invokevirtual com/elevenpaths/android/latch/f/a/addObserver(Ljava/util/Observer;)V
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/a()Lcom/elevenpaths/android/latch/f/a;
ifnull L0
aload 0
iconst_1
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/b(Z)V
L0:
return
.limit locals 1
.limit stack 3
.end method

.method protected onStop()V
aload 0
invokespecial android/support/v7/a/f/onStop()V
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/a()Lcom/elevenpaths/android/latch/f/a;
aload 0
invokevirtual com/elevenpaths/android/latch/f/a/deleteObserver(Ljava/util/Observer;)V
return
.limit locals 1
.limit stack 2
.end method

.method public update(Ljava/util/Observable;Ljava/lang/Object;)V
aload 0
new com/elevenpaths/android/latch/activities/aj
dup
aload 0
aload 2
checkcast java/lang/Boolean
invokevirtual java/lang/Boolean/booleanValue()Z
invokespecial com/elevenpaths/android/latch/activities/aj/<init>(Lcom/elevenpaths/android/latch/activities/D_Dashboard;Z)V
invokevirtual com/elevenpaths/android/latch/activities/D_Dashboard/runOnUiThread(Ljava/lang/Runnable;)V
return
.limit locals 3
.limit stack 5
.end method
