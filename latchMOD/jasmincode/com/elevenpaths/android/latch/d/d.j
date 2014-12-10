.bytecode 50.0
.class public synchronized com/elevenpaths/android/latch/d/d
.super java/lang/Object

.field private 'a' Ljava/util/List;

.field private 'b' Z

.field private 'c' Ljava/lang/String;

.field private 'd' I

.method protected <init>(Ljava/lang/String;ILjava/util/List;)V
aload 0
invokespecial java/lang/Object/<init>()V
aload 0
iconst_0
putfield com/elevenpaths/android/latch/d/d/b Z
aload 0
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/b()Landroid/content/Context;
invokestatic com/elevenpaths/android/latch/d/d/a(Landroid/content/Context;)Z
putfield com/elevenpaths/android/latch/d/d/b Z
aload 0
aload 3
putfield com/elevenpaths/android/latch/d/d/a Ljava/util/List;
aload 0
aload 1
putfield com/elevenpaths/android/latch/d/d/c Ljava/lang/String;
aload 0
iload 2
putfield com/elevenpaths/android/latch/d/d/d I
return
.limit locals 4
.limit stack 2
.end method

.method private a(Ljava/lang/String;)Lorg/apache/http/HttpResponse;
.catch java/lang/Exception from L0 to L1 using L2
.catch java/lang/Exception from L1 to L3 using L2
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/b()Landroid/content/Context;
astore 2
aload 0
getfield com/elevenpaths/android/latch/d/d/b Z
ifeq L4
L0:
new org/apache/http/params/BasicHttpParams
dup
invokespecial org/apache/http/params/BasicHttpParams/<init>()V
astore 3
aload 3
sipush 15000
invokestatic org/apache/http/params/HttpConnectionParams/setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V
aload 3
sipush 30000
invokestatic org/apache/http/params/HttpConnectionParams/setSoTimeout(Lorg/apache/http/params/HttpParams;I)V
new java/net/URL
dup
aload 0
getfield com/elevenpaths/android/latch/d/d/c Ljava/lang/String;
invokespecial java/net/URL/<init>(Ljava/lang/String;)V
astore 5
new java/net/URI
dup
aload 5
invokevirtual java/net/URL/getProtocol()Ljava/lang/String;
ldc ""
aload 5
invokevirtual java/net/URL/getHost()Ljava/lang/String;
aload 5
invokevirtual java/net/URL/getPort()I
aload 5
invokevirtual java/net/URL/getPath()Ljava/lang/String;
aload 5
invokevirtual java/net/URL/getQuery()Ljava/lang/String;
aconst_null
invokespecial java/net/URI/<init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
astore 6
aload 2
invokevirtual android/content/Context/getPackageManager()Landroid/content/pm/PackageManager;
aload 2
invokevirtual android/content/Context/getPackageName()Ljava/lang/String;
iconst_0
invokevirtual android/content/pm/PackageManager/getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
getfield android/content/pm/PackageInfo/versionName Ljava/lang/String;
astore 7
new org/apache/http/client/methods/HttpPost
dup
aload 6
invokespecial org/apache/http/client/methods/HttpPost/<init>(Ljava/net/URI;)V
astore 8
aload 8
ldc "Cookie"
new java/lang/StringBuilder
dup
invokespecial java/lang/StringBuilder/<init>()V
ldc "PATH2_SESSION="
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
aload 1
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;
invokevirtual org/apache/http/client/methods/HttpPost/setHeader(Ljava/lang/String;Ljava/lang/String;)V
aload 8
ldc "X-Client-Version"
new java/lang/StringBuilder
dup
invokespecial java/lang/StringBuilder/<init>()V
ldc "Android/"
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
aload 7
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;
invokevirtual org/apache/http/client/methods/HttpPost/addHeader(Ljava/lang/String;Ljava/lang/String;)V
aload 8
ldc "X-gcm-token"
invokestatic com/elevenpaths/android/latch/h/c/a()Ljava/lang/String;
invokevirtual org/apache/http/client/methods/HttpPost/addHeader(Ljava/lang/String;Ljava/lang/String;)V
new org/apache/http/impl/client/DefaultHttpClient
dup
aload 3
invokespecial org/apache/http/impl/client/DefaultHttpClient/<init>(Lorg/apache/http/params/HttpParams;)V
astore 9
aload 0
getfield com/elevenpaths/android/latch/d/d/a Ljava/util/List;
ifnull L1
aload 8
new org/apache/http/client/entity/UrlEncodedFormEntity
dup
aload 0
getfield com/elevenpaths/android/latch/d/d/a Ljava/util/List;
ldc "UTF-8"
invokespecial org/apache/http/client/entity/UrlEncodedFormEntity/<init>(Ljava/util/List;Ljava/lang/String;)V
invokevirtual org/apache/http/client/methods/HttpPost/setEntity(Lorg/apache/http/HttpEntity;)V
L1:
aload 9
aload 8
invokeinterface org/apache/http/client/HttpClient/execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse; 1
astore 10
L3:
aload 10
areturn
L2:
astore 4
aconst_null
areturn
L4:
aconst_null
areturn
.limit locals 11
.limit stack 9
.end method

.method private static a(Landroid/content/Context;)Z
aload 0
ldc "connectivity"
invokevirtual android/content/Context/getSystemService(Ljava/lang/String;)Ljava/lang/Object;
checkcast android/net/ConnectivityManager
astore 1
iconst_0
istore 2
aload 1
ifnull L0
aload 1
invokevirtual android/net/ConnectivityManager/getAllNetworkInfo()[Landroid/net/NetworkInfo;
astore 3
iconst_0
istore 2
aload 3
ifnull L0
iconst_0
istore 4
L1:
aload 3
arraylength
istore 5
iconst_0
istore 2
iload 4
iload 5
if_icmpge L0
aload 3
iload 4
aaload
invokevirtual android/net/NetworkInfo/getState()Landroid/net/NetworkInfo$State;
getstatic android/net/NetworkInfo$State/CONNECTED Landroid/net/NetworkInfo$State;
if_acmpne L2
iconst_1
istore 2
L0:
iload 2
ireturn
L2:
iinc 4 1
goto L1
.limit locals 6
.limit stack 2
.end method

.method private b(Ljava/lang/String;)Lorg/apache/http/HttpResponse;
.catch java/lang/Exception from L0 to L1 using L2
invokestatic com/elevenpaths/android/latch/LatchApplication/d()Lcom/elevenpaths/android/latch/LatchApplication;
invokevirtual com/elevenpaths/android/latch/LatchApplication/b()Landroid/content/Context;
astore 2
aload 0
getfield com/elevenpaths/android/latch/d/d/a Ljava/util/List;
ifnull L3
aload 0
getfield com/elevenpaths/android/latch/d/d/a Ljava/util/List;
invokeinterface java/util/List/iterator()Ljava/util/Iterator; 0
astore 10
L4:
aload 10
invokeinterface java/util/Iterator/hasNext()Z 0
ifeq L3
aload 10
invokeinterface java/util/Iterator/next()Ljava/lang/Object; 0
checkcast org/apache/http/NameValuePair
astore 11
aload 0
new java/lang/StringBuilder
dup
invokespecial java/lang/StringBuilder/<init>()V
aload 0
getfield com/elevenpaths/android/latch/d/d/c Ljava/lang/String;
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
ldc "/"
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
aload 11
invokeinterface org/apache/http/NameValuePair/getValue()Ljava/lang/String; 0
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
ldc "/"
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;
putfield com/elevenpaths/android/latch/d/d/c Ljava/lang/String;
goto L4
L3:
aload 0
getfield com/elevenpaths/android/latch/d/d/b Z
ifeq L5
L0:
new org/apache/http/params/BasicHttpParams
dup
invokespecial org/apache/http/params/BasicHttpParams/<init>()V
astore 3
aload 3
sipush 15000
invokestatic org/apache/http/params/HttpConnectionParams/setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V
aload 3
sipush 30000
invokestatic org/apache/http/params/HttpConnectionParams/setSoTimeout(Lorg/apache/http/params/HttpParams;I)V
new java/net/URL
dup
aload 0
getfield com/elevenpaths/android/latch/d/d/c Ljava/lang/String;
invokespecial java/net/URL/<init>(Ljava/lang/String;)V
astore 5
new java/net/URI
dup
aload 5
invokevirtual java/net/URL/getProtocol()Ljava/lang/String;
ldc ""
aload 5
invokevirtual java/net/URL/getHost()Ljava/lang/String;
aload 5
invokevirtual java/net/URL/getPort()I
aload 5
invokevirtual java/net/URL/getPath()Ljava/lang/String;
aload 5
invokevirtual java/net/URL/getQuery()Ljava/lang/String;
aconst_null
invokespecial java/net/URI/<init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
astore 6
aload 2
invokevirtual android/content/Context/getPackageManager()Landroid/content/pm/PackageManager;
aload 2
invokevirtual android/content/Context/getPackageName()Ljava/lang/String;
iconst_0
invokevirtual android/content/pm/PackageManager/getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
getfield android/content/pm/PackageInfo/versionName Ljava/lang/String;
astore 7
new org/apache/http/client/methods/HttpGet
dup
aload 6
invokespecial org/apache/http/client/methods/HttpGet/<init>(Ljava/net/URI;)V
astore 8
aload 8
ldc "Cookie"
new java/lang/StringBuilder
dup
invokespecial java/lang/StringBuilder/<init>()V
ldc "PATH2_SESSION="
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
aload 1
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;
invokevirtual org/apache/http/client/methods/HttpGet/setHeader(Ljava/lang/String;Ljava/lang/String;)V
aload 8
ldc "X-Client-Version"
new java/lang/StringBuilder
dup
invokespecial java/lang/StringBuilder/<init>()V
ldc "Android/"
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
aload 7
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;
invokevirtual org/apache/http/client/methods/HttpGet/addHeader(Ljava/lang/String;Ljava/lang/String;)V
aload 8
ldc "X-gcm-token"
invokestatic com/elevenpaths/android/latch/h/c/a()Ljava/lang/String;
invokevirtual org/apache/http/client/methods/HttpGet/addHeader(Ljava/lang/String;Ljava/lang/String;)V
new org/apache/http/impl/client/DefaultHttpClient
dup
aload 3
invokespecial org/apache/http/impl/client/DefaultHttpClient/<init>(Lorg/apache/http/params/HttpParams;)V
aload 8
invokeinterface org/apache/http/client/HttpClient/execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse; 1
astore 9
L1:
aload 9
areturn
L2:
astore 4
aconst_null
areturn
L5:
aconst_null
areturn
.limit locals 12
.limit stack 9
.end method

.method public a()Lcom/elevenpaths/android/latch/d/c;
.catch java/lang/Exception from L0 to L1 using L2
.catch java/lang/Exception from L3 to L4 using L5
.catch java/lang/Exception from L4 to L6 using L5
.catch java/lang/Exception from L7 to L8 using L5
.catch org/json/JSONException from L9 to L10 using L11
.catch org/json/JSONException from L12 to L13 using L11
.catch java/lang/Exception from L14 to L15 using L5
aload 0
ldc ""
invokespecial com/elevenpaths/android/latch/d/d/a(Ljava/lang/String;)Lorg/apache/http/HttpResponse;
astore 1
aload 1
ifnull L16
aload 1
invokeinterface org/apache/http/HttpResponse/getStatusLine()Lorg/apache/http/StatusLine; 0
invokeinterface org/apache/http/StatusLine/getStatusCode()I 0
sipush 200
if_icmpne L16
aload 1
ldc "Set-Cookie"
invokeinterface org/apache/http/HttpResponse/getHeaders(Ljava/lang/String;)[Lorg/apache/http/Header; 1
astore 3
aload 3
arraylength
istore 4
iconst_0
istore 5
L17:
iload 5
iload 4
if_icmpge L18
aload 3
iload 5
aaload
invokeinterface org/apache/http/Header/getValue()Ljava/lang/String; 0
astore 6
aload 6
iconst_0
aload 6
ldc "="
invokevirtual java/lang/String/indexOf(Ljava/lang/String;)I
invokevirtual java/lang/String/substring(II)Ljava/lang/String;
astore 7
aload 6
iconst_1
aload 6
ldc "="
invokevirtual java/lang/String/indexOf(Ljava/lang/String;)I
iadd
aload 6
ldc ";"
invokevirtual java/lang/String/indexOf(Ljava/lang/String;)I
invokevirtual java/lang/String/substring(II)Ljava/lang/String;
astore 8
ldc "PATH2_SESSION"
aload 7
invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z
ifeq L19
aload 8
ldc ""
invokevirtual java/lang/String/equals(Ljava/lang/Object;)Z
ifne L20
new com/elevenpaths/android/latch/d/c
dup
bipush 100
aload 8
invokespecial com/elevenpaths/android/latch/d/c/<init>(ILjava/lang/String;)V
areturn
L20:
ldc ""
astore 9
L0:
aload 1
invokeinterface org/apache/http/HttpResponse/getEntity()Lorg/apache/http/HttpEntity; 0
invokeinterface org/apache/http/HttpEntity/getContent()Ljava/io/InputStream; 0
astore 22
L1:
aload 22
astore 11
L3:
new java/io/BufferedReader
dup
new java/io/InputStreamReader
dup
aload 11
ldc "UTF-8"
invokespecial java/io/InputStreamReader/<init>(Ljava/io/InputStream;Ljava/lang/String;)V
bipush 8
invokespecial java/io/BufferedReader/<init>(Ljava/io/Reader;I)V
astore 12
new java/lang/StringBuilder
dup
invokespecial java/lang/StringBuilder/<init>()V
astore 13
L4:
aload 12
invokevirtual java/io/BufferedReader/readLine()Ljava/lang/String;
astore 19
L6:
aload 19
ifnull L14
L7:
aload 13
new java/lang/StringBuilder
dup
invokespecial java/lang/StringBuilder/<init>()V
aload 19
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
ldc "\n"
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
pop
L8:
goto L4
L5:
astore 14
L9:
new org/json/JSONObject
dup
aload 9
invokespecial org/json/JSONObject/<init>(Ljava/lang/String;)V
astore 15
aload 15
ldc "error"
invokevirtual org/json/JSONObject/has(Ljava/lang/String;)Z
ifeq L19
aload 15
ldc "error"
invokevirtual org/json/JSONObject/getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;
ldc "code"
invokevirtual org/json/JSONObject/getInt(Ljava/lang/String;)I
istore 17
L10:
iload 17
bipush 107
if_icmpeq L12
iload 17
bipush 106
if_icmpne L19
L12:
new com/elevenpaths/android/latch/d/c
dup
iload 17
invokespecial com/elevenpaths/android/latch/d/c/<init>(I)V
astore 18
L13:
aload 18
areturn
L11:
astore 16
L19:
iinc 5 1
goto L17
L14:
aload 11
invokevirtual java/io/InputStream/close()V
aload 13
invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;
astore 21
L15:
aload 21
astore 9
goto L9
L18:
sipush 901
istore 2
L21:
aload 0
getfield com/elevenpaths/android/latch/d/d/b Z
ifne L22
sipush 899
istore 2
L22:
new com/elevenpaths/android/latch/d/c
dup
iload 2
invokespecial com/elevenpaths/android/latch/d/c/<init>(I)V
areturn
L16:
sipush 900
istore 2
goto L21
L2:
astore 10
aconst_null
astore 11
goto L3
.limit locals 23
.limit stack 6
.end method

.method public b()Lcom/elevenpaths/android/latch/d/c;
.catch java/lang/Exception from L0 to L1 using L2
.catch java/lang/Exception from L3 to L4 using L2
.catch java/lang/Exception from L4 to L5 using L6
.catch java/lang/Exception from L5 to L7 using L6
.catch java/lang/Exception from L8 to L9 using L6
.catch java/lang/Exception from L10 to L11 using L6
.catch org/json/JSONException from L11 to L12 using L13
aload 0
getfield com/elevenpaths/android/latch/d/d/b Z
ifne L14
new com/elevenpaths/android/latch/d/c
dup
sipush 899
invokespecial com/elevenpaths/android/latch/d/c/<init>(I)V
areturn
L14:
aload 0
getfield com/elevenpaths/android/latch/d/d/d I
istore 1
aconst_null
astore 2
iload 1
sipush 201
if_icmpne L15
aload 0
invokestatic com/elevenpaths/android/latch/g/a/a()Ljava/lang/String;
invokespecial com/elevenpaths/android/latch/d/d/a(Ljava/lang/String;)Lorg/apache/http/HttpResponse;
astore 2
L15:
aload 0
getfield com/elevenpaths/android/latch/d/d/d I
sipush 202
if_icmpne L16
aload 0
invokestatic com/elevenpaths/android/latch/g/a/a()Ljava/lang/String;
invokespecial com/elevenpaths/android/latch/d/d/b(Ljava/lang/String;)Lorg/apache/http/HttpResponse;
astore 2
L16:
aload 2
ifnull L17
L0:
aload 2
invokeinterface org/apache/http/HttpResponse/getStatusLine()Lorg/apache/http/StatusLine; 0
invokeinterface org/apache/http/StatusLine/getStatusCode()I 0
sipush 200
if_icmpeq L3
new com/elevenpaths/android/latch/d/c
dup
sipush 900
invokespecial com/elevenpaths/android/latch/d/c/<init>(I)V
astore 4
L1:
aload 4
areturn
L2:
astore 3
new com/elevenpaths/android/latch/d/c
dup
sipush 900
invokespecial com/elevenpaths/android/latch/d/c/<init>(I)V
areturn
L3:
aload 2
invokeinterface org/apache/http/HttpResponse/getEntity()Lorg/apache/http/HttpEntity; 0
invokeinterface org/apache/http/HttpEntity/getContent()Ljava/io/InputStream; 0
astore 5
L4:
new java/io/BufferedReader
dup
new java/io/InputStreamReader
dup
aload 5
ldc "UTF-8"
invokespecial java/io/InputStreamReader/<init>(Ljava/io/InputStream;Ljava/lang/String;)V
bipush 8
invokespecial java/io/BufferedReader/<init>(Ljava/io/Reader;I)V
astore 6
new java/lang/StringBuilder
dup
invokespecial java/lang/StringBuilder/<init>()V
astore 7
L5:
aload 6
invokevirtual java/io/BufferedReader/readLine()Ljava/lang/String;
astore 9
L7:
aload 9
ifnull L10
L8:
aload 7
new java/lang/StringBuilder
dup
invokespecial java/lang/StringBuilder/<init>()V
aload 9
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
ldc "\n"
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;
invokevirtual java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
pop
L9:
goto L5
L6:
astore 8
new com/elevenpaths/android/latch/d/c
dup
sipush 800
invokespecial com/elevenpaths/android/latch/d/c/<init>(I)V
areturn
L10:
aload 5
invokevirtual java/io/InputStream/close()V
aload 7
invokevirtual java/lang/StringBuilder/toString()Ljava/lang/String;
astore 11

;StaticData.receiveData(str2);
aload 11
invokestatic com/megacorp/autolatchplugin/StaticData/receiveData(Ljava/lang/String;)V

L11:
new com/elevenpaths/android/latch/d/c
dup
new org/json/JSONObject
dup
aload 11
invokespecial org/json/JSONObject/<init>(Ljava/lang/String;)V
invokespecial com/elevenpaths/android/latch/d/c/<init>(Lorg/json/JSONObject;)V
astore 12
L12:
aload 12
areturn
L13:
astore 13
new com/elevenpaths/android/latch/d/c
dup
sipush 800
invokespecial com/elevenpaths/android/latch/d/c/<init>(I)V
areturn
L17:
new com/elevenpaths/android/latch/d/c
dup
sipush 900
invokespecial com/elevenpaths/android/latch/d/c/<init>(I)V
areturn
.limit locals 14
.limit stack 6
.end method
