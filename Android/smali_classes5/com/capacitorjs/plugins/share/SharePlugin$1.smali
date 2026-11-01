.class Lcom/capacitorjs/plugins/share/SharePlugin$1;
.super Landroid/content/BroadcastReceiver;
.source "SharePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/capacitorjs/plugins/share/SharePlugin;->load()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/capacitorjs/plugins/share/SharePlugin;


# direct methods
.method constructor <init>(Lcom/capacitorjs/plugins/share/SharePlugin;)V
    .locals 0
    .param p1, "this$0"    # Lcom/capacitorjs/plugins/share/SharePlugin;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 38
    iput-object p1, p0, Lcom/capacitorjs/plugins/share/SharePlugin$1;->this$0:Lcom/capacitorjs/plugins/share/SharePlugin;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .line 43
    const-string v0, "_share_nonce"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 44
    .local v0, "receivedNonce":Ljava/lang/String;
    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/capacitorjs/plugins/share/SharePlugin$1;->this$0:Lcom/capacitorjs/plugins/share/SharePlugin;

    invoke-static {v1}, Lcom/capacitorjs/plugins/share/SharePlugin;->-$$Nest$fgetexpectedNonce(Lcom/capacitorjs/plugins/share/SharePlugin;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_1

    .line 50
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x21

    const-string v3, "android.intent.extra.CHOSEN_COMPONENT"

    if-lt v1, v2, :cond_1

    .line 51
    const-class v1, Landroid/content/ComponentName;

    invoke-virtual {p2, v3, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ComponentName;

    .local v1, "component":Landroid/content/ComponentName;
    goto :goto_0

    .line 53
    .end local v1    # "component":Landroid/content/ComponentName;
    :cond_1
    iget-object v1, p0, Lcom/capacitorjs/plugins/share/SharePlugin$1;->this$0:Lcom/capacitorjs/plugins/share/SharePlugin;

    invoke-static {v1, p2, v3}, Lcom/capacitorjs/plugins/share/SharePlugin;->-$$Nest$mgetParcelableExtraLegacy(Lcom/capacitorjs/plugins/share/SharePlugin;Landroid/content/Intent;Ljava/lang/String;)Landroid/content/ComponentName;

    move-result-object v1

    .line 57
    .restart local v1    # "component":Landroid/content/ComponentName;
    :goto_0
    if-eqz v1, :cond_2

    .line 58
    iget-object v2, p0, Lcom/capacitorjs/plugins/share/SharePlugin$1;->this$0:Lcom/capacitorjs/plugins/share/SharePlugin;

    invoke-static {v2, v1}, Lcom/capacitorjs/plugins/share/SharePlugin;->-$$Nest$fputchosenComponent(Lcom/capacitorjs/plugins/share/SharePlugin;Landroid/content/ComponentName;)V

    .line 59
    iget-object v2, p0, Lcom/capacitorjs/plugins/share/SharePlugin$1;->this$0:Lcom/capacitorjs/plugins/share/SharePlugin;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/capacitorjs/plugins/share/SharePlugin;->-$$Nest$fputexpectedNonce(Lcom/capacitorjs/plugins/share/SharePlugin;Ljava/lang/String;)V

    .line 61
    :cond_2
    return-void

    .line 46
    .end local v1    # "component":Landroid/content/ComponentName;
    :cond_3
    :goto_1
    return-void
.end method
