.class Lcom/getcapacitor/plugin/SystemBars$1;
.super Lcom/getcapacitor/WebViewListener;
.source "SystemBars.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getcapacitor/plugin/SystemBars;->handleOnStart()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getcapacitor/plugin/SystemBars;


# direct methods
.method public static synthetic $r8$lambda$rPqP4VK0XHK3XwLa6puluuyf__U(Lcom/getcapacitor/plugin/SystemBars$1;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/getcapacitor/plugin/SystemBars$1;->lambda$onPageCommitVisible$0(Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Lcom/getcapacitor/plugin/SystemBars;)V
    .locals 0
    .param p1, "this$0"    # Lcom/getcapacitor/plugin/SystemBars;
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 92
    iput-object p1, p0, Lcom/getcapacitor/plugin/SystemBars$1;->this$0:Lcom/getcapacitor/plugin/SystemBars;

    invoke-direct {p0}, Lcom/getcapacitor/WebViewListener;-><init>()V

    return-void
.end method

.method private synthetic lambda$onPageCommitVisible$0(Ljava/lang/String;)V
    .locals 2
    .param p1, "res"    # Ljava/lang/String;

    .line 97
    iget-object v0, p0, Lcom/getcapacitor/plugin/SystemBars$1;->this$0:Lcom/getcapacitor/plugin/SystemBars;

    const-string v1, "true"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {v0, v1}, Lcom/getcapacitor/plugin/SystemBars;->-$$Nest$fputhasViewportCover(Lcom/getcapacitor/plugin/SystemBars;Z)V

    .line 100
    iget-object v0, p0, Lcom/getcapacitor/plugin/SystemBars$1;->this$0:Lcom/getcapacitor/plugin/SystemBars;

    invoke-static {v0}, Lcom/getcapacitor/plugin/SystemBars;->access$100(Lcom/getcapacitor/plugin/SystemBars;)Lcom/getcapacitor/Bridge;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebView;->requestApplyInsets()V

    .line 101
    return-void
.end method


# virtual methods
.method public onPageCommitVisible(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .line 95
    invoke-super {p0, p1, p2}, Lcom/getcapacitor/WebViewListener;->onPageCommitVisible(Landroid/webkit/WebView;Ljava/lang/String;)V

    .line 96
    iget-object v0, p0, Lcom/getcapacitor/plugin/SystemBars$1;->this$0:Lcom/getcapacitor/plugin/SystemBars;

    invoke-static {v0}, Lcom/getcapacitor/plugin/SystemBars;->access$000(Lcom/getcapacitor/plugin/SystemBars;)Lcom/getcapacitor/Bridge;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getcapacitor/Bridge;->getWebView()Landroid/webkit/WebView;

    move-result-object v0

    new-instance v1, Lcom/getcapacitor/plugin/SystemBars$1$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0}, Lcom/getcapacitor/plugin/SystemBars$1$$ExternalSyntheticLambda0;-><init>(Lcom/getcapacitor/plugin/SystemBars$1;)V

    const-string v2, "function capacitorSystemBarsCheckMetaViewport() {\n    const meta = document.querySelectorAll(\"meta[name=viewport]\");\n    if (meta.length == 0) {\n        return false;\n    }\n    // get the last found meta viewport tag\n    const metaContent = meta[meta.length - 1].content;\n    return metaContent.includes(\"viewport-fit=cover\");\n}\ncapacitorSystemBarsCheckMetaViewport();\n"

    invoke-virtual {v0, v2, v1}, Landroid/webkit/WebView;->evaluateJavascript(Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    .line 102
    return-void
.end method
