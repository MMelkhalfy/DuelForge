.class public Lcom/getcapacitor/Plugin;
.super Ljava/lang/Object;
.source "Plugin.java"


# static fields
.field private static final BUNDLE_PERSISTED_OPTIONS_JSON_KEY:Ljava/lang/String; = "_json"


# instance fields
.field private final activityLaunchers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;>;"
        }
    .end annotation
.end field

.field protected bridge:Lcom/getcapacitor/Bridge;

.field private final eventListeners:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/getcapacitor/PluginCall;",
            ">;>;"
        }
    .end annotation
.end field

.field protected handle:Lcom/getcapacitor/PluginHandle;

.field private lastPluginCallId:Ljava/lang/String;

.field private final permissionLaunchers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroidx/activity/result/ActivityResultLauncher<",
            "[",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private final retainedEventArguments:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/getcapacitor/JSObject;",
            ">;>;"
        }
    .end annotation
.end field

.field protected savedLastCall:Lcom/getcapacitor/PluginCall;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method public static synthetic $r8$lambda$7dmJ1HQ3Jrtmh-tOCDedcONSntE(Lcom/getcapacitor/Plugin;Ljava/lang/reflect/Method;Landroidx/activity/result/ActivityResult;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/Plugin;->lambda$initializeActivityLaunchers$0(Ljava/lang/reflect/Method;Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method public static synthetic $r8$lambda$MIUdFOWJqxyaYOIiq89xIboPNcM(Lcom/getcapacitor/Plugin;Ljava/lang/reflect/Method;Ljava/util/Map;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/Plugin;->lambda$initializeActivityLaunchers$1(Ljava/lang/reflect/Method;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->activityLaunchers:Ljava/util/Map;

    .line 79
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->permissionLaunchers:Ljava/util/Map;

    .line 88
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    .line 89
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->retainedEventArguments:Ljava/util/Map;

    .line 90
    return-void
.end method

.method private addEventListener(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "call"    # Lcom/getcapacitor/PluginCall;

    .line 632
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 633
    .local v0, "listeners":Ljava/util/List;, "Ljava/util/List<Lcom/getcapacitor/PluginCall;>;"
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    .line 642
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 634
    :cond_1
    :goto_0
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v1

    .line 635
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 640
    invoke-direct {p0, p1}, Lcom/getcapacitor/Plugin;->sendRetainedArgumentsForEvent(Ljava/lang/String;)V

    .line 644
    :goto_1
    return-void
.end method

.method private getActivityLauncherOrReject(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 4
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/PluginCall;",
            "Ljava/lang/String;",
            ")",
            "Landroidx/activity/result/ActivityResultLauncher<",
            "Landroid/content/Intent;",
            ">;"
        }
    .end annotation

    .line 527
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->activityLaunchers:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/activity/result/ActivityResultLauncher;

    .line 530
    .local v0, "activityLauncher":Landroidx/activity/result/ActivityResultLauncher;, "Landroidx/activity/result/ActivityResultLauncher<Landroid/content/Intent;>;"
    if-nez v0, :cond_0

    .line 531
    const-string v1, "There is no ActivityCallback method registered for the name: %s. Please define a callback method annotated with @ActivityCallback that receives arguments: (PluginCall, ActivityResult)"

    .line 535
    .local v1, "registerError":Ljava/lang/String;
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 536
    invoke-static {v1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    .line 537
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 538
    const/4 v2, 0x0

    return-object v2

    .line 541
    .end local v1    # "registerError":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method private getPermissionLauncherOrReject(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)Landroidx/activity/result/ActivityResultLauncher;
    .locals 4
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .param p2, "methodName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getcapacitor/PluginCall;",
            "Ljava/lang/String;",
            ")",
            "Landroidx/activity/result/ActivityResultLauncher<",
            "[",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 553
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->permissionLaunchers:Ljava/util/Map;

    invoke-interface {v0, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/activity/result/ActivityResultLauncher;

    .line 556
    .local v0, "permissionLauncher":Landroidx/activity/result/ActivityResultLauncher;, "Landroidx/activity/result/ActivityResultLauncher<[Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 557
    const-string v1, "There is no PermissionCallback method registered for the name: %s. Please define a callback method annotated with @PermissionCallback that receives arguments: (PluginCall)"

    .line 561
    .local v1, "registerError":Ljava/lang/String;
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v1, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 562
    invoke-static {v1}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    .line 563
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 564
    const/4 v2, 0x0

    return-object v2

    .line 567
    .end local v1    # "registerError":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method private getPermissionStringsForAliases([Ljava/lang/String;)[Ljava/lang/String;
    .locals 9
    .param p1, "aliases"    # [Ljava/lang/String;

    .line 503
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    .line 504
    .local v0, "annotation":Lcom/getcapacitor/annotation/CapacitorPlugin;
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 505
    .local v1, "perms":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 506
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v3

    array-length v4, v3

    move v5, v2

    :goto_0
    if-ge v5, v4, :cond_2

    aget-object v6, v3, v5

    .line 507
    .local v6, "perm":Lcom/getcapacitor/annotation/Permission;
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-interface {v6}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 508
    invoke-interface {v6}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 506
    .end local v6    # "perm":Lcom/getcapacitor/annotation/Permission;
    :cond_0
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 512
    :cond_1
    iget-object v3, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v3}, Lcom/getcapacitor/PluginHandle;->getId()Ljava/lang/String;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const-string v4, "getPermissionStringsForAliases: missing @CapacitorPlugin annotation for plugin %s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/getcapacitor/Logger;->warn(Ljava/lang/String;)V

    .line 515
    :cond_2
    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    return-object v2
.end method

.method private handleLegacyPermission(Lcom/getcapacitor/PluginCall;)V
    .locals 3
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;

    .line 882
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getLegacyPluginAnnotation()Lcom/getcapacitor/NativePlugin;

    move-result-object v0

    .line 883
    .local v0, "legacyAnnotation":Lcom/getcapacitor/NativePlugin;
    invoke-interface {v0}, Lcom/getcapacitor/NativePlugin;->permissions()[Ljava/lang/String;

    move-result-object v1

    .line 884
    .local v1, "perms":[Ljava/lang/String;
    array-length v2, v1

    if-lez v2, :cond_0

    .line 885
    invoke-virtual {p0, p1}, Lcom/getcapacitor/Plugin;->saveCall(Lcom/getcapacitor/PluginCall;)V

    .line 886
    invoke-interface {v0}, Lcom/getcapacitor/NativePlugin;->permissionRequestCode()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/getcapacitor/Plugin;->pluginRequestPermissions([Ljava/lang/String;I)V

    goto :goto_0

    .line 888
    :cond_0
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 890
    :goto_0
    return-void
.end method

.method private synthetic lambda$initializeActivityLaunchers$0(Ljava/lang/reflect/Method;Landroidx/activity/result/ActivityResult;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "result"    # Landroidx/activity/result/ActivityResult;

    .line 117
    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/Plugin;->triggerActivityCallback(Ljava/lang/reflect/Method;Landroidx/activity/result/ActivityResult;)V

    return-void
.end method

.method private synthetic lambda$initializeActivityLaunchers$1(Ljava/lang/reflect/Method;Ljava/util/Map;)V
    .locals 0
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "permissions"    # Ljava/util/Map;

    .line 125
    invoke-direct {p0, p1, p2}, Lcom/getcapacitor/Plugin;->triggerPermissionCallback(Ljava/lang/reflect/Method;Ljava/util/Map;)V

    return-void
.end method

.method private permissionActivityResult(Lcom/getcapacitor/PluginCall;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .param p2, "permissionStrings"    # [Ljava/lang/String;
    .param p3, "callbackName"    # Ljava/lang/String;

    .line 186
    invoke-direct {p0, p1, p3}, Lcom/getcapacitor/Plugin;->getPermissionLauncherOrReject(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    .line 187
    .local v0, "permissionResultLauncher":Landroidx/activity/result/ActivityResultLauncher;, "Landroidx/activity/result/ActivityResultLauncher<[Ljava/lang/String;>;"
    if-nez v0, :cond_0

    .line 189
    return-void

    .line 192
    :cond_0
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v1, p1}, Lcom/getcapacitor/Bridge;->savePermissionCall(Lcom/getcapacitor/PluginCall;)V

    .line 193
    invoke-virtual {v0, p2}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .line 194
    return-void
.end method

.method private removeEventListener(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V
    .locals 1
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "call"    # Lcom/getcapacitor/PluginCall;

    .line 652
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 653
    .local v0, "listeners":Ljava/util/List;, "Ljava/util/List<Lcom/getcapacitor/PluginCall;>;"
    if-nez v0, :cond_0

    .line 654
    return-void

    .line 657
    :cond_0
    invoke-interface {v0, p2}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 658
    return-void
.end method

.method private sendRetainedArgumentsForEvent(Ljava/lang/String;)V
    .locals 3
    .param p1, "eventName"    # Ljava/lang/String;

    .line 718
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->retainedEventArguments:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 719
    .local v0, "retainedArgs":Ljava/util/List;, "Ljava/util/List<Lcom/getcapacitor/JSObject;>;"
    if-nez v0, :cond_0

    .line 720
    return-void

    .line 723
    :cond_0
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->retainedEventArguments:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 725
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getcapacitor/JSObject;

    .line 726
    .local v2, "retained":Lcom/getcapacitor/JSObject;
    invoke-virtual {p0, p1, v2}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V

    .line 727
    .end local v2    # "retained":Lcom/getcapacitor/JSObject;
    goto :goto_0

    .line 728
    :cond_1
    return-void
.end method

.method private triggerActivityCallback(Ljava/lang/reflect/Method;Landroidx/activity/result/ActivityResult;)V
    .locals 2
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .param p2, "result"    # Landroidx/activity/result/ActivityResult;

    .line 148
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->lastPluginCallId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge;->getSavedCall(Ljava/lang/String;)Lcom/getcapacitor/PluginCall;

    move-result-object v0

    .line 149
    .local v0, "savedCall":Lcom/getcapacitor/PluginCall;
    if-nez v0, :cond_0

    .line 150
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v1}, Lcom/getcapacitor/Bridge;->getPluginCallForLastActivity()Lcom/getcapacitor/PluginCall;

    move-result-object v0

    .line 154
    :cond_0
    const/4 v1, 0x1

    :try_start_0
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 155
    filled-new-array {v0, p2}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 158
    goto :goto_1

    .line 156
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 157
    .local v1, "e":Ljava/lang/ReflectiveOperationException;
    :goto_0
    invoke-virtual {v1}, Ljava/lang/ReflectiveOperationException;->printStackTrace()V

    .line 159
    .end local v1    # "e":Ljava/lang/ReflectiveOperationException;
    :goto_1
    return-void
.end method

.method private triggerPermissionCallback(Ljava/lang/reflect/Method;Ljava/util/Map;)V
    .locals 2
    .param p1, "method"    # Ljava/lang/reflect/Method;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/reflect/Method;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 134
    .local p2, "permissionResultMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Boolean;>;"
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v1}, Lcom/getcapacitor/PluginHandle;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge;->getPermissionCall(Ljava/lang/String;)Lcom/getcapacitor/PluginCall;

    move-result-object v0

    .line 137
    .local v0, "savedCall":Lcom/getcapacitor/PluginCall;
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v1, p0, v0, p2}, Lcom/getcapacitor/Bridge;->validatePermissions(Lcom/getcapacitor/Plugin;Lcom/getcapacitor/PluginCall;Ljava/util/Map;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 139
    const/4 v1, 0x1

    :try_start_0
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 140
    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    goto :goto_1

    .line 141
    :catch_0
    move-exception v1

    goto :goto_0

    :catch_1
    move-exception v1

    .line 142
    .local v1, "e":Ljava/lang/ReflectiveOperationException;
    :goto_0
    invoke-virtual {v1}, Ljava/lang/ReflectiveOperationException;->printStackTrace()V

    .line 145
    .end local v1    # "e":Ljava/lang/ReflectiveOperationException;
    :cond_0
    :goto_1
    return-void
.end method


# virtual methods
.method public addListener(Lcom/getcapacitor/PluginCall;)V
    .locals 2
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .annotation runtime Lcom/getcapacitor/PluginMethod;
        returnType = "none"
    .end annotation

    .line 737
    const-string v0, "eventName"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 738
    .local v0, "eventName":Ljava/lang/String;
    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->setKeepAlive(Ljava/lang/Boolean;)V

    .line 739
    invoke-direct {p0, v0, p1}, Lcom/getcapacitor/Plugin;->addEventListener(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    .line 740
    return-void
.end method

.method public checkPermissions(Lcom/getcapacitor/PluginCall;)V
    .locals 6
    .param p1, "pluginCall"    # Lcom/getcapacitor/PluginCall;
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .annotation runtime Lcom/getcapacitor/annotation/PermissionCallback;
    .end annotation

    .line 783
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getPermissionStates()Ljava/util/Map;

    move-result-object v0

    .line 785
    .local v0, "permissionsResult":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getcapacitor/PermissionState;>;"
    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v1

    if-nez v1, :cond_0

    .line 787
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    goto :goto_1

    .line 789
    :cond_0
    new-instance v1, Lcom/getcapacitor/JSObject;

    invoke-direct {v1}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 790
    .local v1, "permissionsResultJSON":Lcom/getcapacitor/JSObject;
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 791
    .local v3, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/getcapacitor/PermissionState;>;"
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lcom/getcapacitor/JSObject;

    .line 792
    .end local v3    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/getcapacitor/PermissionState;>;"
    goto :goto_0

    .line 794
    :cond_1
    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    .line 796
    .end local v1    # "permissionsResultJSON":Lcom/getcapacitor/JSObject;
    :goto_1
    return-void
.end method

.method public execute(Ljava/lang/Runnable;)V
    .locals 1
    .param p1, "runnable"    # Ljava/lang/Runnable;

    .line 1038
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, p1}, Lcom/getcapacitor/Bridge;->execute(Ljava/lang/Runnable;)V

    .line 1039
    return-void
.end method

.method public freeSavedCall()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 274
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, v1}, Lcom/getcapacitor/PluginCall;->release(Lcom/getcapacitor/Bridge;)V

    .line 275
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    .line 276
    return-void
.end method

.method public getActivity()Landroidx/appcompat/app/AppCompatActivity;
    .locals 1

    .line 209
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    return-object v0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .line 253
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBridge()Lcom/getcapacitor/Bridge;
    .locals 1

    .line 224
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    return-object v0
.end method

.method public getConfig()Lcom/getcapacitor/PluginConfig;
    .locals 2

    .line 296
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getConfig()Lcom/getcapacitor/CapConfig;

    move-result-object v0

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v1}, Lcom/getcapacitor/PluginHandle;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/getcapacitor/CapConfig;->getPluginConfiguration(Ljava/lang/String;)Lcom/getcapacitor/PluginConfig;

    move-result-object v0

    return-object v0
.end method

.method public getConfigValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 310
    :try_start_0
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getConfig()Lcom/getcapacitor/PluginConfig;

    move-result-object v0

    .line 311
    .local v0, "pluginConfig":Lcom/getcapacitor/PluginConfig;
    invoke-virtual {v0}, Lcom/getcapacitor/PluginConfig;->getConfigJSON()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    .line 312
    .end local v0    # "pluginConfig":Lcom/getcapacitor/PluginConfig;
    :catch_0
    move-exception v0

    .line 313
    .local v0, "ex":Lorg/json/JSONException;
    const/4 v1, 0x0

    return-object v1
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    .line 201
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method protected getLogTag()Ljava/lang/String;
    .locals 3

    .line 1053
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs getLogTag([Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "subTags"    # [Ljava/lang/String;

    .line 1046
    invoke-static {p1}, Lcom/getcapacitor/Logger;->tags([Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPermissionState(Ljava/lang/String;)Lcom/getcapacitor/PermissionState;
    .locals 1
    .param p1, "alias"    # Ljava/lang/String;

    .line 613
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getPermissionStates()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getcapacitor/PermissionState;

    return-object v0
.end method

.method public getPermissionStates()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/getcapacitor/PermissionState;",
            ">;"
        }
    .end annotation

    .line 623
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, p0}, Lcom/getcapacitor/Bridge;->getPermissionStates(Lcom/getcapacitor/Plugin;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getPluginHandle()Lcom/getcapacitor/PluginHandle;
    .locals 1

    .line 245
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    return-object v0
.end method

.method public getSavedCall()Lcom/getcapacitor/PluginCall;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 286
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    return-object v0
.end method

.method protected handleOnActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 962
    return-void
.end method

.method protected handleOnConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .line 974
    return-void
.end method

.method protected handleOnDestroy()V
    .locals 0

    .line 1004
    return-void
.end method

.method protected handleOnNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .line 968
    return-void
.end method

.method protected handleOnPause()V
    .locals 0

    .line 994
    return-void
.end method

.method protected handleOnRestart()V
    .locals 0

    .line 984
    return-void
.end method

.method protected handleOnResume()V
    .locals 0

    .line 989
    return-void
.end method

.method protected handleOnStart()V
    .locals 0

    .line 979
    return-void
.end method

.method protected handleOnStop()V
    .locals 0

    .line 999
    return-void
.end method

.method protected handleRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 7
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 904
    invoke-virtual {p0, p2}, Lcom/getcapacitor/Plugin;->hasDefinedPermissions([Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 905
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 906
    .local v0, "builder":Ljava/lang/StringBuilder;
    const-string v1, "Missing the following permissions in AndroidManifest.xml:\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 907
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/getcapacitor/util/PermissionHelper;->getUndefinedPermissions(Landroid/content/Context;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 908
    .local v1, "missing":[Ljava/lang/String;
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    .line 909
    .local v4, "perm":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "\n"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 908
    .end local v4    # "perm":Ljava/lang/String;
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 911
    :cond_0
    iget-object v2, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    .line 912
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    .line 914
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v1    # "missing":[Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public hasDefinedPermissions([Ljava/lang/String;)Z
    .locals 5
    .param p1, "permissions"    # [Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 326
    array-length v0, p1

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-object v3, p1, v2

    .line 327
    .local v3, "permission":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/getcapacitor/util/PermissionHelper;->hasDefinedPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 328
    return v1

    .line 326
    .end local v3    # "permission":Ljava/lang/String;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 331
    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public hasDefinedRequiredPermissions()Z
    .locals 11
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 342
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    .line 343
    .local v0, "annotation":Lcom/getcapacitor/annotation/CapacitorPlugin;
    if-nez v0, :cond_0

    .line 345
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v1}, Lcom/getcapacitor/PluginHandle;->getLegacyPluginAnnotation()Lcom/getcapacitor/NativePlugin;

    move-result-object v1

    .line 346
    .local v1, "legacyAnnotation":Lcom/getcapacitor/NativePlugin;
    invoke-interface {v1}, Lcom/getcapacitor/NativePlugin;->permissions()[Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/getcapacitor/Plugin;->hasDefinedPermissions([Ljava/lang/String;)Z

    move-result v2

    return v2

    .line 348
    .end local v1    # "legacyAnnotation":Lcom/getcapacitor/NativePlugin;
    :cond_0
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_3

    aget-object v5, v1, v4

    .line 349
    .local v5, "perm":Lcom/getcapacitor/annotation/Permission;
    invoke-interface {v5}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v6

    array-length v7, v6

    move v8, v3

    :goto_1
    if-ge v8, v7, :cond_2

    aget-object v9, v6, v8

    .line 350
    .local v9, "permString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v10

    invoke-static {v10, v9}, Lcom/getcapacitor/util/PermissionHelper;->hasDefinedPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_1

    .line 351
    return v3

    .line 349
    .end local v9    # "permString":Ljava/lang/String;
    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 348
    .end local v5    # "perm":Lcom/getcapacitor/annotation/Permission;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 357
    :cond_3
    const/4 v1, 0x1

    return v1
.end method

.method protected hasListeners(Ljava/lang/String;)Z
    .locals 2
    .param p1, "eventName"    # Ljava/lang/String;

    .line 704
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 705
    .local v0, "listeners":Ljava/util/List;, "Ljava/util/List<Lcom/getcapacitor/PluginCall;>;"
    if-nez v0, :cond_0

    .line 706
    const/4 v1, 0x0

    return v1

    .line 708
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    return v1
.end method

.method public hasPermission(Ljava/lang/String;)Z
    .locals 1
    .param p1, "permission"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 396
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public hasRequiredPermissions()Z
    .locals 12
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 409
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    .line 410
    .local v0, "annotation":Lcom/getcapacitor/annotation/CapacitorPlugin;
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2

    .line 412
    iget-object v3, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v3}, Lcom/getcapacitor/PluginHandle;->getLegacyPluginAnnotation()Lcom/getcapacitor/NativePlugin;

    move-result-object v3

    .line 413
    .local v3, "legacyAnnotation":Lcom/getcapacitor/NativePlugin;
    invoke-interface {v3}, Lcom/getcapacitor/NativePlugin;->permissions()[Ljava/lang/String;

    move-result-object v4

    array-length v5, v4

    move v6, v2

    :goto_0
    if-ge v6, v5, :cond_1

    aget-object v7, v4, v6

    .line 414
    .local v7, "perm":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8, v7}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v8

    if-eqz v8, :cond_0

    .line 415
    return v2

    .line 413
    .end local v7    # "perm":Ljava/lang/String;
    :cond_0
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 419
    :cond_1
    return v1

    .line 422
    .end local v3    # "legacyAnnotation":Lcom/getcapacitor/NativePlugin;
    :cond_2
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v3

    array-length v4, v3

    move v5, v2

    :goto_1
    if-ge v5, v4, :cond_5

    aget-object v6, v3, v5

    .line 423
    .local v6, "perm":Lcom/getcapacitor/annotation/Permission;
    invoke-interface {v6}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v7

    array-length v8, v7

    move v9, v2

    :goto_2
    if-ge v9, v8, :cond_4

    aget-object v10, v7, v9

    .line 424
    .local v10, "permString":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v11

    invoke-static {v11, v10}, Landroidx/core/app/ActivityCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v11

    if-eqz v11, :cond_3

    .line 425
    return v2

    .line 423
    .end local v10    # "permString":Ljava/lang/String;
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 422
    .end local v6    # "perm":Lcom/getcapacitor/annotation/Permission;
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 430
    :cond_5
    return v1
.end method

.method initializeActivityLaunchers()V
    .locals 6

    .line 103
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .local v0, "pluginClassMethods":Ljava/util/List;, "Ljava/util/List<Ljava/lang/reflect/Method;>;"
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 106
    .local v1, "pluginCursor":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :goto_0
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-class v3, Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 109
    invoke-virtual {v1}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 107
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_0

    .line 112
    .end local v1    # "pluginCursor":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/reflect/Method;

    .line 113
    .local v2, "method":Ljava/lang/reflect/Method;
    const-class v3, Lcom/getcapacitor/annotation/ActivityCallback;

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 115
    iget-object v3, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    new-instance v4, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;

    invoke-direct {v4}, Landroidx/activity/result/contract/ActivityResultContracts$StartActivityForResult;-><init>()V

    new-instance v5, Lcom/getcapacitor/Plugin$$ExternalSyntheticLambda0;

    invoke-direct {v5, p0, v2}, Lcom/getcapacitor/Plugin$$ExternalSyntheticLambda0;-><init>(Lcom/getcapacitor/Plugin;Ljava/lang/reflect/Method;)V

    invoke-virtual {v3, v4, v5}, Lcom/getcapacitor/Bridge;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v3

    .line 120
    .local v3, "launcher":Landroidx/activity/result/ActivityResultLauncher;, "Landroidx/activity/result/ActivityResultLauncher<Landroid/content/Intent;>;"
    iget-object v4, p0, Lcom/getcapacitor/Plugin;->activityLaunchers:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .end local v3    # "launcher":Landroidx/activity/result/ActivityResultLauncher;, "Landroidx/activity/result/ActivityResultLauncher<Landroid/content/Intent;>;"
    goto :goto_2

    .line 121
    :cond_1
    const-class v3, Lcom/getcapacitor/annotation/PermissionCallback;

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Method;->isAnnotationPresent(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 123
    iget-object v3, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    new-instance v4, Landroidx/activity/result/contract/ActivityResultContracts$RequestMultiplePermissions;

    invoke-direct {v4}, Landroidx/activity/result/contract/ActivityResultContracts$RequestMultiplePermissions;-><init>()V

    new-instance v5, Lcom/getcapacitor/Plugin$$ExternalSyntheticLambda1;

    invoke-direct {v5, p0, v2}, Lcom/getcapacitor/Plugin$$ExternalSyntheticLambda1;-><init>(Lcom/getcapacitor/Plugin;Ljava/lang/reflect/Method;)V

    invoke-virtual {v3, v4, v5}, Lcom/getcapacitor/Bridge;->registerForActivityResult(Landroidx/activity/result/contract/ActivityResultContract;Landroidx/activity/result/ActivityResultCallback;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v3

    .line 128
    .local v3, "launcher":Landroidx/activity/result/ActivityResultLauncher;, "Landroidx/activity/result/ActivityResultLauncher<[Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/getcapacitor/Plugin;->permissionLaunchers:Ljava/util/Map;

    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 121
    .end local v3    # "launcher":Landroidx/activity/result/ActivityResultLauncher;, "Landroidx/activity/result/ActivityResultLauncher<[Ljava/lang/String;>;"
    :cond_2
    :goto_2
    nop

    .line 130
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :goto_3
    goto :goto_1

    .line 131
    :cond_3
    return-void
.end method

.method public isPermissionDeclared(Ljava/lang/String;)Z
    .locals 9
    .param p1, "alias"    # Ljava/lang/String;

    .line 366
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    .line 367
    .local v0, "annotation":Lcom/getcapacitor/annotation/CapacitorPlugin;
    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 368
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v2

    array-length v3, v2

    move v4, v1

    :goto_0
    if-ge v4, v3, :cond_3

    aget-object v5, v2, v4

    .line 369
    .local v5, "perm":Lcom/getcapacitor/annotation/Permission;
    invoke-interface {v5}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p1, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 370
    const/4 v2, 0x1

    .line 371
    .local v2, "result":Z
    invoke-interface {v5}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    move v6, v1

    :goto_1
    if-ge v6, v4, :cond_1

    aget-object v7, v3, v6

    .line 372
    .local v7, "permString":Ljava/lang/String;
    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-static {v8, v7}, Lcom/getcapacitor/util/PermissionHelper;->hasDefinedPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    const/4 v8, 0x1

    goto :goto_2

    :cond_0
    move v8, v1

    :goto_2
    move v2, v8

    .line 371
    .end local v7    # "permString":Ljava/lang/String;
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 375
    :cond_1
    return v2

    .line 368
    .end local v2    # "result":Z
    .end local v5    # "perm":Lcom/getcapacitor/annotation/Permission;
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 380
    :cond_3
    const-string v2, "isPermissionDeclared: No alias defined for %s or missing @CapacitorPlugin annotation."

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    .line 381
    return v1
.end method

.method public load()V
    .locals 0

    .line 96
    return-void
.end method

.method protected notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;)V
    .locals 1
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "data"    # Lcom/getcapacitor/JSObject;

    .line 697
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/getcapacitor/Plugin;->notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V

    .line 698
    return-void
.end method

.method protected notifyListeners(Ljava/lang/String;Lcom/getcapacitor/JSObject;Z)V
    .locals 4
    .param p1, "eventName"    # Ljava/lang/String;
    .param p2, "data"    # Lcom/getcapacitor/JSObject;
    .param p3, "retainUntilConsumed"    # Z

    .line 666
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getLogTag()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Notifying listeners for event "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/getcapacitor/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 667
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 668
    .local v0, "listeners":Ljava/util/List;, "Ljava/util/List<Lcom/getcapacitor/PluginCall;>;"
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 683
    :cond_0
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1, v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>(Ljava/util/Collection;)V

    .line 684
    .local v1, "listenersCopy":Ljava/util/concurrent/CopyOnWriteArrayList;, "Ljava/util/concurrent/CopyOnWriteArrayList<Lcom/getcapacitor/PluginCall;>;"
    invoke-virtual {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getcapacitor/PluginCall;

    .line 685
    .local v3, "call":Lcom/getcapacitor/PluginCall;
    invoke-virtual {v3, p2}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    .line 686
    .end local v3    # "call":Lcom/getcapacitor/PluginCall;
    goto :goto_0

    .line 687
    :cond_1
    return-void

    .line 669
    .end local v1    # "listenersCopy":Ljava/util/concurrent/CopyOnWriteArrayList;, "Ljava/util/concurrent/CopyOnWriteArrayList<Lcom/getcapacitor/PluginCall;>;"
    :cond_2
    :goto_1
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getLogTag()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No listeners found for event "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/getcapacitor/Logger;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 670
    if-eqz p3, :cond_4

    .line 671
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->retainedEventArguments:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    .line 673
    .local v1, "argList":Ljava/util/List;, "Ljava/util/List<Lcom/getcapacitor/JSObject;>;"
    if-nez v1, :cond_3

    .line 674
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    move-object v1, v2

    .line 677
    :cond_3
    invoke-interface {v1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 678
    iget-object v2, p0, Lcom/getcapacitor/Plugin;->retainedEventArguments:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 680
    .end local v1    # "argList":Ljava/util/List;, "Ljava/util/List<Lcom/getcapacitor/JSObject;>;"
    :cond_4
    return-void
.end method

.method public pluginRequestAllPermissions()V
    .locals 4
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 577
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getLegacyPluginAnnotation()Lcom/getcapacitor/NativePlugin;

    move-result-object v0

    .line 578
    .local v0, "legacyAnnotation":Lcom/getcapacitor/NativePlugin;
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v1

    invoke-interface {v0}, Lcom/getcapacitor/NativePlugin;->permissions()[Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lcom/getcapacitor/NativePlugin;->permissionRequestCode()I

    move-result v3

    invoke-static {v1, v2, v3}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 579
    return-void
.end method

.method public pluginRequestPermission(Ljava/lang/String;I)V
    .locals 3
    .param p1, "permission"    # Ljava/lang/String;
    .param p2, "requestCode"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 590
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1, p2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 591
    return-void
.end method

.method public pluginRequestPermissions([Ljava/lang/String;I)V
    .locals 1
    .param p1, "permissions"    # [Ljava/lang/String;
    .param p2, "requestCode"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 603
    invoke-virtual {p0}, Lcom/getcapacitor/Plugin;->getActivity()Landroidx/appcompat/app/AppCompatActivity;

    move-result-object v0

    invoke-static {v0, p1, p2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 604
    return-void
.end method

.method public removeAllListeners()V
    .locals 1

    .line 770
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 771
    return-void
.end method

.method public removeAllListeners(Lcom/getcapacitor/PluginCall;)V
    .locals 1
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .annotation runtime Lcom/getcapacitor/PluginMethod;
        returnType = "promise"
    .end annotation

    .line 765
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->eventListeners:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 766
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 767
    return-void
.end method

.method public removeListener(Lcom/getcapacitor/PluginCall;)V
    .locals 4
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .annotation runtime Lcom/getcapacitor/PluginMethod;
        returnType = "none"
    .end annotation

    .line 749
    const-string v0, "eventName"

    invoke-virtual {p1, v0}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 750
    .local v0, "eventName":Ljava/lang/String;
    const-string v1, "callbackId"

    invoke-virtual {p1, v1}, Lcom/getcapacitor/PluginCall;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 751
    .local v1, "callbackId":Ljava/lang/String;
    iget-object v2, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v2, v1}, Lcom/getcapacitor/Bridge;->getSavedCall(Ljava/lang/String;)Lcom/getcapacitor/PluginCall;

    move-result-object v2

    .line 752
    .local v2, "savedCall":Lcom/getcapacitor/PluginCall;
    if-eqz v2, :cond_0

    .line 753
    invoke-direct {p0, v0, v2}, Lcom/getcapacitor/Plugin;->removeEventListener(Ljava/lang/String;Lcom/getcapacitor/PluginCall;)V

    .line 754
    iget-object v3, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v3, v2}, Lcom/getcapacitor/Bridge;->releaseCall(Lcom/getcapacitor/PluginCall;)V

    .line 756
    :cond_0
    return-void
.end method

.method protected requestAllPermissions(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V
    .locals 8
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .param p2, "callbackName"    # Ljava/lang/String;

    .line 445
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    .line 446
    .local v0, "annotation":Lcom/getcapacitor/annotation/CapacitorPlugin;
    if-eqz v0, :cond_1

    .line 447
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 448
    .local v1, "perms":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v2

    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_0

    aget-object v6, v2, v5

    .line 449
    .local v6, "perm":Lcom/getcapacitor/annotation/Permission;
    invoke-interface {v6}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 448
    .end local v6    # "perm":Lcom/getcapacitor/annotation/Permission;
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 452
    :cond_0
    new-array v2, v4, [Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/util/HashSet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    invoke-direct {p0, p1, v2, p2}, Lcom/getcapacitor/Plugin;->permissionActivityResult(Lcom/getcapacitor/PluginCall;[Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    .end local v1    # "perms":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_1
    return-void
.end method

.method protected requestPermissionForAlias(Ljava/lang/String;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V
    .locals 2
    .param p1, "alias"    # Ljava/lang/String;
    .param p2, "call"    # Lcom/getcapacitor/PluginCall;
    .param p3, "callbackName"    # Ljava/lang/String;

    .line 468
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    invoke-virtual {p0, v0, p2, p3}, Lcom/getcapacitor/Plugin;->requestPermissionForAliases([Ljava/lang/String;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V

    .line 469
    return-void
.end method

.method protected requestPermissionForAliases([Ljava/lang/String;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V
    .locals 2
    .param p1, "aliases"    # [Ljava/lang/String;
    .param p2, "call"    # Lcom/getcapacitor/PluginCall;
    .param p3, "callbackName"    # Ljava/lang/String;

    .line 483
    array-length v0, p1

    if-nez v0, :cond_0

    .line 484
    const-string v0, "No permission alias was provided"

    invoke-static {v0}, Lcom/getcapacitor/Logger;->error(Ljava/lang/String;)V

    .line 485
    return-void

    .line 488
    :cond_0
    invoke-direct {p0, p1}, Lcom/getcapacitor/Plugin;->getPermissionStringsForAliases([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 490
    .local v0, "permissions":[Ljava/lang/String;
    array-length v1, v0

    if-lez v1, :cond_1

    .line 491
    invoke-direct {p0, p2, v0, p3}, Lcom/getcapacitor/Plugin;->permissionActivityResult(Lcom/getcapacitor/PluginCall;[Ljava/lang/String;Ljava/lang/String;)V

    .line 493
    :cond_1
    return-void
.end method

.method public requestPermissions(Lcom/getcapacitor/PluginCall;)V
    .locals 13
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .annotation runtime Lcom/getcapacitor/PluginMethod;
    .end annotation

    .line 809
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    invoke-virtual {v0}, Lcom/getcapacitor/PluginHandle;->getPluginAnnotation()Lcom/getcapacitor/annotation/CapacitorPlugin;

    move-result-object v0

    .line 810
    .local v0, "annotation":Lcom/getcapacitor/annotation/CapacitorPlugin;
    if-nez v0, :cond_0

    .line 811
    invoke-direct {p0, p1}, Lcom/getcapacitor/Plugin;->handleLegacyPermission(Lcom/getcapacitor/PluginCall;)V

    goto/16 :goto_8

    .line 814
    :cond_0
    const/4 v1, 0x0

    .line 815
    .local v1, "permAliases":[Ljava/lang/String;
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 819
    .local v2, "autoGrantPerms":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v3, "permissions"

    invoke-virtual {p1, v3}, Lcom/getcapacitor/PluginCall;->getArray(Ljava/lang/String;)Lcom/getcapacitor/JSArray;

    move-result-object v3

    .line 820
    .local v3, "providedPerms":Lcom/getcapacitor/JSArray;
    const/4 v4, 0x0

    .line 822
    .local v4, "providedPermsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v3, :cond_1

    .line 824
    :try_start_0
    invoke-virtual {v3}, Lcom/getcapacitor/JSArray;->toList()Ljava/util/List;

    move-result-object v5
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v4, v5

    .line 827
    goto :goto_0

    .line 825
    :catch_0
    move-exception v5

    .line 831
    :cond_1
    :goto_0
    new-instance v5, Ljava/util/HashSet;

    invoke-direct {v5}, Ljava/util/HashSet;-><init>()V

    .line 832
    .local v5, "aliasSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const/4 v6, 0x0

    if-eqz v4, :cond_6

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_2

    goto :goto_2

    .line 847
    :cond_2
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v7

    array-length v8, v7

    move v9, v6

    :goto_1
    if-ge v9, v8, :cond_4

    aget-object v10, v7, v9

    .line 848
    .local v10, "perm":Lcom/getcapacitor/annotation/Permission;
    invoke-interface {v10}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v4, v11}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_3

    .line 849
    invoke-interface {v10}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v5, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 847
    .end local v10    # "perm":Lcom/getcapacitor/annotation/Permission;
    :cond_3
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 853
    :cond_4
    invoke-interface {v5}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_5

    .line 854
    const-string v6, "No valid permission alias was requested of this plugin."

    invoke-virtual {p1, v6}, Lcom/getcapacitor/PluginCall;->reject(Ljava/lang/String;)V

    goto :goto_6

    .line 856
    :cond_5
    new-array v6, v6, [Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    move-object v1, v6

    check-cast v1, [Ljava/lang/String;

    goto :goto_6

    .line 833
    :cond_6
    :goto_2
    invoke-interface {v0}, Lcom/getcapacitor/annotation/CapacitorPlugin;->permissions()[Lcom/getcapacitor/annotation/Permission;

    move-result-object v7

    array-length v8, v7

    move v9, v6

    :goto_3
    if-ge v9, v8, :cond_a

    aget-object v10, v7, v9

    .line 836
    .restart local v10    # "perm":Lcom/getcapacitor/annotation/Permission;
    invoke-interface {v10}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v11

    array-length v11, v11

    if-eqz v11, :cond_8

    invoke-interface {v10}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v11

    array-length v11, v11

    const/4 v12, 0x1

    if-ne v11, v12, :cond_7

    invoke-interface {v10}, Lcom/getcapacitor/annotation/Permission;->strings()[Ljava/lang/String;

    move-result-object v11

    aget-object v11, v11, v6

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_7

    goto :goto_4

    .line 841
    :cond_7
    invoke-interface {v10}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v5, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 837
    :cond_8
    :goto_4
    invoke-interface {v10}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_9

    .line 838
    invoke-interface {v10}, Lcom/getcapacitor/annotation/Permission;->alias()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v2, v11}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 833
    .end local v10    # "perm":Lcom/getcapacitor/annotation/Permission;
    :cond_9
    :goto_5
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 845
    :cond_a
    new-array v6, v6, [Ljava/lang/String;

    invoke-interface {v5, v6}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v6

    move-object v1, v6

    check-cast v1, [Ljava/lang/String;

    .line 860
    :goto_6
    if-eqz v1, :cond_b

    array-length v6, v1

    if-lez v6, :cond_b

    .line 862
    const-string v6, "checkPermissions"

    invoke-virtual {p0, v1, p1, v6}, Lcom/getcapacitor/Plugin;->requestPermissionForAliases([Ljava/lang/String;Lcom/getcapacitor/PluginCall;Ljava/lang/String;)V

    goto :goto_8

    .line 863
    :cond_b
    invoke-interface {v2}, Ljava/util/Set;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_d

    .line 865
    new-instance v6, Lcom/getcapacitor/JSObject;

    invoke-direct {v6}, Lcom/getcapacitor/JSObject;-><init>()V

    .line 867
    .local v6, "permissionsResults":Lcom/getcapacitor/JSObject;
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_7
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_c

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 868
    .local v8, "perm":Ljava/lang/String;
    sget-object v9, Lcom/getcapacitor/PermissionState;->GRANTED:Lcom/getcapacitor/PermissionState;

    invoke-virtual {v9}, Lcom/getcapacitor/PermissionState;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lcom/getcapacitor/JSObject;->put(Ljava/lang/String;Ljava/lang/String;)Lcom/getcapacitor/JSObject;

    .line 869
    .end local v8    # "perm":Ljava/lang/String;
    goto :goto_7

    .line 871
    :cond_c
    invoke-virtual {p1, v6}, Lcom/getcapacitor/PluginCall;->resolve(Lcom/getcapacitor/JSObject;)V

    .line 872
    .end local v6    # "permissionsResults":Lcom/getcapacitor/JSObject;
    goto :goto_8

    .line 874
    :cond_d
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->resolve()V

    .line 877
    .end local v1    # "permAliases":[Ljava/lang/String;
    .end local v2    # "autoGrantPerms":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v3    # "providedPerms":Lcom/getcapacitor/JSArray;
    .end local v4    # "providedPermsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v5    # "aliasSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :goto_8
    return-void
.end method

.method protected restoreState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "state"    # Landroid/os/Bundle;

    .line 949
    return-void
.end method

.method public saveCall(Lcom/getcapacitor/PluginCall;)V
    .locals 0
    .param p1, "lastCall"    # Lcom/getcapacitor/PluginCall;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 265
    iput-object p1, p0, Lcom/getcapacitor/Plugin;->savedLastCall:Lcom/getcapacitor/PluginCall;

    .line 266
    return-void
.end method

.method protected saveInstanceState()Landroid/os/Bundle;
    .locals 5

    .line 926
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    iget-object v1, p0, Lcom/getcapacitor/Plugin;->lastPluginCallId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/getcapacitor/Bridge;->getSavedCall(Ljava/lang/String;)Lcom/getcapacitor/PluginCall;

    move-result-object v0

    .line 928
    .local v0, "savedCall":Lcom/getcapacitor/PluginCall;
    if-nez v0, :cond_0

    .line 929
    const/4 v1, 0x0

    return-object v1

    .line 932
    :cond_0
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 933
    .local v1, "ret":Landroid/os/Bundle;
    invoke-virtual {v0}, Lcom/getcapacitor/PluginCall;->getData()Lcom/getcapacitor/JSObject;

    move-result-object v2

    .line 935
    .local v2, "callData":Lcom/getcapacitor/JSObject;
    if-eqz v2, :cond_1

    .line 936
    const-string v3, "_json"

    invoke-virtual {v2}, Lcom/getcapacitor/JSObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v3, v4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 939
    :cond_1
    return-object v1
.end method

.method public setBridge(Lcom/getcapacitor/Bridge;)V
    .locals 0
    .param p1, "bridge"    # Lcom/getcapacitor/Bridge;

    .line 217
    iput-object p1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    .line 218
    return-void
.end method

.method public setPluginHandle(Lcom/getcapacitor/PluginHandle;)V
    .locals 0
    .param p1, "pluginHandle"    # Lcom/getcapacitor/PluginHandle;

    .line 234
    iput-object p1, p0, Lcom/getcapacitor/Plugin;->handle:Lcom/getcapacitor/PluginHandle;

    .line 235
    return-void
.end method

.method public shouldOverrideLoad(Landroid/net/Uri;)Ljava/lang/Boolean;
    .locals 1
    .param p1, "url"    # Landroid/net/Uri;

    .line 1015
    const/4 v0, 0x0

    return-object v0
.end method

.method protected startActivityForResult(Lcom/getcapacitor/PluginCall;Landroid/content/Intent;I)V
    .locals 1
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "resultCode"    # I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1030
    iget-object v0, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v0, p1, p2, p3}, Lcom/getcapacitor/Bridge;->startActivityForPluginWithResult(Lcom/getcapacitor/PluginCall;Landroid/content/Intent;I)V

    .line 1031
    return-void
.end method

.method public startActivityForResult(Lcom/getcapacitor/PluginCall;Landroid/content/Intent;Ljava/lang/String;)V
    .locals 2
    .param p1, "call"    # Lcom/getcapacitor/PluginCall;
    .param p2, "intent"    # Landroid/content/Intent;
    .param p3, "callbackName"    # Ljava/lang/String;

    .line 174
    invoke-direct {p0, p1, p3}, Lcom/getcapacitor/Plugin;->getActivityLauncherOrReject(Lcom/getcapacitor/PluginCall;Ljava/lang/String;)Landroidx/activity/result/ActivityResultLauncher;

    move-result-object v0

    .line 175
    .local v0, "activityResultLauncher":Landroidx/activity/result/ActivityResultLauncher;, "Landroidx/activity/result/ActivityResultLauncher<Landroid/content/Intent;>;"
    if-nez v0, :cond_0

    .line 177
    return-void

    .line 179
    :cond_0
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v1, p1}, Lcom/getcapacitor/Bridge;->setPluginCallForLastActivity(Lcom/getcapacitor/PluginCall;)V

    .line 180
    invoke-virtual {p1}, Lcom/getcapacitor/PluginCall;->getCallbackId()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/getcapacitor/Plugin;->lastPluginCallId:Ljava/lang/String;

    .line 181
    iget-object v1, p0, Lcom/getcapacitor/Plugin;->bridge:Lcom/getcapacitor/Bridge;

    invoke-virtual {v1, p1}, Lcom/getcapacitor/Bridge;->saveCall(Lcom/getcapacitor/PluginCall;)V

    .line 182
    invoke-virtual {v0, p2}, Landroidx/activity/result/ActivityResultLauncher;->launch(Ljava/lang/Object;)V

    .line 183
    return-void
.end method
