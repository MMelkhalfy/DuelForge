.class public Lcom/capacitorjs/plugins/share/SharePlugin;
.super Lcom/getcapacitor/Plugin;
.source "SharePlugin.java"


# annotations
.annotation runtime Lcom/getcapacitor/annotation/CapacitorPlugin;
    name = "Share"
.end annotation


# static fields
.field private static final NONCE_EXTRA_KEY:Ljava/lang/String; = "_share_nonce"


# instance fields
.field private broadcastReceiver:Landroid/content/BroadcastReceiver;

.field private chosenComponent:Landroid/content/ComponentName;

.field private expectedNonce:Ljava/lang/String;

.field private isPresenting:Z

.field private stopped:Z


# direct methods
.method static bridge synthetic -$$Nest$fgetexpectedNonce(Lcom/capacitorjs/plugins/share/SharePlugin;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->expectedNonce:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputchosenComponent(Lcom/capacitorjs/plugins/share/SharePlugin;Landroid/content/ComponentName;)V
    .locals 0

    iput-object p1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->chosenComponent:Landroid/content/ComponentName;

    return-void
.end method

.method static bridge synthetic -$$Nest$fputexpectedNonce(Lcom/capacitorjs/plugins/share/SharePlugin;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->expectedNonce:Ljava/lang/String;

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetParcelableExtraLegacy(Lcom/capacitorjs/plugins/share/SharePlugin;Landroid/content/Intent;Ljava/lang/String;)Landroid/content/ComponentName;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/capacitorjs/plugins/share/SharePlugin;->getParcelableExtraLegacy(Landroid/content/Intent;Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/getcapacitor/Plugin;-><init>()V

    .line 31
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->stopped:Z

    .line 32
    iput-boolean v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->isPresenting:Z

    return-void
.end method

.method private activityResult(Lcom/getcapacitor/PluginCall;Landroidx/activity/result/ActivityResult;)V
    .locals 3
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .param p2, "result"    # Landroidx/activity/result/ActivityResult;
    .annotation runtime Lcom/getcapacitor/annotation/ActivityCallback;
    .end annotation

    .line 78
    invoke-virtual {p2}, Landroidx/activity/result/ActivityResult;->getResultCode()I

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->stopped:Z

    if-nez v0, :cond_0

    .line 79
    const-string v0, "Share canceled"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    goto :goto_1

    .line 81
    :cond_0
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 82
    .local v0, "callResult":Lcom/getcapacitor/JSObject;
    iget-object v1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->chosenComponent:Landroid/content/ComponentName;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->chosenComponent:Landroid/content/ComponentName;

    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    const-string v1, ""

    :goto_0
    const-string v2, "activityType"

    invoke-virtual {v0, v2, v1}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 83
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    .line 85
    .end local v0    # "callResult":Lcom/getcapacitor/JSObject;
    :goto_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->isPresenting:Z

    .line 86
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->expectedNonce:Ljava/lang/String;

    .line 87
    return-void
.end method

.method private getMimeType(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;

    .line 222
    const/4 v0, 0x0

    .line 223
    .local v0, "type":Ljava/lang/String;
    invoke-static {p1}, Landroid/webkit/MimeTypeMap;->getFileExtensionFromUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 224
    .local v1, "extension":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 225
    invoke-static {}, Landroid/webkit/MimeTypeMap;->getSingleton()Landroid/webkit/MimeTypeMap;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/webkit/MimeTypeMap;->getMimeTypeFromExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 227
    :cond_0
    return-object v0
.end method

.method private getParcelableExtraLegacy(Landroid/content/Intent;Ljava/lang/String;)Landroid/content/ComponentName;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "string"    # Ljava/lang/String;

    .line 73
    invoke-virtual {p1, p2}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/content/ComponentName;

    return-object v0
.end method

.method private isFileUrl(Ljava/lang/String;)Z
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .line 231
    const-string v0, "file:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private isHttpUrl(Ljava/lang/String;)Z
    .locals 1
    .param p1, "url"    # Ljava/lang/String;

    .line 235
    const-string v0, "http"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private shareFiles(Lcom/getcapacitor/JSArray;Landroid/content/Intent;Lcom/getcapacitor/PluginCall;)V
    .locals 9
    .param p1, "files"    # Lcom/getcapacitor/JSArray;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "call"    # Lcom/getcapacitor/PluginCall;

    .line 169
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 171
    .local v0, "fileUris":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    :try_start_0
    invoke-virtual {p1}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v1

    .line 172
    .local v1, "filesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v2, v3, :cond_3

    .line 173
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 174
    .local v3, "file":Ljava/lang/String;
    invoke-direct {p0, v3}, Lcom/capacitorjs/plugins/share/SharePlugin;->isFileUrl(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 175
    invoke-direct {p0, v3}, Lcom/capacitorjs/plugins/share/SharePlugin;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 176
    .local v5, "type":Ljava/lang/String;
    if-eqz v5, :cond_0

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-le v6, v4, :cond_1

    .line 177
    :cond_0
    const-string v4, "*/*"

    move-object v5, v4

    .line 179
    :cond_1
    invoke-virtual {p2, v5}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 181
    nop

    .line 182
    invoke-virtual {p0}, Lcom/capacitorjs/plugins/share/SharePlugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v4

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    invoke-virtual {p0}, Lcom/capacitorjs/plugins/share/SharePlugin;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".fileprovider"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    new-instance v7, Ljava/io/File;

    .line 184
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v8

    invoke-virtual {v8}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 181
    invoke-static {v4, v6, v7}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    .line 186
    .local v4, "fileUrl":Landroid/net/Uri;
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    nop

    .line 172
    .end local v3    # "file":Ljava/lang/String;
    .end local v4    # "fileUrl":Landroid/net/Uri;
    .end local v5    # "type":Ljava/lang/String;
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 188
    .restart local v3    # "file":Ljava/lang/String;
    :cond_2
    const-string v4, "only file urls are supported"

    invoke-virtual {p3, v4}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 189
    return-void

    .line 192
    .end local v2    # "i":I
    .end local v3    # "file":Ljava/lang/String;
    :cond_3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const-string v3, "android.intent.extra.STREAM"

    if-le v2, v4, :cond_4

    .line 193
    :try_start_1
    invoke-virtual {p2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    goto :goto_1

    .line 194
    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ne v2, v4, :cond_6

    .line 195
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1d

    const/4 v6, 0x0

    if-lt v2, v5, :cond_5

    .line 196
    const-string v2, ""

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/net/Uri;

    invoke-static {v2, v5}, Landroid/content/ClipData;->newRawUri(Ljava/lang/CharSequence;Landroid/net/Uri;)Landroid/content/ClipData;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/content/Intent;->setClipData(Landroid/content/ClipData;)V

    .line 198
    :cond_5
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Parcelable;

    invoke-virtual {p2, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 200
    :cond_6
    :goto_1
    invoke-virtual {p2, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 204
    nop

    .line 205
    return-void

    .line 201
    .end local v1    # "filesList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/Object;>;"
    :catch_0
    move-exception v1

    .line 202
    .local v1, "ex":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 203
    return-void
.end method


# virtual methods
.method public canShare(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 91
    new-instance v0, Lcom/getcapacitor/JSObject;

    invoke-direct {v0}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 92
    .local v0, "callResult":Lcom/getcapacitor/JSObject;
    const-string v1, "value"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Z)Lcom/getcapacitor/JSObject;

    .line 93
    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    .line 94
    return-void
.end method

.method protected handleOnDestroy()V
    .locals 2

    .line 209
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->expectedNonce:Ljava/lang/String;

    .line 210
    iget-object v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 211
    invoke-virtual {p0}, Lcom/capacitorjs/plugins/share/SharePlugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroidx/appcompat/app/AppCompatActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 213
    :cond_0
    return-void
.end method

.method protected handleOnStop()V
    .locals 1

    .line 217
    invoke-super {p0}, Lcom/getcapacitor/Plugin;->handleOnStop()V

    .line 218
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->stopped:Z

    .line 219
    return-void
.end method

.method public load()V
    .locals 4

    .line 38
    new-instance v0, Lcom/capacitorjs/plugins/share/SharePlugin$1;

    invoke-direct {v0, p0}, Lcom/capacitorjs/plugins/share/SharePlugin$1;-><init>(Lcom/capacitorjs/plugins/share/SharePlugin;)V

    iput-object v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 63
    nop

    .line 64
    invoke-virtual {p0}, Lcom/capacitorjs/plugins/share/SharePlugin;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->broadcastReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.extra.CHOSEN_COMPONENT"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 63
    const/4 v3, 0x2

    invoke-static {v0, v1, v2, v3}, Landroidx/core/content/ContextCompat;->registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;I)Landroid/content/Intent;

    .line 69
    return-void
.end method

.method public share(Lcom/getcapacitor/PluginCall;)V
    .locals 13
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 98
    iget-boolean v0, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->isPresenting:Z

    if-nez v0, :cond_c

    .line 99
    const-string v0, "title"

    const-string v1, ""

    invoke-virtual {p1, v0, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 100
    .local v0, "title":Ljava/lang/String;
    const-string v1, "text"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 101
    .local v1, "text":Ljava/lang/String;
    const-string v2, "url"

    invoke-virtual {p1, v2}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 102
    .local v2, "url":Ljava/lang/String;
    const-string v3, "files"

    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v3

    .line 103
    .local v3, "files":Lcom/getcapacitor/JSArray;
    const-string v4, "dialogTitle"

    const-string v5, "Share"

    invoke-virtual {p1, v4, v5}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 105
    .local v4, "dialogTitle":Ljava/lang/String;
    if-nez v1, :cond_1

    if-nez v2, :cond_1

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Lcom/getcapacitor/JSArray;->length()I

    move-result v5

    if-nez v5, :cond_1

    .line 106
    :cond_0
    const-string v5, "Must provide a URL or Message or files"

    invoke-virtual {p1, v5}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 107
    return-void

    .line 110
    :cond_1
    if-eqz v2, :cond_2

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/share/SharePlugin;->isFileUrl(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/share/SharePlugin;->isHttpUrl(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 111
    const-string v5, "Unsupported url"

    invoke-virtual {p1, v5}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 112
    return-void

    .line 115
    :cond_2
    new-instance v5, Landroid/content/Intent;

    const/4 v6, 0x1

    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lcom/getcapacitor/JSArray;->length()I

    move-result v7

    if-le v7, v6, :cond_3

    const-string v7, "android.intent.action.SEND_MULTIPLE"

    goto :goto_0

    :cond_3
    const-string v7, "android.intent.action.SEND"

    :goto_0
    invoke-direct {v5, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 117
    .local v5, "intent":Landroid/content/Intent;
    const-string v7, "text/plain"

    const-string v8, "android.intent.extra.TEXT"

    if-eqz v1, :cond_5

    .line 119
    if-eqz v2, :cond_4

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/share/SharePlugin;->isHttpUrl(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 120
    :cond_4
    invoke-virtual {v5, v8, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 121
    invoke-virtual {v5, v7}, Landroid/content/Intent;->setTypeAndNormalize(Ljava/lang/String;)Landroid/content/Intent;

    .line 124
    :cond_5
    if-eqz v2, :cond_6

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/share/SharePlugin;->isHttpUrl(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_6

    if-nez v1, :cond_6

    .line 125
    invoke-virtual {v5, v8, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 126
    invoke-virtual {v5, v7}, Landroid/content/Intent;->setTypeAndNormalize(Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_1

    .line 127
    :cond_6
    if-eqz v2, :cond_7

    invoke-direct {p0, v2}, Lcom/capacitorjs/plugins/share/SharePlugin;->isFileUrl(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 128
    new-instance v7, Lcom/getcapacitor/JSArray;

    invoke-direct {v7}, Lcom/getcapacitor/JSArray;-><init>()V

    .line 129
    .local v7, "filesArray":Lcom/getcapacitor/JSArray;
    invoke-virtual {v7, v2}, Lcom/getcapacitor/JSArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 130
    invoke-direct {p0, v7, v5, p1}, Lcom/capacitorjs/plugins/share/SharePlugin;->shareFiles(Lcom/getcapacitor/JSArray;Landroid/content/Intent;Lcom/getcapacitor/PluginCall;)V

    .line 133
    .end local v7    # "filesArray":Lcom/getcapacitor/JSArray;
    :cond_7
    :goto_1
    if-eqz v0, :cond_8

    .line 134
    const-string v7, "android.intent.extra.SUBJECT"

    invoke-virtual {v5, v7, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    :cond_8
    if-eqz v3, :cond_9

    invoke-virtual {v3}, Lcom/getcapacitor/JSArray;->length()I

    move-result v7

    if-eqz v7, :cond_9

    .line 138
    invoke-direct {p0, v3, v5, p1}, Lcom/capacitorjs/plugins/share/SharePlugin;->shareFiles(Lcom/getcapacitor/JSArray;Landroid/content/Intent;Lcom/getcapacitor/PluginCall;)V

    .line 142
    :cond_9
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->expectedNonce:Ljava/lang/String;

    .line 143
    new-instance v7, Landroid/content/Intent;

    const-string v8, "android.intent.extra.CHOSEN_COMPONENT"

    invoke-direct {v7, v8}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 144
    .local v7, "callbackIntent":Landroid/content/Intent;
    const-string v8, "_share_nonce"

    iget-object v9, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->expectedNonce:Ljava/lang/String;

    invoke-virtual {v7, v8, v9}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 146
    const/high16 v8, 0x8000000

    .line 147
    .local v8, "flags":I
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x1f

    if-lt v9, v10, :cond_a

    .line 148
    const/high16 v9, 0x2000000

    or-int/2addr v8, v9

    .line 150
    :cond_a
    sget v9, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v10, 0x22

    if-lt v9, v10, :cond_b

    .line 151
    const/high16 v9, 0x1000000

    or-int/2addr v8, v9

    .line 155
    :cond_b
    invoke-virtual {p0}, Lcom/capacitorjs/plugins/share/SharePlugin;->getContext()Landroid/content/Context;

    move-result-object v9

    const/4 v10, 0x0

    invoke-static {v9, v10, v7, v8}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v9

    .line 156
    .local v9, "pi":Landroid/app/PendingIntent;
    invoke-virtual {v9}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v11

    invoke-static {v5, v4, v11}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;Landroid/content/IntentSender;)Landroid/content/Intent;

    move-result-object v11

    .line 157
    .local v11, "chooser":Landroid/content/Intent;
    const/4 v12, 0x0

    iput-object v12, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->chosenComponent:Landroid/content/ComponentName;

    .line 158
    const-string v12, "android.intent.category.DEFAULT"

    invoke-virtual {v11, v12}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 159
    iput-boolean v10, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->stopped:Z

    .line 160
    iput-boolean v6, p0, Lcom/capacitorjs/plugins/share/SharePlugin;->isPresenting:Z

    .line 161
    const-string v6, "activityResult"

    invoke-virtual {p0, p1, v11, v6}, Lcom/capacitorjs/plugins/share/SharePlugin;->startActivityForResult(Lcom/getcapacitor/PluginCall;Landroid/content/Intent;Ljava/lang/String;)V

    .line 162
    .end local v0    # "title":Ljava/lang/String;
    .end local v1    # "text":Ljava/lang/String;
    .end local v2    # "url":Ljava/lang/String;
    .end local v3    # "files":Lcom/getcapacitor/JSArray;
    .end local v4    # "dialogTitle":Ljava/lang/String;
    .end local v5    # "intent":Landroid/content/Intent;
    .end local v7    # "callbackIntent":Landroid/content/Intent;
    .end local v8    # "flags":I
    .end local v9    # "pi":Landroid/app/PendingIntent;
    .end local v11    # "chooser":Landroid/content/Intent;
    goto :goto_2

    .line 163
    :cond_c
    const-string v0, "Can\'t share while sharing is in progress"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 165
    :goto_2
    return-void
.end method
