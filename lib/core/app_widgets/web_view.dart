import 'dart:async';
import 'dart:math';
import 'package:app_core_module/core/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_core_module/core/utils/app_logger.dart';
import 'package:webviewx/webviewx.dart';

class WebScreen extends StatefulWidget {
  final String url;
  final String? title;

  const WebScreen({
    super.key,
    required this.url,
    this.title,
  });

  static Widget newInstance({
    required String url,
    String? title,
  }) {
    return ChangeNotifierProvider<WebViewStateProvider>.value(
      value: WebViewStateProvider(),
      child: WebScreen(
        url: url,
        title: title,
      ),
    );
  }

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen> {
  // final InAppWebViewSettings _options = InAppWebViewSettings(
  //   javaScriptCanOpenWindowsAutomatically: true,
  //   javaScriptEnabled: true,
  //   cacheEnabled: true,
  //   supportZoom: false,
  //   domStorageEnabled: true,
  //   allowsBackForwardNavigationGestures: true,
  //   allowsLinkPreview: true,
  //   sharedCookiesEnabled: true,
  //   iframeAllow: "camera; microphone",
  //   iframeAllowFullscreen: true,
  // );
  //
  // InAppWebViewController? webViewController;

  late WebViewXController _webViewController;
  Size get screenSize => MediaQuery.of(context).size;

  @override
  void initState() {
    _webViewController = WebViewXController(
        initialContent: widget.url,
      initialSourceType: SourceType.URL,
      ignoreAllGestures: false,
    );
    super.initState();
  }

  Widget _buildWebViewX() {
    return WebViewX(
      key: const ValueKey('webviewx'),
      onWebViewCreated: (controller) => _webViewController = controller,
      onPageStarted: (src) =>
          debugPrint('A new page has started loading: $src\n'),
      onPageFinished: (src) =>
          debugPrint('The page has finished loading: $src\n'),
      dartCallBacks: {
        DartCallback(
          name: 'TestDartCallback',
          callBack: (msg) => showSnackBar(msg.toString(), context),
        ),
      },
      webSpecificParams: const WebSpecificParams(
        printDebugInfo: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WebViewStateProvider>(
      builder: (context, state, child) {
        return Scaffold(
          backgroundColor: context.getBrightnessBG,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: context.getBrightnessBG,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(widget.title ?? ""),
            centerTitle: true,
          ),
          body: state.loadingWebView
              ? const Center(child: CircularProgressIndicator())
              : _getWebBody(state),
        );
      },
    );
  }

  Widget _getWebBody(WebViewStateProvider state) {
    return Stack(
      children: [
        // InAppWebView(
        //   initialUrlRequest: URLRequest(
        //     url: WebUri(widget.url),
        //   ),
        //   initialSettings: _options,
        //   onWebViewCreated: (controller) async {
        //     webViewController = controller;
        //     context.read<WebViewStateProvider>().changeLoadingState(false);
        //   },
        //   onReceivedError: (ctr, uri, msg) {
        //     AppLogger.e("Web load view $uri error - $msg");
        //   },
        //   onLoadStart: (controller, url) async {},
        //   onLoadStop: (controller, url) async {},
        //   onDownloadStartRequest: (controller, request) async {},
        //   onLoadResourceWithCustomScheme: (controller, resource) {
        //     AppLogger.d('loaded resource - ${resource.url}');
        //     return Future(() => null);
        //   },
        //   onConsoleMessage: (_, message) {
        //     AppLogger.e1('console message - ${message.message}');
        //   },
        // ),
        Visibility(
          visible: state.loadingWebView,
          replacement: const SizedBox(),
          child: const Center(child: CircularProgressIndicator()),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //webViewController?.dispose();
    super.dispose();
  }
}

class WebViewStateProvider extends ChangeNotifier {
  bool _loadingWebView = false;

  bool get loadingWebView => _loadingWebView;

  void changeLoadingState(bool value) {
    _loadingWebView = value;
    notifyListeners();
  }
}


void showAlertDialog(String content, BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => WebViewAware(
      child: AlertDialog(
        content: Text(content),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Close'),
          ),
        ],
      ),
    ),
  );
}

void showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 1),
      ),
    );
}

Widget createButton({
  VoidCallback? onTap,
  required String text,
}) {
  return ElevatedButton(
    onPressed: onTap,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
    ),
    child: Text(text),
  );
}